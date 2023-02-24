#!/usr/bin/bash

windowid="$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')"

if [ "$windowid" == '0x0' ];
then
    echo 'Arch'
elif [ -z "$windowid" ] 
then
    echo 'Arch'
else
    preprint="$(xprop -id $windowid WM_CLASS | awk '{print $4}' | tr -d '"')"
    echo ${preprint}
fi
