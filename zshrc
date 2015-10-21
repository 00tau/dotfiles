#file: ~/.zshrc
#author: Thomas W. D. Moebius (00tau@suud.de)
#year: 2011,2012,2013,2014

# Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' substitute 1

# Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# directory as argument, this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

autoload -U colors && colors
autoload -Uz compinit && compinit

setopt menu_complete

# Settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#setopt appendhistory
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS \
    HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS HIST_IGNORE_SPACE \
    NO_HIST_BEEP
setopt autocd nomatch
unsetopt beep notify

# Setting the promt to the most simple
autoload -U promptinit
promptinit
prompt off

# Following: Zsh Gem #1 at refining-linux.org
autoload -U zmv
alias mmv='noglob zmv -W'

# Following: Zsh Gem #2 at refining-linux.org
setopt extendedglob

# Following: Zsh Gem #4 at refining-linux.org
setopt correct
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Aliases
alias e="ls -h --time-style=iso --color=auto "
alias eu="e -l "
alias ey="e -la "
alias hc="herbstclient "
alias ch="herbstclient spawn "
alias tmux="tmux -2 "
alias R="R --no-save -q "
alias p="source ~/software/python-environments/nmf/bin/activate"
alias pc="ipython3 qtconsole --pylab"
alias pk="ipython3 kernel --pylab"
alias running="htop -u $(whoami)"

# Suffix Aliases
alias -s pdf=mupdf
alias -s png=sxiv
alias -s jpg=sxiv
alias -s jpeg=sxiv
alias -s tex=op
alias -s md=vimpager
alias -s html=firefox
alias -s org=firefox
alias -s com=firefox
alias -s de=firefox
alias -s plink='p-link --noweb --script'
alias -s ine=lrs

# Keybindings
bindkey -v
bindkey "^T" vi-cmd-mode
#bindkey "up" history-search-backward
#bindkey "down" history-search-forward
#bindkey '\e[A' history-search-backward
#bindkey '\e[B' history-search-forward

# PATH and ENVIRONMENT VARIABLES
export EDITOR=/usr/bin/vim
export PAGER=/usr/local/bin/vimpager
export PATH=~/.dotfiles/scripts:$PATH
export R_LIBS_USER=~/software/R

# Freesurfer needs its own
export FREESURFER_HOME=~/software/freesurfer/freesurfer
export FSFAST_HOME=$FREESURFER/fsfast
export FSF_OUTPUT_FORMAT=nii
export SUBJECTS_DIR=$FREESURFER/subjects
export MNI_DIR=$FREESURFER/mni

alias freesource=$FREESURFER/SetUpFreeSurfer.sh

# Named directories
data=~/documents/affective-disorders/data
