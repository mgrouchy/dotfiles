#!/usr/bin/env bash

#install homebrew
#ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

#install homebrew things
brew install wget
brew install macvim
brew install libevent
brew install htop
brew install rabbitmq
brew install tmux
brew install sqlite
brew install memcached
brew install libmemcached
brew install gettext
brew install ctags
brew install ack
brew install jpg
brew install redis
brew install readline

echo "Installing Iterm2"
wget http://iterm2.com/downloads/stable/iTerm2_v1_0_0.zip -P ~/Downloads/

#mv ~/Downloads/iterm2/iterm2.app /Applications/

#echo "Symlinking new dotfiles ..."
  #ln -s .bashrc ~/.bashrc
  #ln -s .bash_profile ~/.bash_profile
  #ln -s .gitconfig ~/.gitconfig
  #ln -s .zshrc ~/.zshrc
  #ln -s .zshenv ~/.zshenv
  #ln -s .zshfunc ~/.zshfunc
  #ln -s .zshalias ~/.zshalias

