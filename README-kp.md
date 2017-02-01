Katzenpfote
===========

Introduction
------------

Katzenpfote is a variation of the classic [Dvorak keyboard
layout](https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard#Original_Dvorak_layout)
but tailored to non-staggered or *grid* keyboards.  Examples of such
keyboards are the
[Kinesis Advantage Ergonomic](https://www.kinesis-ergo.com/shop/advantage-for-pc-mac/), the
[Maltron Ergonomic 3d](http://www.maltron.com/keyboard-info/dual-hand-fully-ergonomic-3d-keyboards), the
[Key64](http://www.key64.org), or the
[ErgoDox](http://ergodox.org/).
The Dvorak layout itself is probably most famous for its arrangement of
keys on the home row.  In fact, around 70% of keyboard strokes are
happening on the home row when typing a typical English text.

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| ü     | :  | ,  | .  | p  | y  | f  | g  | c  | r  | l  | ö     |
| SHIFT | a  | o  | e  | u  | i  | d  | h  | t  | n  | s  | SHIFT |
| ä     | '  | q  | j  | k  | x  | b  | m  | w  | v  | z  | ß     |

Note how easy it is to type bigrams, such as `th`, `eu`, and `en` in the
layout.  But also trigrams, such as `ous`, are a bliss to type.  If this
makes you a faster typist is another question, but, in general, many
people say that typing feels *more natural* in this layout than on
common QWERTZ.  The order of the numericals on the top row follow
[Benford's law](https://en.wikipedia.org/wiki/Benford%27s_law) such that
the most frequent digits are pressed with your most strongest fingers.
The side effect that the odd numbers are on the left and the even
numbers are on the right makes it also very easy to touch-type long
colons of numbers, e.g., when entering data.

Another motivation: the Katzenpfote layout allows you to write formulas,
such as:

```
P(α ≤ X ≤ β) = Φ(β) - Φ(α) = ∫_α^β Φ(x) dx
```

directly into your TeX-documents, and, as most modern TeX distribution
support UTF-8, they will be rendered correctly.  It looks nicer and it
is much more readable than the equivalent:

```
P(\alpha \leq X \leq \beta) = \Phi(\beta) - \Phi(\alpha) = \int_{\alpha}^{\beta} \Phi(x) dx
```

Katzenpfote is the standard keyboard layout of
[Seebrise](http://00tau.github.io/seebrise/).

Layout
------

The above table shows the *alpha-numeric* layer of the grid: note the
SHIFT-keys, which lie on the home-row of the layout, as we can safely
assume that you are much more likely in the need to press SHIFT than
CAPS-LOCK.  Also, the ESCAPE-key has moved to a more prominent position,
and it is now on the same level as the numeric keys.  It is much more
convenient to have the TABULATOR-key on the right side of the board and
close to the numerics, too, which is why it moved there.  A side effect
of the layout: when entering long rows of digital numbers, it is nice to
have `,` and `.` right below the numericals and, thus, in easy reach.

When pressing SHIFT, it yields the shifted or *capital* layer:

| ESC   | ℍ  | 𝔹  | 𝕍  | 𝔼  | 𝔽  | ℂ  | ℝ  | ℕ  | ℤ  | ℚ  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
| Ü     | ;  | !  | ?  | P  | Y  | F  | G  | C  | R  | L  | Ö     |
| **SHIFT** | A  | O  | E  | U  | I  | D  | H  | T  | N  | S  | **SHIFT** |
| Ä     | "  | Q  | J  | K  | X  | B  | M  | W  | V  | Z  | 𝟙     |

The *symbol* layer looks as follows:

| ESC   | d¨ | d˛ | d¸ | ´  | d´ | d\` | \` | €  | ¢  | £  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
|       | ∪  | +  | $  | [  | @  | %  | ]  | \  | &  | ∩  | ø     |
| SHIFT | ~  | <  | -  | (  | ±  | _  | )  | /  | >  | ^  | SHIFT |
| å     | “  | «  | =  | {  | #  | *  | }  | \| | »  | ”  | §     |

Symbols prefixed with 'd' are dead keys.  Note how easy it is to press
combinations such as `<-` or `~/` or `[]`.  When additionally pressing
SHIFT, it yields a *shifted symbol* layer, which is full of more common
UTF-8 characters:

| ESC   | 7  | 5  | 3  | 1  | 9  | 0  | 2  | 4  | 6  | 8  | TAB   |
|------:|----|----|----|----|----|----|----|----|----|----|:------|
|       | ⋃  | ∨  | …  | ⊊  | ⨉  | °  | ⊆  | ∙  | ∧  | ⋂  | Ø     |
| **SHIFT** | ≈  | ≤  | ∅  | ∉  | ∓  | ∞  | ∈  | ∘  | ≥  | ∝  | **SHIFT** |
| Å     | ∃  | ∥  | ≠  | ∫  | ∇  | ∆  | ⊤  | ⋅  | ⊥  | ∀  |       |

When using the Katzenpfote layout, you have also access to a *greek
layer*.  This layer is particularly useful, when writing mathematical
text in [TeX](http://tug.org/), as most TeX-dialects, such as
[ConTeXt](http://wiki.contextgarden.net/) and
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
| **SHIFT** | Α  | Ο  | Ε  | Ψ  | Ι  | Δ  | Η  | Τ  | Ν  | Σ  | **SHIFT** |
|       |    |    |    | Κ  | Ξ  | Β  | Μ  | Ω  | Θ  | Ζ  |       |


In grid layouts, the thumbs can do a lot more than just pressing space:

| left thumb | right thumb |
|:-----------|------------:|
| *symbol*   | space       |
| Control    | enter       |
| **WM**     | *greek*     |

Pressing *symbol* or *greek* will enter the *symbol* or *greek* layer
respectively.  The window manager is controlled by pressing **WM**.

Installation of Katzenpfote
----------------------------

The keyboard layout descriptions reside in `/usr/share/X11/xkb/symbols/`
on most Linux distributions.  The idea is to simply copy the layout
description to this folder.

```
% git clone https://github.com/00tau/katzenpfote.git ~/.config/katzenpfote
# cd /usr/share/X11/xkb/symbols/
# ln -s ~/.config/katzenpfote/kp kp
```

Then apply the layout.

```
% setxkbmap kp
```

Meta keys
---------

The X system has its own keyboard handling layer, in which scan codes
are sent from your keyboard to X, these are mapped to key codes, which
are then mapped to key symbols, which are then send to your program for
interpretation.

The layout description residing in the file `kp` has been tested for the
Kinesis Advantage.  Katzenpfote builds on top of the X server key code
table, i.e., it alters the `keycode`-`keysym`-table.

This way you will likely not have any difficulties when using a
different non-staggered keyboard.  In case you need to tweak the
description, however, here is the mapping of the meta keys to `keycode`s
and `keysym`s in `kp`.

| interpretation | `keycode` | `keysym` |
|:---------------|--------:|-------:|
| *symbol*   | BKSP      | ISO_Level3_Shift |
| *greek*    | PGDN      | ISO_Level5_Shift |
| **WM**     | END       | Super_L          |

Trivia
-------

Katzenpfote is German and it literally translates to: "the paw of a
cat".  However, Katzenpfote is also a [nautical
term](http://www.sailingace.com/segellexikon/d/katzenpfote/katzenpfote.htm)
used by German sailors to describe the characteristic pattern that a
[light sea breeze](http://00tau.github.io/seebrise/) draws on calm see.
Katzenpfote is the standard keyboard layout in
[Seebrise](http://00tau.github.io/seebrise/).
