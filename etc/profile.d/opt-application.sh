#!/bin/sh

if [ -z "$(ls -A /opt)" ]; then
	exit
fi

for app in /opt/*; do
	if [ -d $app/bin ]; then
		export PATH=$app/bin:$PATH
	fi
	if [ -d $app/lib ]; then
		export LD_LIBRARY_LOADPATH=$app/lib:$LD_LIBRARY_LOADPATH
	fi
	if [ -d $app/lib64 ]; then
		export LD_LIBRARY_LOADPATH=$app/lib64:$LD_LIBRARY_LOADPATH
	fi
done
