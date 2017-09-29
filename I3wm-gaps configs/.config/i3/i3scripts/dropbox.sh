OUTPUT=`dropbox-cli status | head -1`
TEXT=""

if echo $OUTPUT | grep -q '^Up to date' ; then
    COLOR="#8CE000"
else
    if echo $OUTPUT | grep -q '^Dropbox isn' ; then
        COLOR="#FF0000"
    else
        COLOR="#007EE5"
    fi
fi

echo "<span foreground=\"$COLOR\">$TEXT</span>"

# Click to see status:
if [[ $BLOCK_BUTTON == '1' ]]; then
        i3-nagbar -t warning -m "Dropbox: `dropbox-cli status | head -1`"
fi
