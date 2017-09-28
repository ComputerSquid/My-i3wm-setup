#!/bin/bash

if [ $BLOCK_BUTTON -eq 1 ]; then
  i3-msg exec "termite --exec=ranger" > /dev/null
fi

PERC=$(df -h --output=source,pcent | grep sda7 | grep -o '[0-9]\+%')

if [[ ${#PERC} -eq 2 ]]; then
  PERC="0${PERC}"
fi

echo "<span color='violet'></span>  ${PERC}"
