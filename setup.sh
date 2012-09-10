#!/usr/bin/env bash

#this totally doesn't work anymore

echo "Symlinking new dotfiles ..."
  ln -s ~/.dotfiles/.bashrc ~/.bashrc
  ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
  ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
  ln -s ~/.dotfiles/vim/gvimrc ~/.gvimrc
  ln -s ~/.dotfiles/vim ~/.vim
  ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/.zshrc ~/.zshrc
  ln -s ~/.dotfiles/.zshenv ~/.zshenv
  ln -s ~/.dotfiles/.zshfunc ~/.zshfunc
  ln -s ~/.dotfiles/.zshalias ~/.zshalias

echo "Updating Dotfiles git Submodules..."
  cd ~/.dotfiles
  git submodule init
  git submodule update
  git submodule foreach git pull origin master --recurse-submodules
echo "Updating Vim git submodules..."
  cd ~/.dotfiles/vim/
  git submodule init
  git submodule update
  git submodule foreach git pull origin master --recurse-submodules


echo "We are done! Enjoy your environment!"
