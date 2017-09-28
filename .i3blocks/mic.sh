#!/bin/bash

if [ $BLOCK_BUTTON -eq 1 ]; then
  pulseaudio-ctl mute-input
elif [ $BLOCK_BUTTON -eq 3 ]; then
  i3-msg exec "termite --exec=alsamixer" > /dev/null
fi

MIC=$(pulseaudio-ctl full-status | cut -d " " -f3)

if [[ "${MIC}" == "no" ]]; then
  MIC="violet'>"
else
  MIC="golden rod'>"
fi

echo "<span color='${MIC}</span>"
