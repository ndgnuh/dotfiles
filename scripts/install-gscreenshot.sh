#!/bin/sh
if command -v nala; then
	ic=nala
else
	ic=apt-get
fi
pip3 install git+https://github.com/thenaterhood/gscreenshot
sudo $ic install imagemagick -y
