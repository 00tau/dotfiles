#!/bin/sh

herbstclient pad 0 22
herbstclient pad 1 22

# To restart a running tint2 you may also use:
# killall -SIGUSR1 tint2
# This will force tint2 to reload!

killall tint2
tint2 &
