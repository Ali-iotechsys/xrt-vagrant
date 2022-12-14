# xrt-vagrant
This repo shows how to setup a number of XRT VMs using Vagrant, and run XRT example(s)

## Prerequisites
- clone this repo, and change directory to `xrt-vagrant`
- clone [XRT Examples](https://github.com/IOTechSystems/xrt-examples) repo
- ensure have a valid XRT license file (e.g. `license.json`)
- now should have the current files and directory: `bootstrap.sh  license.json  README.md  Vagrantfile  xrt-examples`

## Create XRT VM(s)
The following instuctions are to create one XRT node, you can set `NODE_COUNT` if need more than one node:
- `$ NODE_COUNT=1 vagrant up`
- `$ vagrant ssh node1`
- `vagrant@node1:~$ echo ${XRT_LICENSE_FILE}`
- `vagrant@node1:~$ which xrt`

## Run an XRT Example
The following instuctions are to run BACnet/IP Device Service:
- `vagrant@node1:~$ cd /vagrant/xrt-examples/DeviceServices/bacnet-ip`
- `vagrant@node1:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ ./commands/start_device_sim.sh`
- `vagrant@node1:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ export BACNET_IP_SIM_ADDRESS=192.168.33.11 # use 192.168.33.12 for node2, if needed`
- `vagrant@node1:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ . ./commands/set_env_vars.sh`
- `vagrant@node1:/vagrant/xrt-examples/DeviceServices/bacnet-ip$ xrt ./deployment/config/`

## Delete the XRT instance(s)
- `$ NODE_COUNT=1 vagrant destroy -f`
