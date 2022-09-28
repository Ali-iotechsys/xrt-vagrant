# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant box available: https://app.vagrantup.com/bento/boxes/ubuntu-20.04

BASE_IMAGE = "bento/ubuntu-20.04"

# Number of nodes
node_count = 1  
if ENV['NODE_COUNT']
  node_count = ENV['NODE_COUNT'].to_i  
end

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|  
  # Create 'n' nodes
  (1..node_count).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      # Set base image
      subconfig.vm.box = BASE_IMAGE  
    
      # Set hostname
      subconfig.vm.hostname = "node#{i}"
    
      # Setting up private_network to have virtual host
      subconfig.vm.network :private_network, ip: "192.168.33.#{i + 10}"   
    end
  end
  
  # Install XRT (and dependencies)
  config.vm.provision :shell, path: "bootstrap.sh"
  
  # Set XRT Env Variables (/etc/profile.d/*.sh scripts are run at the startup)
  config.vm.provision "shell", inline: "echo \"export XRT_LICENSE_FILE=/vagrant/license.json\" > /etc/profile.d/xrt_env1.sh", run: "always"
  config.vm.provision "shell", inline: "cp /opt/iotech/xrt/2.0/bin/env.sh /etc/profile.d/xrt_env2.sh", run: "always"
  
  # Other setttings    
  config.ssh.forward_agent = true
  config.vm.boot_timeout = 300
end

