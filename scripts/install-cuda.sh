#!/bin/sh
pkg="nala"
distro="debian11/x86_64"

# Install contrib repo
# ./install-debian-contrib.sh
# deb http://security.debian.org/debian-security bullseye-security main contrib
# deb-src http://security.debian.org/debian-security bullseye-security main contrib

# Install the keyring
wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/cuda-keyring_1.0-1_all.deb -O /tmp/cuda-keyring.deb
sudo $pkg install /tmp/cuda-keyring.deb -y

# Install the repo
echo "deb [signed-by=/usr/share/keyrings/cuda-archive-keyring.gpg] https://developer.download.nvidia.com/compute/cuda/repos/$distro/x86_64/ /" | sudo tee /etc/apt/sources.list.d/cuda-$distro-x86_64.list
wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/x86_64/cuda-$distro.pin
sudo mv cuda-$distro.pin /etc/apt/preferences.d/cuda-repository-pin-600

# install cuda
sudo $pkg update
sudo $pkg -y install cuda
rm /tmp/cuda-keyring.deb

# vim: nowrap
#
