#!/bin/zsh
echo "ASYNCHOROUSLY downloading all the track, please don't close the terminal"
cat list | sed '/^#.*/d' | xargs -d "\n" -P 4 -I {} ./pull.sh {}
wait
