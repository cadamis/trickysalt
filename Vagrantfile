# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  # configure the master
  config.vm.define :master do |master_config|
    master_config.vm.box = "bento/ubuntu-16.04"
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.10.10"
    master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
    master_config.vm.synced_folder "saltstack/pillar/", "/srv/pillar"
    master_config.vm.synced_folder "saltstack/reactor/", "/srv/reactor"
    master_config.vm.synced_folder "saltstack/master.d/", "/etc/salt/master.d"
    master_config.vm.synced_folder "saltstack/minion.d/", "/etc/salt/minion.d"

    master_config.vm.provision :salt do |salt|
      salt.master_key = "saltstack/keys/master.pem"
      salt.master_pub = "saltstack/keys/master.pub"
      salt.seed_master = {"minion1.local" => "saltstack/keys/minion1.pub", "saltmaster.local" => "saltstack/keys/master_minion.pub",}
      salt.install_master = true
      salt.run_highstate = true
    end
  end

  # configure a salt minion
  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = "bento/ubuntu-16.04"
    minion_config.vm.host_name = 'minion1.local'
    minion_config.vm.network "private_network", ip: "192.168.10.11"
    minion_config.vm.synced_folder "saltstack/minion.d/", "/etc/salt/minion.d"

    minion_config.vm.provision :salt do |salt|
      salt.minion_key = "saltstack/keys/minion1.pem"
      salt.minion_pub = "saltstack/keys/minion1.pub"
      # salt.run_highstate = true
    end
  end
end
