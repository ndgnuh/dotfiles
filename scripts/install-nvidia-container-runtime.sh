#!/bin/sh
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey > /tmp/nvidia-container-runtime
gnupg --dearmor /tmp/nvidia-container-runtime
if [ $? -ne 0 ]; then
  "Install CURL and GnuPG first"
fi
sudo mv /tmp/nvidia-container-runtime.gpg /etc/apt/trusted.gpg.d/
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
distribution=debian11
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
sudo apt-get update
sudo apt-get -y install nvidia-container-runtime
