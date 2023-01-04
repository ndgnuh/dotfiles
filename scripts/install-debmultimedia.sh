#!/bin/sh
echo 'deb https://www.deb-multimedia.org bullseye main non-free' | sudo tee /etc/apt/sources.list.d/deb-multimedia.list

# KEYRING
# The "-oAcquire::AllowInsecureRepositories=true" option is mandatory since Buster and thus also needed for unstable.
sudo apt-get update -oAcquire::AllowInsecureRepositories=true
sudo apt-get install deb-multimedia-keyring
sudo apt-get update
