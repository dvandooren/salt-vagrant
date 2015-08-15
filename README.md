# Salt Vagrant - Setup a simple saltstack env via ansible & vagrant

This is just a basic Ansible role to configure a basic SaltStack setup with a master and minions.

The role installs the required software on CentOS/RHEL systems, and auto accepts the minions keys

Stand up the master (1) and minion (2) VMs via ```vagrant up```.

If you want to change the number of minions, just edit the vagrant-servers.yml and the Vagrantfile will create the VMs and create the proper Ansible hosts file as envs/vagrant.hosts

Once the VMs are running just run the following command to run the Ansible playbook.

```Shell
ansible-playbook -i envs/vagrant.hosts -e @envs/vagrant.config -e @envs/vagrant.secret install_salt.yml
    -or-
./scripts/env-ansible.sh vagrant install_salt.yml
```
