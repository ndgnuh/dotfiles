#!/bin/sh
 
res=$(echo "lock|logout|reboot|shutdown|hibernate" | rofi -sep "|" -dmenu -i -p 'Power Menu: ' "" -width 9 -l 5 -hide-scrollbar -eh 4 -location 3 -yoffset 20 -padding 12 -opacity 100 -font "Misc Tamsyn 9" -auto-select -no-fullscreen) 
 
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
