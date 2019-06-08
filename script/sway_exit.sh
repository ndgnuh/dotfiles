#!/bin/zsh
function swayexit() {
	if [[ $1 == "yes" ]]; then swaymsg exit fi 
}

echo "yes\nno" 
