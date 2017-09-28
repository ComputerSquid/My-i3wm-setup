#!/bin/bash

if [ $BLOCK_BUTTON -eq 1 ]; then
  termite --exec=pacaur\ -Syu 
  notify-send "System Updated."
fi

NO=$(checkupdates | wc -l)

if [ $NO = 0 ]; then
  COLOR="lime green"
elif [ $NO -le 30 ]; then
  COLOR="golden rod"
else
  COLOR="red"
fi

echo "<span color='${COLOR}'></span>  ${NO}"
