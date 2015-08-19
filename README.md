Seebrise
========

It would probably be far fetched to call Seebrise an actual desktop
environment. In another sense, though, one may say that Seebrise is also more
than just a desktop environment.  It is a collection of dot-files following a
common theme for key strokes, short cuts and a pleasing colour scheme.
Essentially, Seebrise is the tiling window manager
[HerbustluftWM](http://www.herbstluftwm.org/) together with a
[tint2](http://www.herbstluftwm.org/) panel.  With a custom Dvorak keyboard
layout variant for easy programming, typing umlauts, and tailored to a
non-staggered keyboard (see
the section about Katzenpfote) -- it yields a fruitful touch-typing environment.

![screenshot][screenshot]

Katzenpfote
===========

Katzenpfote is a variation of the classic [Dvorak keyboard
layout](https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard#Original_Dvorak_layout)
tailored to non-staggered keyboards with a grid layout.  Examples of grid
keyboards are the [Kinesis Advantage
Ergonomic](https://www.kinesis-ergo.com/shop/advantage-for-pc-mac/), the
[Key64](http://www.key64.org), or the [ErgoDox](http://ergodox.org/).  The
Dvorak keyboard layout is probably most famous for its arrangement of keys on
the home-row.  In fact, around 70% of keyboard strokes are done on the home-row
using this layout typing an average English text.  Also note how easy it is to
type bigrams, such as `th`, `eu` and `en` in this layout.  But also trigrams,
such as `ous`, are a bliss to type.  If this makes you a faster typist is
another question, but in general many people say that typing feels *more
natural* in this layout than on the common QWERTZ layout.

The following table shows the *alpha-numeric* layer of the grid: Note that the
SHIFT-keys lie on the home-row of the layout, assuming that you are much more
likely to press SHIFT than CAPS-LOCK.  Also, the ESCAPE-key has moved to a more
prominent position and is now on the same level as the numeric keys.
It is much more convenient to have the TABULATOR-key on the right side of the
board and close to the numerics, too, which is why it moved there.  A side
effect of the layout: when entering long rows of digital numbers, it is nice to
have `,` and `.` right below this line.

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| ü     | :  | ,  | .  | p  | y  | f  | g  | c  | r  | l  | ö     |
| SHIFT | a  | o  | e  | u  | i  | d  | h  | t  | n  | s  | SHIFT |
| ä     | '  | q  | j  | k  | x  | b  | m  | w  | v  | z  | ß     |

When pressing SHIFT, it yields the shifted or *capital* layer:

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| Ü     | ;  | !  | ?  | P  | Y  | F  | G  | C  | R  | L  | Ö     |
| SHIFT | A  | O  | E  | U  | I  | D  | H  | T  | N  | S  | SHIFT |
| Ä     | "  | Q  | J  | K  | X  | B  | M  | W  | V  | Z  | ß     |

The alternative-ground or *symbol* layer (when pressing Alt-Gr) looks
like this: Note how easy it is to press combinations such as `<-` or `~/` or
`[]`.  The right acute-signs on the bottom row are in fact grave-signs --
unfortunately those did mess up the rendering of the table.  The inner acute
and grave signs are non-dead, such that they can be used in keyboard short
cuts.  The outer acute and grave signs on the bottom row are dead, such that
these can be used to type letters `é` and `è`, as in *Café*.

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| £     | ¦  | +  | $  | [  | @  | %  | ]  | \  | &  | °  | €     |
| SHIFT | ~  | <  | -  | (  | §  | _  | )  | /  | >  | ^  | SHIFT |
|       | ´  | ´  | =  | {  | #  | *  | }  | `|`| ´  | ´  | ¢     |

When additionally pressing SHIFT, it yields a *shifted symbol* layer, which is
full of UTF-8 characters:

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| -+    | u2124 | u2228 | u2026 | u228A | u2115 | u211D | u2286 | u2219 | u2227 | u211A | +-    |
| SHIFT | u2248 | u2264 | u2205 | u2209 | u221E | u2AEB | u2208 | u2218 | u2265 | u221D | SHIFT |
|       | u2203 | u2225 | u2260 | u222B | u2207 | u2206 | u22A4 | u22C5 | u22A5 | u2200 |       |

Which translate to these symbols:

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| ∓     | ℤ  | ∨  | …  | ⊊  | ℕ  | ℝ  | ⊆  | ∙  | ∧  | ℚ  | ±     |
| SHIFT | ≈  | ≤  | ∅  | ∉  | ∞  | ⫫  | ∈  | ∘  | ≥  | ∝  | SHIFT |
|       | ∃  | ∥  | ≠  | ∫  | ∇  | ∆  | ⊤  | ⋅  | ⊥  | ∀  |       |

When using the Katzenpfote layout, you have also access to a *greek layer*
(when pressing R-Ctrl, the right control key).  This layer is particularly
useful, when writing mathematical scripts in [TeX](http://tug.org/), as most
TeX-dialects, such as [ConTeXt](http://wiki.contextgarden.net/) and
[LaTeX](http://www.latex-project.org/), understand
[UTF-8](http://www.utf-8.com/).

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
|       |    |    |    | π  | υ  | φ  | γ  | χ  | ρ  | λ  |       |
| SHIFT | α  | ο  | ε  | ψ  | ι  | δ  | η  | τ  | ν  | σ  | SHIFT |
|       |    |    |    | κ  | ξ  | β  | μ  | ω  | θ  | ζ  |       |

When additionally pressing SHIFT, it yields the *capital greek* layer:

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
|       |    |    |    | Π  | Υ  | Φ  | Γ  | Χ  | Ρ  | Λ  |       |
| SHIFT | Α  | Ο  | Ε  | Ψ  | Ι  | Δ  | Η  | Τ  | Ν  | Σ  | SHIFT |
|       |    |    |    | Κ  | Ξ  | Β  | Μ  | Ω  | Θ  | Ζ  |       |

In fact, this layout allows you to directly write

```
P(α ≤ X ≤ β) = Φ(β) - Φ(α) = ∫_α^β Φ(x) dx
```

into your TeX-document, and it will be rendered correctly. And, well, which
just looks so much nicer and is just so much more readable than this:

```
P(\alpha \leq X \leq \beta) = \Phi(\beta) - \Phi(\alpha) = \int_{\alpha}^{\beta} \Phi(x) dx
```

In grid layouts, the thumbs can do a lot more than just pressing space:

| left thumb | right thumb |
|:----|----:|
| *symbol* | Space |
| Control | Enter |
| **WM** | *greek* |

Pressing *symbol* (=R-Alt or Alt-Gr) or *greek* (=R-Ctrl) will enter the
*symbol* or *greek* layer of the layout respectively.  The window manager
HerbustluftWM is controlled by pressing **WM** (= left Super or Window key).


Installation of Katzenpfote
===========================

The keyboard layout descriptions reside in `/usr/share/X11/xkb/symbols/` on
most Linux distributions.  The idea is to simply copy the included layout
description to this folder.

```
# cd /usr/share/X11/xkb/symbols/dx
# ln -s ~/.dotfiles/dx dx
```

And then apply the layout.

```
% setxkbmap dx grid
```

Installation of Seebriese
=========================

The following installation instruction should work with any flavour of Linux.

Packages
--------

Having a freshly installed vanilla (Lu/Xu/U/...)buntu in front of you, you need to
install the following packages.

```
# apt-get install git vim-gtk zsh tmux herbstluftwm tint2 dmenu feh mupdf xdotool unclutter cinnamon-screensaver silversearcher-ag
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

Terminal emulator
-----------------

Seebrise is using [st](http://st.suckless.org/) by default. Thus, you may
either need to change the terminal in Seebrise's configuration or install
*st*.

In contrast to *st*'s README, I needed the following packages installed on Ubuntu to compile st:

    libx11-dev: Xlib header fils
    libxft-dev: freetype-based font drawing
    libxext-dev: X11 miscellaneous extensions

```
# apt-get install libx11-dev libxft-dev libxext-dev
```

Then simply clone the source code of *st* and compile:


The shell -- your Best Friend Forever
-------------------------------------

Make Zsh the primary login shell:

```
% which zsh
% chsh
```

Change your default terminal emulator to `uxterm`:

```
% sudo update-alternatives --config x-terminal-emulator
```

Add Seebrise to the list of sessions
------------------------------------

```
# cp seebrise.desktop /usr/share/xsessions/
```

Firefox
-------

Don't forget to get the coolest Add-On to Firefox: [Pentadactyl](http://5digits.org/pentadactyl/)

[screenshot]: https://lh3.googleusercontent.com/-sTswtdTJSn8/VUoppqaEcTI/AAAAAAAAAKM/8DOzbbkGxkI/w506-h285/test.png
