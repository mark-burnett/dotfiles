# Environment
export EDITOR=vim
export LESS='-R'
export PAGER="less $LESS"

# History
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000
HISTFILESIZE=100000
shopt -s histappend

# Prompt
PS1='[\@] \[\033[1;34m\]\h\[\033[m\]:\w\n\$ '
set -o vi

# Terminal
if [ 'screen' == $TERM ]; then
    TERM='screen-256color'
fi

if [ $(uname) = "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

# Disable software flow control (which makes CTRL-S effectively lock the terminal)
stty -ixon

push_path $HOME/.bin
push_path /usr/local/sbin
