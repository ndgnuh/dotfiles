#!/bin/sh

yes_or_no() {
	result=""
	while [ "$result" != "n" ] && [ "$result" != 'y' ]; do
		read result
		result=$(echo $result | tr '[[:upper:]]' '[[:lower:]]')
	done
	printf "%s" $result
}

for f in .config/*; do
	result=""
	while [ "$result" != "n" ] && [ "$result" != "y" ]; do
		printf "%s" "Install $f? (Y/N) "
		result=$(yes_or_no $f)
	done
	if [ "$result" = "n" ]; then
		continue
	fi
	dest="$HOME/$f"
	if [ -e $dest ]; then
		rm -rf $dest
	fi
	ln -sf "$PWD/$f" "$dest"
	echo "Symlink $f -> $dest"
	# result=$(yes_or_no)
done
# ln -s $PWD/.config/fontconfig/ $HOME/.config/fontconfig
# ln -s /home/hung/Projects/dotfiles/.config/nvim/ $HOME/.config/fontconfig
