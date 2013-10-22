#!/usr/bin/env bash

#this totally doesn't work anymore

echo "Symlinking new dotfiles ..."
  ln -s .bashrc ~/.bashrc
  ln -s .bash_profile ~/.bash_profile
  ln -s .gitconfig ~/.gitconfig
  ln -s .zshrc ~/.zshrc
  ln -s .zshenv ~/.zshenv
  ln -s .zshfunc ~/.zshfunc
  ln -s .zshalias ~/.zshalias

