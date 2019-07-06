#!/bin/sh
[ -z $music_dir ] && music_dir=output
delim="|"
format=mp3

name_normalize () {
	echo $1 | sed -e 's/^ *//g' \
		-e 's/ *$//g' \
		-e 's/ /-/g' \
		-e 's/\(--*\)/-/g' \
		-e "s/[:,'\(\)\.&\*!]//g" \
		-e 's/"//g' \
		| tr '[:upper:]' '[:lower:]'
}

pull() {
	s_link=$(echo $1   | awk -F $delim '{print $1}')
	s_name=$(echo $1   | awk -F $delim '{print $2}')
	s_artist=$(echo $1 | awk -F $delim '{print $3}')
	s_album=$(echo $1  | awk -F $delim '{print $4}')
	song_path=$music_dir/$(name_normalize $s_name).$format
	if [ -f $song_path ];
	then
		echo "$song_path exists, exiting"
	else
		echo "Downloading $s_name by $s_artist..."
		youtube-dl -x --audio-format $format -o $song_path $s_link &
	fi
}

[ -d $music_dir ] && mkdir $music_dir
cat list | sed '/#.*/d;//d' | while read -r line
do
	pull "$line"
done
wait
