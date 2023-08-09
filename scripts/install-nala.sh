#!/bin/sh
wget https://gitlab.com/volian/volian-archive/uploads/b20bd8237a9b20f5a82f461ed0704ad4/volian-archive-keyring_0.1.0_all.deb -O /tmp/volian-archive-keyring.deb
wget https://gitlab.com/volian/volian-archive/uploads/d6b3a118de5384a0be2462905f7e4301/volian-archive-nala_0.1.0_all.deb -O /tmp/volian-archive-nala.deb

sudo apt install /tmp/volian-archive-keyring.deb /tmp/volian-archive-nala.deb -y
sudo apt update
sudo apt install nala -y
