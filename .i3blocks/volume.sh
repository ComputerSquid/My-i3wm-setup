#!/bin/bash

if [ $BLOCK_BUTTON -eq 1 ]; then
  pulseaudio-ctl mute
elif [ $BLOCK_BUTTON -eq 3 ]; then
  i3-msg exec "termite --exec=alsamixer" > /dev/null
elif [ $BLOCK_BUTTON -eq 4 ]; then
  pulseaudio-ctl up 10
elif [ $BLOCK_BUTTON -eq 5 ]; then
  pulseaudio-ctl down 10
fi

VOLUME=$(pulseaudio-ctl full-status | cut -d " " -f1)
MUTE=$(pulseaudio-ctl full-status | cut -d " " -f2)

if [[ "${MUTE}" == "no" ]]; then
  MUTE="violet'>"
else
  MUTE="golden rod'>"
fi

echo "<span color='${MUTE}</span>  ${VOLUME}%"
