#!/bin/bash

PERC=$(light)

PERC=$(printf "%.0f" ${PERC})

echo "<span color='#ffb64c' font_weight='bold'></span> ${PERC}%"
