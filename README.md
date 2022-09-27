# xrt-vagrant
This is demo for an example of XRT device service using Vagrant

## Prerequisites
- clone this repo, and change directory to `xrt-vagrant`
- clone `https://github.com/IOTechSystems/xrt-examples.git`
- ensure have a valid XRT license file (e.g. `license.json`)
- now should have the current files and directory: `bootstrap.sh  license.json  README.md  Vagrantfile  xrt-examples`

## Create the XRT VM
- `$ vagrant up`
- `$ vagrant ssh`
- `vagrant@master:~$ echo ${XRT_LICENSE_FILE}`
- `vagrant@master:~$ which xrt`

## Run an XRT Example (e.g. BACnet/IP Device Service)
- `vagrant@master:~$ cd /vagrant/xrt-examples/DeviceServices/bacnet-ip`
- `vagrant@master:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ ./commands/start_device_sim.sh`
- `vagrant@master:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ export BACNET_IP_SIM_ADDRESS=192.168.33.10`
- `vagrant@master:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ . ./commands/set_env_vars.sh`
- `vagrant@master:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ xrt ./deployment/config/`
