#!/bin/bash

PERC=$(light)

PERC=$(printf "%.0f" ${PERC})

echo "<span color='gold' font_weight='bold'></span> ${PERC}%"
