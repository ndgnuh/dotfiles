if command -v nala 2>&1 > /dev/null; then
	pm=nala
else
	pm=apt
fi
echo "Using $pm as package manager"
