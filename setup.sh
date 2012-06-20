#!/usr/bin/env bash

#this totally doesn't work anymore

echo "Creating dotfiles backup directory ~/.dotfiles_backup ..."
  mkdir ~/.dotfiles_backup

cd ~/.dotfiles

echo "cleaning up old dotfiles and moving to backup directory ..."
  mv ~/.bashrc ~/.dotfiles_backup/
  mv ~/.bash_profile ~/.dotfiles_backup/
  mv ~/.vimrc ~/.dotfiles_backup/
  mv ~/.gvimrc ~/.dotfiles_backup/
  mv ~/.gitconfig ~/.dotfiles_backup/

echo "Symlinking new dotfiles ..."
  ln -s ~/.dotfiles/.bashrc ~/.bashrc
  ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
  ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
  ln -s ~/.dotfiles/vim/gvimrc ~/.gvimrc
  ln -s ~/.dotfiles/vim ~/.vim
  ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

echo "Updating git Submodules..."
  cd ~/.dotfiles
  git submodule foreach git pull origin master --recurse-submodules

echo "We are done! Enjoy your environment!"
