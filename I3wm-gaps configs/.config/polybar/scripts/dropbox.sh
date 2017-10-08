OUTPUT=`dropbox-cli status | head -1`
TEXT=""

if echo $OUTPUT | grep -q '^Up to date' ; then
    TEXT=""
else
    if echo $OUTPUT | grep -q '^Dropbox isn' ; then
        TEXT="%{F#FF0000}"
    else
        TEXT="%{F#007EE5}"
    fi
fi

echo "$TEXT"
