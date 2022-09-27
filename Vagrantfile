# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant box available: https://app.vagrantup.com/bento/boxes/ubuntu-20.04

BASE_IMAGE = "bento/ubuntu-20.04"

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BASE_IMAGE
  config.vm.hostname = "master"
  config.vm.network :private_network, ip: "192.168.33.10"
  
  # Install XRT (and dependencies)
  config.vm.provision :shell, path: "bootstrap.sh"
  
  # Set XRT Env Variables (/etc/profile.d/*.sh scripts are run at the startup)
  config.vm.provision "shell", inline: "echo \"export XRT_LICENSE_FILE=/vagrant/license.json\" > /etc/profile.d/xrt_env1.sh", run: "always"
  config.vm.provision "shell", inline: "cp /opt/iotech/xrt/2.0/bin/env.sh /etc/profile.d/xrt_env2.sh", run: "always"
  
  config.ssh.forward_agent = true
  config.vm.boot_timeout = 300
end

