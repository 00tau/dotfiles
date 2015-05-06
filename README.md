Seebrise
========

It would be far fetched to call Seebrise an actual desktop environment. I use
the following set-up on a laptop and two stand-alone PCs each running (L)ubuntu
as the underlying core system.  The following installation instruction, though,
should work with any flavour of Linux. Instead of running LXDE, I use the
tiling window manager [herbustluftwm](http://www.herbstluftwm.org/) with a
[tint2](http://www.herbstluftwm.org/) panel.  Together with a custom Dvorak
keyboard layout variant for easy programming, typing umlauts, and tailored to a
non-staggered keyboard -- such as the Kinesis Advantage Ergonomic Keyboard (see
the dx-file) -- it yields a fruitful touch-typing environment.

![screenshot][screenshot]

Installation process
====================

Packages
--------

Having a freshly installed vanilla Lubuntu in front of you, you need to install
the following packages.

```
# apt-get install git vim-gtk zsh tmux herbstluftwm tint2 dmenu feh mupdf xdotool unclutter
```

Clone the dotfiles from this repository
---------------------------------------

```
% git clone https://github.com/00tau/dotfiles.git ~/.dotfiles
% cd .dotfiles
% git submodule update --init --recursive
% ./create-links
% ln -s ~/.dotfiles/tint2 ~/.config/tint2
% ln -s ~/.dotfiles/herbstluftwm ~/.config/herbstluftwm
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

A Dvorak keyboard layout tailored to non-staggerd keyboards with a grid layout.
Examples are the
[Kinesis Advantage](https://www.kinesis-ergo.com/shop/advantage-for-pc-mac/),
[Key64](http://www.key64.org), or the [ErgoDox](http://ergodox.org/).

```
# ln -s ~/.dotfiles/dx /usr/share/X11/xkb/symbols/dx
```

Firefox
-------

Don't forget to get the coolest Add-On to Firefox: [Pentadactyl](http://5digits.org/pentadactyl/)

[screenshot]: https://lh3.googleusercontent.com/-sTswtdTJSn8/VUoppqaEcTI/AAAAAAAAAKM/8DOzbbkGxkI/w506-h285/test.png
