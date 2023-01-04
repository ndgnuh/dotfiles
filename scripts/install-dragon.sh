#!/bin/sh
origdir=$PWD

 
# DOWNLOAD
cd /tmp
git clone https://github.com/mwh/dragon.git dragon --depth 1
cd dragon

# MAKE
sudo apt install --mark-auto libgtk-3-dev -y
make 
sudo cp dragon /usr/local/bin
sudo apt auto-remove -y

# CLEANUP
cd /tmp
rm dragon -rf
cd $origdir
