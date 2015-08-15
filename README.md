# Ansible Role - Setup a simple saltstack env via ansible

This is just a basic Ansible role to configure a basic SaltStack setup with a master and minions.

The role installs the required software on CentOS/RHEL systems, and auto accepts the minions keys

There's also a Vagrantfile which will stand up the master and minion VMs. Just edit the vagrant-servers.yml and the Vagrantfile will create the VMs and create the proper Ansible hosts file as envs/vagrant.hosts

Once the VMs are running just run the following command to run the Ansible playbook.

```Shell
ansible-playbook -i envs/vagrant.hosts -e @envs/vagrant.config -e @envs/vagrant.secret install_salt.yml
    -or-
./scripts/env-ansible.sh vagrant install_salt.yml
```
