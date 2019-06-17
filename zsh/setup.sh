#!/bin/sh
for f in $(ls theme/ |grep zsh-theme); do
	ln -sf $(realpath theme/$f) $HOME/.oh-my-zsh/custom/themes/
done

if [ -f $HOME/.zshrc ];
then
	mv $HOME/.zshrc $HOME/.zshrc.bak
fi
ln -sf $(realpath zshrc) $HOME/.zshrc
