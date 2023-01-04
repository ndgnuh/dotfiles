#!/bin/sh
echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main" | sudo tee /etc/apt/sources.list.d/debian-backports.list
sudo apt update
