# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\u@\h \w> "
export EDITOR='vim'
export BROWSER='firefox'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias lla='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias gc='git clone '
alias gf='git diff --color | diff-so-fancy'
alias dl='cd ~/Downloads'
alias p2='ping google.com'
alias pro='cd ~/Programming'
alias se='vim -o `fzf`'
