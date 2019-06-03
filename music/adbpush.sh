# ls | grep -v .sh | grep -v .js | grep -v list | xargs -I {} adb push {} /sdcard/Music
# adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///sdcard
cd music
adb shell cd /sdcard/Music/; find | tee ../android_file > /dev/null
find | tee ../host_file > /dev/null
diff=$(diff ../android_file ../host_file)

echo $diff | grep \> 
cd ..
