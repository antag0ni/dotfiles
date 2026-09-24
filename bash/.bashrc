# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ---------------------------------------------------------
# History configuration
# ---------------------------------------------------------

# Don't put duplicate lines or lines starting with a space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set history length 
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# ---------------------------------------------------------
# Prompt definition
# ---------------------------------------------------------

PS1='\u@\h:\[\e[01;36m\]\w\[\e[0m\]\$ '

# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------

# Enable color support for ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Common listing aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

