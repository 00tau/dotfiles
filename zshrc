#file: ~/.zshrc
#author: Thomas Friedrich (00tau@suud.de)
#year: 2011,2012,2013

# Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/friedrich/.zshrc'

autoload -Uz compinit
compinit

# Settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#setopt appendhistory autocd extendedglob nomatch
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS \
    HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS HIST_IGNORE_SPACE \
    NO_HIST_BEEP
setopt autocd extendedglob nomatch
unsetopt beep notify

# Setting the promt to the most simple
autoload -U promptinit
promptinit
prompt off

# Aliases
alias e="ls -h --time-style=iso --color=auto "
alias eu="e -l "
alias ey="e -la "
alias hc="herbstclient "
alias hcs="herbstclient spawn "
alias tmux="tmux -2 "
alias edit="gvim --servername EDIT "
alias R="R --no-save -q "
alias C="source /opt/context-minimals/setuptex"
alias lido="ssh friedric@lidong1.itmc.tu-dortmund.de"

# Named directories
diss=~/Dropbox/Akademisches/Statistik/TU-Dortmund/2010-Dissertation/
code=~diss/src-r/

# Run skype as user skype
alias skype='xhost +local: && su skype -c skype'

# Keybindings
bindkey -v
bindkey "^T" vi-cmd-mode
#bindkey "up" history-search-backward
#bindkey "down" history-search-forward
#bindkey '\e[A' history-search-backward
#bindkey '\e[B' history-search-forward

# PATH
export PATH=~/.dotfiles/scripts:~/Dokumente/scripts:~/Spiele/bin:~/src/tmuxinator/bin:$PATH
export EDITOR=vim

# Start an SSH agent
#eval $(ssh-agent)
