#!/bin/bash

if [ $BLOCK_BUTTON -eq 1 ]; then
  i3-msg exec "termite --exec=htop" > /dev/null
fi

USAGE=$(mpstat 2 1 | tail -n 1 | awk -F ' ' '{print int(100-$12)}')

if [[ ${USAGE} -le 50 ]]; then
  COLOR="lime green"
elif [[ ${USAGE} -le 75 ]]; then
  COLOR="yellow"
else
  COLOR="red"
fi

if [[ ${USAGE} -le 9 ]]; then
  USAGE="0${USAGE}"
fi

echo "<span color='${COLOR}'></span>  ${USAGE}%"
