#!/bin/bash
set -e
set -x

# Install dependencies
sudo apt update
apt-get install -y busybox-static fakeroot git pip dmsetup kpartx netcat-openbsd nmap python3-psycopg2 snmp uml-utilities util-linux vlan postgresql wget qemu-system-arm qemu-system-mips qemu-system-x86 qemu-utils vim unzip

# Move to firmadyne dir
#FIRMADYNE_INSTALL_DIR=
#mkdir $FIRMADYNE_INSTALL_DIR
#pushd $FIRMADYNE_INSTALL_DIR

# Install additional deps
pip install git+https://github.com/Trickery710/python-magic
pip install git+https://github.com/Trickery710/jefferson

# Set up firmadyne
#pushd firmadyne
#./download.sh

# Set FIRMWARE_DIR in firmadyne.config
mv firmadyne.config firmadyne.config.orig
echo -e '#!/bin/sh' "\nFIRMWARE_DIR=$(pwd)/" > firmadyne.config
cat firmadyne.config.orig >> firmadyne.config

# Make sure firmadyne user owns this dir
#fix previous error
sudo chown -R 777 firmadyne.config
#sudo chmod -R 777 $FIRMADYNE_INSTALL_DIR
