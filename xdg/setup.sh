#!/bin/sh
ls | grep -v setup.sh | xargs -I {} ln -sf $(realpath {}) ~/.config
