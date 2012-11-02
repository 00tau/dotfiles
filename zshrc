#file: ~/.zshrc
#author: Thomas Friedrich (00tau@suud.de)
#year: 2011,2012

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
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify

# Setting the promt to the most simple
autoload -U promptinit
promptinit
prompt off

# Aliases
alias ls="ls -h --color=auto "
alias ll="ls -l "
alias la="ls -la "
alias edit="gvim --servername EDIT --remote-tab "
alias R="R --no-save -q "
alias C="source /opt/context-minimals/setuptex"
alias lido="ssh friedric@lidong1.itmc.tu-dortmund.de"
alias diss=~/Dropbox/Akademisches/Statistik/TU-Dortmund/2010-Dissertation/
#alias steam='WINEDEBUG=-all wine ~.local/share/wineprefixes/steam/drive_c/Program Files (x86)/Steam/steam 2>&1 &'

# Run skype as user skype
alias skype='xhost +local: && su skype -c skype'

# Keybindings
bindkey -v
bindkey "^T" vi-cmd-mode

# PATH
export PATH=~/.cabal/bin:$PATH

# Start an SSH agent
eval $(ssh-agent)
