#!/bin/bash

# Automates mounting VMWare Tools to VM and installing distrib
#
# PREREQUISITE:
# Go to WMWare Fusion > Virtual Machine Menu > Install VMware Tools (or VM > Install VMware Tools).
#
# MORE INFO:
# http://kb.vmware.com/selfservice/microsites/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=1022525

sudo mkdir /mnt/cdrom

# mount rom
sudo mount /dev/sr0 /mnt/cdrom

# alternative mount option
# sudo mount /dev/cdrom /mnt/cdrom

# get name of bundle and set as path
path_to_bundle=$(find /mnt/cdrom -name 'VM*')

# open it up
tar xzvf $path_to_bundle -C /tmp/

# move into dir
cd /tmp/vmware-tools-distrib/

# install VMWware Tools
sudo ./vmware-install.pl -d

echo "Job is done! You should now reboot the vm."
