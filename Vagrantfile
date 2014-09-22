# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "matyunin/centos7"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = 2048
    vb.cpus = 2

    vb.customize ["modifyvm", :id, "--vram", 64]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "selenium-playbook/selenium.yml"
    ansible.verbose = "v"
  end

  config.vm.network "forwarded_port", guest: 4444, host: 49066
end
