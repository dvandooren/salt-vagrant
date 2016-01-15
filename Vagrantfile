# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
vagrantServers = YAML.load_file(File.join(File.dirname(__FILE__), 'vagrant-servers.yml')

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  vagrantServers.each do |role|
    role["servers"].each do |server|
      config.vm.define server["name"] do |srv|
        srv.vm.box = server["box"]
        srv.vm.box_check_update = "false"
        srv.vm.hostname = server["name"]
        srv.vm.network :private_network, ip: server["ip"]
        srv.vm.synced_folder ".", "/vagrant", disabled: true
        srv.vm.provider :virtualbox do |vb|
          vb.name = server["name"]
          vb.memory = server["ram"]
        end
      end
    end
  end

  # Create the anisible inventory file
  require "fileutils"
  f = File.open("envs/vagrant.hosts","w")
  vagrantServers.each do |role|
    f.puts "[#{role["role"]}]"
    role["servers"].each do |server|
      name = server["name"]
      ip = server["ip"]
      f.puts "#{name} ansible_ssh_host=#{ip} ansible_ssh_user=vagrant ansible_sudo=true  ansible_ssh_private_key_file=.vagrant/machines/#{name}/virtualbox/private_key"
    end
  end
  f.close

  # servers.each do |servers|
  #   config.vm.define servers["name"] do |srv|
  #     srv.vm.box = servers["box"]
  #     srv.vm.box_check_update = "false"
  #     srv.vm.hostname = servers["name"]
  #     srv.vm.network :private_network, ip: servers["ip"]
  #     srv.vm.synced_folder ".", "/vagrant", disabled: true
  #     srv.vm.provider :virtualbox do |vb|
  #       vb.name = servers["name"]
  #       vb.memory = servers["ram"]
  #     end
  #   end
  # end

  # # Create the anisible inventory file
  # require "fileutils"
  # f = File.open("envs/vagrant.hosts","w")
  # f.puts "[vms-remotefs]"
  # servers.each do |servers|
  #   name = servers["name"]
  #   ip = servers["ip"]
  #   f.puts "#{name} ansible_ssh_host=#{ip} ansible_ssh_user=vagrant ansible_sudo=true  ansible_ssh_private_key_file=.vagrant/machines/#{name}/virtualbox/private_key"
  # end
  # f.close

end
