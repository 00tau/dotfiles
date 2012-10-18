#!/bin/sh
[[ -f ~/.xinerama ]] && ~/.xinerama
[[ -f ~/Dropbox/.wallpaper/wood.jpg ]] && feh --bg-fill ~/Dropbox/.wallpaper/wood.jpg
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
exec dbus-launch xmonad
