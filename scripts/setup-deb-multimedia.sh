#!/bin/sh
echo "
deb https://www.deb-multimedia.org bullseye main non-free
deb https://www.deb-multimedia.org bullseye-backports main" | sudo tee /etc/apt/sources.list.d/deb.multimedia.list
sudo apt-get update -oAcquire::AllowInsecureRepositories=true
sudo apt-get install deb-multimedia-keyring --allow-unauthenticated -y -oAcquire::AllowInsecureRepositories=true
if $!; then
	sudo apt-get update
	sudo apt-get dist-upgrade -y
else
	exit 2
fi
