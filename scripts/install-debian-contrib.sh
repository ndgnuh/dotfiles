# add repository
outfile="/etc/apt/sources.list.d/debian-contrib.list"
arch="$(lsb_release -cs)"
echo "deb http://deb.debian.org/debian/ $arch contrib" | sudo tee $outfile
echo "deb-src http://deb.debian.org/debian/ $arch contrib" | sudo tee $outfile
echo "deb http://security.debian.org/debian-security $arch-security contrib" | sudo tee $outfile
echo "deb-src http://security.debian.org/debian-security $arch-security contrib" | sudo tee $outfile

# update
sudo apt update
