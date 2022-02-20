#!/bin/sh

pactl subscribe 2>&1 | grep --line-buffered sink | {
	while read line;
	do
		echo "Line: $line"
		args="$(pulsemixer --get-mute) $(pulsemixer --get-volume)"
		args=$(echo $args | sed 's/ /,/g')
		awesome-client "awesome.emit_signal('pulseaudio', $args)"
	done
}
