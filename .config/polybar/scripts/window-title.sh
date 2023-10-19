#!/usr/bin/bash

windowid="$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')"

if [ "$windowid" == '0x0' ];
then
    echo 'Arch'
elif [ -z "$windowid" ] 
then
    echo 'Arch'
else
    class=$(xprop -id $windowid WM_CLASS | awk -F '"' '{print $2}')
    title="$(xprop -id $windowid WM_NAME | awk -F '"' '{print $2}')"
    short_title=$(basename "$title")

    if [[ "$class" == *"google-chrome"* ]] && [[ "$class" == *"Cypress"* ]]; then
	    echo "Cypress"
    elif [[ "$title" == *"VIM"* ]]; then
	    vim_string=$(echo "$title" | sed 's/ - VIM//')
	    if [ ${#vim_string} -le 50 ]; then
		    name=$vim_string
	    else
		    name="$(basename $vim_string)"
	    fi
    elif [ "$class" == "kitty" ]; then
	    name="$title"
    elif [ "$class" == "code" ]; then
	    name="VS Code"
    else
    	name="$class"
    fi
    #add spaces and trim to exactly 50 characters
    #with_spaces="$name                                                  "
    #echo "${with_spaces:0:50}"
    padding_length=$(echo "scale=0; (50 - ${#name}) / 2" | bc)
    padding_spaces=$(printf '%*s' "$padding_length" '')
    centered_string="$padding_spaces$name$padding_spaces"
    if [ $(( ${#centered_string} % 2 )) -eq 1 ]; then
	    centered_string="${centered_string} "
    fi
    echo "$centered_string"
fi
