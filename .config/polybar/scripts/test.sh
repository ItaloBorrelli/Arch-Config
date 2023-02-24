#!/usr/bin/bash
windowid="$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')"

preprint=''

if [ $windowid != '0x0' ]
then
    preprint="$(xprop -id $windowid WM_CLASS | awk '{print $4}' | tr -d '"')"
    echo ${preprint^^}
else
    echo 'MANJARO'
fi
