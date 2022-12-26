wget https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/cuda-keyring_1.0-1_all.deb -O /tmp/cuda-keyring.deb
sudo apt-get install /tmp/cuda-keyring.deb -y
sudo add-apt-repository contrib
sudo apt-get update
sudo apt-get -y install cuda
rm /tmp/cuda-keyring.deb
