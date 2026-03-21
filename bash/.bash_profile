# Ergonomics

## Hide MacOS "The default interactive shell is now zsh" message
export BASH_SILENCE_DEPRECATION_WARNING=1

## Disable terminal bell
set bell-style none

## Shortened prompt only shows user and last two directories
PS1='\[\033[01;32m\]\u:\[\033[01;34m\]${PWD#"${PWD%/*/*}/"} \[\033[00m\]\\$ '

## Use vim mode
set -o vi
  
## Allow Ctrl+L to clear terminal
bind '"\C-l": clear-screen'

# Shell History
## don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

## Store more than the default number of commands in shell history
HISTSIZE=100000
HISTFILESIZE=10000000

## Append the latest command from any shell to history
shopt -s histappend

## immediately append to shared history (but preserve each terminal's history in realtime)
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

## alternately...
## append and reload the history after each command (all terminals share same pool of history in real time)
## # PROMPT_COMMAND="history -a; history -n"

## ignore certain commands from the history
HISTIGNORE="ls:ll:cd:pwd:bg:fg:history"

# Setup environment (path etc)
if [ -f ~/.shell-env  ]; then
    source ~/.shell-env
fi

if [ -f ~/.shell-env-local  ]; then
    source ~/.shell-env-local
fi

# Alias definitions
if [ -f ~/.shell-aliases ]; then
  source ~/.shell-aliases
fi

if [ -f ~/.shell-aliases-local ]; then
  source ~/.shell-aliases-local
fi

# Enable fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Shell Completions
## Enable completion in makefile based on contents
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

# Enable terraform autocompletion
complete -C /opt/homebrew/bin/terraform terraform

