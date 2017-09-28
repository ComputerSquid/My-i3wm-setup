#!/bin/bash

STATE=$(acpi | grep -o 'Charging\|Discharging\|Full')
POWER=$(acpi | grep -o '[0-9]\+%')
TIME=$(acpi | grep -o '[0-9]\+:[0-9]\+')

if [[ "${STATE}" == "Discharging" || "${STATE}" == "Full" ]]; then
  STATE=""
else
  STATE=""
fi

if [[ "${POWER}" == "100%" ]]; then
  COLOR="lime green"
elif [[ "${POWER}" > "80%" ]]; then
  COLOR="lime green"
elif [[ "${POWER}" > "60%" ]]; then
  COLOR="lawn green"
elif [[ "${POWER}" > "40%" ]]; then
  COLOR="yellow"
elif [[ "${POWER}" > "20%" ]]; then
  COLOR="orange"
else
  COLOR="red"
fi

echo "<span color='${COLOR}'>${STATE}</span>  ${POWER} ${TIME}"
