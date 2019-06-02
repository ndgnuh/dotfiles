ls | grep -v .sh | grep -v .js | grep -v list | xargs -I {} adb push {} /sdcard/Music
adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///sdcard
