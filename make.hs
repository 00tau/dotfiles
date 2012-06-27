#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="Rprofile Xresources bash_aliases bash_profile bashrc gtkrc-2.0 gvimrc vimrc xinitrc"
wm="xmonad.hs conkyrc"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to ~/.dotfiles_old
# then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# do the same thing for the wm-files
for file in $wm; do
    echo "Moving any existing wm-files from ~/.xmonad/ to $olddir"
    mv ~/.xmonad/$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.xmonad/$file
done
