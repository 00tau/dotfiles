# The following lines were added by compinstall

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
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Setting the promt to the most simple
autoload -U promptinit
promptinit
prompt off

# Aliases
alias l="ls -lha --color=auto"
alias ll="ls -lh --color=auto"
alias lll="ls -h --color=auto"
