dotfiles
========

As the name suggests, this is my personal collection of dotfiles.  I use these on a laptop and two stand-alone pc's each running ArchLinux, Xmonad and dzen2 together with a Dvorak Keyboard Layout variant for easy programming and typing Umlauts that is suitable for a Kinesis Advantage Ergonomic Keyboard (see the dx-file).

In order to get the full Xmonad experience from the configuration files, you should make sure that at least the following programs are installed.

- gvim
- xterm
- zsh
- tmux
- ghc, xmonad, xmonad-contrib
- dmenu
- dzen2
- conky
- xscreensaver
- pcmanfm
- xpdf or evince
- firefox (or equivalent, I use Pentadactyl)
- trayer
- unclutter

Also make sure that you have a dbus-daemon running.

Install
=======

Run ./create-links from the folder into which you cloned the git repository.  Copy xmonad.hs into ~/.xmonad/.  Copy dx into /usr/share/X11/xkb/symbols/ and change the file /etc/X11/xorg.conf.d/10-evdev.conf appropriately, so you have something such as

Section "InputClass"
        Identifier "evdev keyboard catchall"
        MatchIsKeyboard "on"
        MatchDevicePath "/dev/input/event*"
        Driver "evdev"
        Option "XkbLayout" "dx"
        Option "XkbVariant" "kinesis"
EndSection

in the file.
