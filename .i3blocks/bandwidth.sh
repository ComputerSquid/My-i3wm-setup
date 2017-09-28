#!/bin/bash

if [ $BLOCK_BUTTON -eq 1 ]; then
  i3-msg exec "termite --exec=sudo\ nethogs" > /dev/null

fi

RXPREV=`cat /sys/class/net/wlp58s0/statistics/rx_bytes`
TXPREV=`cat /sys/class/net/wlp58s0/statistics/tx_bytes`
sleep 1

RX=`cat /sys/class/net/wlp58s0/statistics/rx_bytes`
TX=`cat /sys/class/net/wlp58s0/statistics/tx_bytes`

let BWRX=($RX-$RXPREV)/1024
let BWTX=($TX-$TXPREV)/1024

echo "<span color='royal blue'></span>  $BWRX KB/s <span color='dark orchid'></span>  $BWTX KB/s"
