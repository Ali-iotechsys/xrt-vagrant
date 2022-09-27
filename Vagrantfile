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
  
  # Set XRT Env Variables 
  config.vm.provision "shell", inline: "> /etc/profile.d/myvars.sh", run: "always"
  config.vm.provision "shell", inline: "echo \"export XRT_LICENSE_FILE=/vagrant/license.json\" >> /etc/profile.d/myvars.sh", run: "always"
  config.vm.provision "shell", inline: "echo \"export PATH=$PATH:/opt/iotech/xrt/2.0/bin\" >> /etc/profile.d/myvars.sh", run: "always"
  config.vm.provision "shell", inline: "echo \"export LD_LIBRARY_PATH=/opt/iotech/xrt/2.0/lib\" >> /etc/profile.d/myvars.sh", run: "always"
  
  # Install XRT (and dependencies)
  config.vm.provision :shell, path: "bootstrap.sh"
  config.ssh.forward_agent = true
  config.vm.boot_timeout = 300
end

