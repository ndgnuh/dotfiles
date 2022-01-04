#!/bin/sh

if [ -z "$1" ]; then
	echo "./download-gfont.sh <FONT NAME>"
	exit 2
fi
font="$1"

wget "https://fonts.google.com/download?family=$font" -O "$font.zip"
