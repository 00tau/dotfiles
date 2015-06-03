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

Make Zsh the primary shell
--------------------------

```
% which zsh
% chsh
```

Add Seebrise to the list of sessions
------------------------------------

```
# cp seebrise.desktop /usr/share/xsessions/
```

DvoraX
------------------------------------------------------

A Dvorak keyboard layout tailored to non-staggered keyboards with a grid layout.
Examples of grid keyboards are the
[Kinesis Advantage](https://www.kinesis-ergo.com/shop/advantage-for-pc-mac/), the
[Key64](http://www.key64.org), or the [ErgoDox](http://ergodox.org/).

```
# ln -s ~/.dotfiles/dx /usr/share/X11/xkb/symbols/dx
```

This is the *alpha-numeric* layer of the grid: Note that the SHIFT-keys lie on
the home-row of the layout, assuming that you are much more likely to press
SHIFT than CAPS-LOCK.  Also, the ESCAPE-key has moved to a more prominent
position, and is now on the same level has the numeric keys.  It is much more
convenient to have the TABULATOR-key on the right side of the board and so
close to the numerics, too.  When entering long rows of digital numbers, it is
nice to have `,` and `.` right below.

| L5    | L5 | L4 | L3 | L2 | L2 | R2 | R2 | R3 | R4 | R5 | R5    |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
| ü     | :  | ,  | .  | p  | y  | f  | g  | c  | r  | l  | ö     |
| SHIFT | a  | o  | e  | u  | i  | d  | h  | t  | n  | s  | SHIFT |
| ä     | '  | q  | j  | k  | x  | b  | m  | w  | v  | z  | ß     |

When pressing SHIFT, it yields the *shift* layer:

| L5    | L5 | L4 | L3 | L2 | L2 | R2 | R2 | R3 | R4 | R5 | R5    |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
| Ü     | ;  | !  | ?  | P  | Y  | F  | G  | C  | R  | L  | Ö     |
| SHIFT | A  | O  | E  | U  | I  | D  | H  | T  | N  | S  | SHIFT |
| Ä     | "  | Q  | J  | K  | X  | B  | M  | W  | V  | Z  | ß     |

The alternative-ground or *symbol* layer (when pressing Alt-Gr) looks like
this: Note how easy it is to press combinations such as `<-` or `->` or `~/`.
The acute and grave signs above the home row are non-dead.  The acute and grave
signs on the bottom row are dead.

| L5    | L5 | L4 | L3 | L2 | L2 | R2 | R2 | R3 | R4 | R5 | R5    |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|       | [  | +  | $  | ]  | ´  | `  | /  | \  | &  | °  |       |
| SHIFT | ~  | <  | -  | >  | (  | )  | }  | {  | _  | ^  | SHIFT |
|       | ´  | @  | =  | *  | ¦  | ¦  | #  | %  | §  | `  |       |

Firefox
-------

Don't forget to get the coolest Add-On to Firefox: [Pentadactyl](http://5digits.org/pentadactyl/)

[screenshot]: https://lh3.googleusercontent.com/-sTswtdTJSn8/VUoppqaEcTI/AAAAAAAAAKM/8DOzbbkGxkI/w506-h285/test.png
