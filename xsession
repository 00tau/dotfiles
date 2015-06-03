#!/bin/sh

# xrandr --auto --output DVI-I-1 --right-of DVI-I-2 --output DVI-I-2 --rotate left

setxkbmap dz kinesis
xsetroot -cursor_name left_ptr

#xsetroot -solid '#5A8E3A'

# set the wallpaper
if [ -x /usr/bin/feh ] ; then
    feh --bg-fill ~/Bilder/.wallpaper/paraglider.jpg
fi

# hide the mouse pointer when not needed
if [ -x /usr/bin/unclutter ] ; then
    unclutter &
fi

# activate compositing
# if [ -x /usr/bin/compton ] ; then
#     compton -cC -r 5 -I 0.02 -O 0.02 -D 5 -i 1.0 -e 0.6 -m 0.9 -C -f &
# fi

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

exec dbus-launch herbstluftwm
