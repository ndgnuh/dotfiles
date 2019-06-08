#!/bin/sh
 
res=$(echo -n "lock\nlogout\nreboot\nshutdown\nhibernate" | ./bemenu.sh)
 
if [ $res = "lock" ]; then
    /usr/local/bin/lock.sh
fi
if [ $res = "logout" ]; then
    loginctl logout
fi
if [ $res = "reboot" ]; then
    loginctl reboot
fi
if [ $res = "shutdown" ]; then
    loginctl poweroff
fi
if [ $res = "hibernate" ]; then
    loginctl hibernate
fi
exit 0
