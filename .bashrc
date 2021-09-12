#
# ~/.bashrc
#

export TERMINAL=/usr/bin/alacritty
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox

export PATH="$HOME/.bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1="\[\033[44m\]\[\033[1;37m\] \w \[\033[0;107m\]\[\033[34m\]  \[\033[00m\] "

alias v='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'



