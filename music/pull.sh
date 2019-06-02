#!/bin/zsh
[[ -z $1 ]] && exit
delim="|"
format=mp3
link=$(echo $1 | awk -F $delim '{print $1}')
realname=$(echo $1      | awk -F $delim '{print $2}' | sed 's/^ *//g'             | sed 's/ *$//g')
artist=$(echo $1        | awk -F $delim '{print $3}' | sed 's/^ *//g'             | sed 's/ *$//g')
album=$(echo $1         | awk -F $delim '{print $4}' | sed 's/^ *//g'             | sed 's/ *$//g')
name=$(echo $realname   | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g'              | sed "s/[:,'\(\)\.&\*]//g")
musicdir=$(echo $artist | sed 's/ /-/g'              | tr '[:upper:]' '[:lower:]' | sed "s/[:,'\(\)\.&\*]//g"  )
[[ -z $album ]] && musicdir="$musicdir/$(echo $album | sed 's/ /-/g' |  tr '[:upper:]' '[:lower:]' | sed "s/[:,'\.\(\)&\*]//g")"

if [[ -f $musicdir/$name.$format ]]; then
	echo "$name.$format exists, exiting"
else
	echo "Downloading '$realname' by '$artist'..."
	youtube-dl -x --audio-format $format --audio-quality 0 -o "$musicdir/$name.webm" "$link" --no-part --no-check-certificate
	echo "$name.$format downloaded"
fi
cover="cover/$(cat list_cover | grep $album | awk -F "|" '{print $2}' | sed 's/^ *//g' | sed 's/ *$//g')"
id3tag --song "$realname"  --artist "$artist" --album "$album" "$musicdir/$name.$format" 
# [[ -f $cover ]] && id3v2 --APIC $cover "$musicdir/$name.$format"
