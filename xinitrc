#!/bin/sh

#[[ -f ~/.xinerama ]] && ~/.xinerama
#[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap dx #kinesis
xsetroot -cursor_name left_ptr
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
exec dbus-launch herbstluftwm
