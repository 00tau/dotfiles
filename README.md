Seebrise
========

It would be far fetched to call Seebrise an actual full fledged desktop
environment. In another sense, though, one may say that Seebrise is also more than just a desktop environment.  It is a collection of dot-files following a common theme for key strokes, short-cuts and a pleasing colour scheme. The following
installation instruction should work with any flavour of Linux.
Essentially, Seebrise is the tiling window manager
[herbustluftwm](http://www.herbstluftwm.org/) together with a
[tint2](http://www.herbstluftwm.org/) panel.  With a custom Dvorak
keyboard layout variant for easy programming, typing umlauts, and tailored to a
non-staggered keyboard -- such as the Kinesis Advantage Ergonomic Keyboard (see
the dx-file) -- it yields a fruitful touch-typing environment.

![screenshot][screenshot]

Installation process
====================

Packages
--------

Having a freshly installed vanilla (Lu/Xu/U/...)buntu in front of you, you need to
install the following packages.

```
# apt-get install git vim-gtk zsh tmux herbstluftwm tint2 dmenu feh mupdf xdotool unclutter cinnamon-screensaver
```

Clone the files from this repository
------------------------------------

```
% git clone https://github.com/00tau/seebrise.git ~/.seebrise
% cd .seebrise
% git submodule update --init --recursive
% ./create-links
% ln -s ~/.seebrise/tint2 ~/.config/tint2
% ln -s ~/.seebrise/herbstluftwm ~/.config/herbstluftwm
% mkdir ~/.tmp # for vim's backup files
```

Make Zsh your primary shell
---------------------------

```
$ which zsh
$ chsh
```

Add Seebrise to your xsessions
------------------------------

```
# cp seebrise.desktop /usr/share/xsessions/
```

DvoraX
------------------------------------------------------

A Dvorak keyboard layout tailored to non-staggered keyboards with a grid layout.
Examples are the
[Kinesis Advantage](https://www.kinesis-ergo.com/shop/advantage-for-pc-mac/), the
[Key64](http://www.key64.org), or the [ErgoDox](http://ergodox.org/).

```
# ln -s ~/.dotfiles/dx /usr/share/X11/xkb/symbols/dx
```

Firefox
-------

Don't forget to get the coolest Add-On to Firefox: [Pentadactyl](http://5digits.org/pentadactyl/)

[screenshot]: https://lh3.googleusercontent.com/-sTswtdTJSn8/VUoppqaEcTI/AAAAAAAAAKM/8DOzbbkGxkI/w506-h285/test.png
