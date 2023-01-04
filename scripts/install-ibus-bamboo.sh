#!/bin/sh
# Ref: https://software.opensuse.org//download.html?project=home%3Alamlng&package=ibus-bamboo
echo 'deb http://download.opensuse.org/repositories/home:/lamlng/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:lamlng.list
curl -fsSL https://download.opensuse.org/repositories/home:lamlng/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_lamlng.gpg > /dev/null
sudo apt update
sudo apt install ibus-bamboo
