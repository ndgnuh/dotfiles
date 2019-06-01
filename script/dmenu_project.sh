#!/bin/sh
dir="$(ls -1 $HOME/projects/ | dmenu)"
sakura -d "$HOME/projects/$dir"
