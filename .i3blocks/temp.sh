#!/bin/bash


TEMP=$(sensors | grep -A 0 'Core 0' | cut -c18-25)

echo "<span color='peru'></span>  ${TEMP}"
