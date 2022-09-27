#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get update

# Install ifconfig  
apt-get install -y net-tools

# Install docker
apt-get install -y docker.io
usermod -aG docker vagrant

# Install xrt
apt-get install -y lsb-release apt-transport-https curl gnupg
curl -fsSL https://iotech.jfrog.io/artifactory/api/gpg/key/public | apt-key add -
echo "deb https://iotech.jfrog.io/iotech/debian-release $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/iotech.list
apt-get update
apt-get install -y iotech-xrt-2.0

# Install mosquitto
apt-get install -y mosquitto-clients
apt-get install -y mosquitto

#export XRT_LICENSE_FILE=/vagrant/license.json
#source /opt/iotech/xrt/2.0/bin/env.sh

# xrt example
# https://github.com/IOTechSystems/xrt-examples/tree/v2.0-branch/DeviceServices/bacnet-ip
