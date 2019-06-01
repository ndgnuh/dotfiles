#!/bin/zsh
[[ -d ~/musics ]] || mkdir -p ~/musics
ls | grep -v ".*\.sh" | grep -v list | xargs cp -r ~/musics/
