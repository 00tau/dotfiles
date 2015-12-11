#!/bin/sh

# xrandr --auto --output DVI-I-1 --right-of DVI-I-2 --output DVI-I-2 --rotate left

xsetroot -cursor_name left_ptr

xsetroot -solid '#010101'

# set the wallpaper
if [ -x /usr/bin/feh ] ; then
    eval $(cat ~/.fehbg)
fi

# hide the mouse pointer when not needed
if [ -x /usr/bin/unclutter ] ; then
    unclutter &
fi

# activate compositing
if [ -x /usr/bin/compton ] ; then
    compton -cC -r 5 -I 0.02 -O 0.02 -D 5 -i 1.0 -e 0.6 -m 0.9 -C -f &
fi

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

setxkbmap kp

exec dbus-launch herbstluftwm
