#!/bin/sh

setxkbmap dx kinesis
xsetroot -cursor_name left_ptr
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# set the wallpaper
if [ -x /usr/bin/feh ] ; then
    feh --bg-fill ~/Dropbox/.wallpaper/paraglider.jpg
fi

# activate compositing
if [ -x /usr/bin/compton ] ; then
    compton -cC -i 0.9 -e 0.6 -f &
fi

# hide the mouse pointer when not needed
if [ -x /usr/bin/unclutter ] ; then
    unclutter &
fi

# start the dropbox client
if [ -x /opt/bin/dropbox ] ; then
    dropbox &
fi

exec dbus-launch herbstluftwm
