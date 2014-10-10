# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "rjferguson21/centos7"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = 4096
    vb.cpus = 4

    vb.customize ["modifyvm", :id, "--vram", 64]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "selenium-playbook/selenium.yml"
    ansible.verbose = "v"
  end

  config.vm.network "forwarded_port", guest: 4444, host: 49066
end
