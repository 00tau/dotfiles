#!/bin/sh
if [ -x /usr/bin/trayer ] ; then
  trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --height 18 --transparent true --alpha 0 --tint 0x000000 &
fi

if [ -x /usr/bin/wicd-gtk ] ; then
  wicd-gtk -t &
fi

if [ -x /usr/bin/dropboxd ] ; then
  dropboxd &
fi
