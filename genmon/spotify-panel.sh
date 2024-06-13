#!/bin/bash
player="$(playerctl -a -f 'spotify {{status}}' status | grep Playing | head -n1 | cut -d ' ' -f1)"
if [[ "$player" ]];
then
title="$(playerctl -p spotify metadata title)"
if [ "$(playerctl -p spotify metadata | grep artist)" ];
then
artist="$(playerctl -p spotify metadata artist)"
text="${artist} - ${title}"
fi
else
text="   "
#(( ${#text} > 50 )) && text="${text:0:47}..."
#echo "<tool>$(playerctl -p $player metadata album 2>> /dev/null | sed 's/&/&amp;/')</tool>"
fi
printf "$text" | sed 's/&/&amp;/'
