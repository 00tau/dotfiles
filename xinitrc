#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
sh ~/.wallpaper/wallpaper.sh &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 5 --height 22 --transparent true --tint 0x000000 &
if [ -x /usr/bin/wicd-gtk ] ; then
    wicd-gtk -t &
fi
if [ -x /usr/bin/dropboxd ] ; then
    dropboxd &
fi
exec dbus-launch xmonad
