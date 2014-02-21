#!/bin/bash

sudo mkdir /mnt/cdrom

# mount rom
sudo mount /dev/sr0 /mnt/cdrom

# alternative mount option
# sudo mount /dev/cdrom /mnt/cdrom

# get name of bundle and set as path
# assumes there's only one file name "VMwareTools-...tar.gz"
path_to_bundle=$(find /mnt/cdrom -name 'VM*')

# open it up
tar xzvf $path_to_bundle -C /tmp/

# move into dir
cd /tmp/vmware-tools-distrib/

# install VMWware Tools
sudo ./vmware-install.pl -d

echo "Job is done! You should now reboot."
