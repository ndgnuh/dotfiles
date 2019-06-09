find /usr/local/bin/ -xtype l |xargs rm
ls |grep -v setup.sh |xargs -I {} ln -sf $(realpath {}) /usr/local/bin/

