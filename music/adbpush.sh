ls | grep -v .sh | grep -v .js | grep -v list | xargs -I {} adb push {} /sdcard/Music
