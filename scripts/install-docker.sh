#!/bin/sh
if command -v nala; then
	install_cmd=nala
else
	install_cmd=apt-get
fi

sudo apt-get update

# update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo $install_cmd install ca-certificates curl gnupg

# Add Docker’s official GPG key:
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker
sudo $install_cmd update
sudo $install_cmd install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
