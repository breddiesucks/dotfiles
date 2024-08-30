#!/bin/bash

compositor=picom

if pgrep -x $compositor
then
pkill $compositor
exit
fi

if ! pgrep -x $compositor
then
$compositor &
exit
fi
