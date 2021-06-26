#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

CYAN="\[\e[01;36m\]"
WHITE="\[\e[01;37m\]"
BLUE="\[\e[01;34m\]"
TEXT_RESET="\[\e[00m\]"   
TIME="\t"
CURRENT_PATH="\W"
ROOT_OR_NOT="\$"

export PS1="${CYAN}[${BLUE}${TIME}${WHITE} ${CURRENT_PATH}${CYAN}]${ROOT_OR_NOT}${TEXT_RESET} "
export EDITOR='vim'

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
