#!/bin/bash
FIND_RESULT="$(ps x | grep ibus-daemon | grep -v toggle | grep -v grep | tr -d "\n" | awk '{print $1}')"

if [ ! -z "$FIND_RESULT" ]; then
	echo "kill  $FIND_RESULT";
	kill -9 $FIND_RESULT
else
	echo $FIND_RESULT
	ibus-daemon -rdx
fi
