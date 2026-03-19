##!/usr/bin/env bash

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \; 

OLD_DOTFILES="dotfile_bk_$(date -u +"%Y%m%d%H%M%S")"
mkdir $OLD_DOTFILES

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 $OLD_DOTFILES
      echo "backing up: $1" 
    fi
    if [ -d $1 ];
    then
      mv $1 $OLD_DOTFILES
      echo "backing up: $1" 
    fi
}

# Clean common conflicts
backup_if_exists ~/.bash_profile
backup_if_exists ~/.shell-aliases
backup_if_exists ~/.shell-env
backup_if_exists ~/.gitconfig
backup_if_exists ~/.vimrc
backup_if_exists ~/.config/nvim/init.vim

PROGRAMS=(bash git vim)

for program in ${PROGRAMS[@]}; do
  stow -v --target=$HOME $program
  echo "Configuring $program"
done
