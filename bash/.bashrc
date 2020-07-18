export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]"

alias htop=glances
alias l="clear;ls -a1"
alias merge="xrdb -merge ~/.Xresources"

alias sublime="/opt/sublime_text_3/sublime_text"
alias yt="youtube-dl -ic"
alias p="vim ~/.bashrc"
alias s="source ~/.bashrc"
alias ..="cd .."
alias ss="sudo systemctl"
alias pt="sudo vim ~/.config/termite/config"
alias D="cd ~/Downloads"
alias usef="cat ~/s/useful-private/useful_code"

function set(){
	wal -i ~/.wallpaper;
}

#function normalize(){
#	eval string1="$1"
#	eval string2="$2"
#	ffmpeg-normalize $string1 -o $string2
#	#ffmpeg-normalize -c:a aac "$1" -o "$2"
#}

function normalize(){
    ffmpeg-normalize -c:a aac $1 -o $2
}

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
#alias grep="grep --color=auto" # Color grep - highlight desired sequence.
alias grep='grep --color'
#alias ls='ls --color=auto'
alias diff="diff --color"


EDITOR=vim
alias vi=vim
alias U="vim ~/s/useful-private/useful_code"
alias pi="vim ~/.config/i3/config"
alias pc="vim ~/.config/polybar/config"

alias am="alsamixer"
