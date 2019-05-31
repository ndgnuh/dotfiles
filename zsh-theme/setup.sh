#!/bin/sh
for f in $(ls |grep zsh-theme); do
	ln -sf $(realpath $f) $HOME/.oh-my-zsh/custom/themes/
done
