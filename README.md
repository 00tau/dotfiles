dotfiles
========

As the name suggests, this is my personal collection of dotfiles.  I use these
on a laptop and two stand-alone PC's each running (L)ubuntu as the underlying
core system.  But instead of running LXDE, I use herbustluftwm as my window
manager with a tint2 panel.  Together with a custom Dvorak Keyboard Layout
variant for easy programming, typing Umlauts, and tailored to the Kinesis
Advantage Ergonomic Keyboard (see the dx-file), it yields a fruitful touch-typing
DE.

Install
=======

Packages
--------

```
# apt-get install git vim-gtk zsh tmux herbstluftwm tint2 dmenu feh mupdf xdotool unclutter

```

Zsh
---

```
$ which zsh
$ chsh
```

Clone Dotfiles
--------------

```
$ git clone https://github.com/00tau/dotfiles.git ~/.dotfiles
$ git submodule update --init --recursive
$ cd .dotfiles
$ ./create-links
$ ln -s tint2 ~/.config/tint2
$ ln -s herbstluftwm ~/.config/herbstluftwm
$ mkdir ~/.tmp # for vim's backup files
```

LightDM configuration
---------------------

```
# cp custom.desktop /usr/share/X11/xkb/sysmbols
```

DvoraX -- Dvorak Keyboard Layout for Kinesis Advantage
------------------------------------------------------

```
# ln -s dx /usr/share/X11/xkb/symbols/dx
```

Firefox
-------

Don't forget to get the coolest Add-On to Firefox: [Pentadactyl](http://5digits.org/pentadactyl/)
