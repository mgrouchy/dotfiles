# path to zsh
ZSH=$HOME/.oh-my-zsh
# zsh settings
# turn off autocorrect
# zsh theme
ZSH_THEME="kennethreitz"
# oh-my-zsh plugins
plugins=(git, brew, django, github, heroku, osx, pip, python, redis-cli)

# history
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY # don't overwrite history; append instead
setopt INC_APPEND_HISTORY # append after each command
setopt SHARE_HISTORY # share history between shells
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# zsh performance tweaks
# .. use a cache file
zstyle ':completion:*' use-cache on
# .. and then specify the cache file to use (not added to repo: separate file for each machine)
zstyle ':completion:*' cache-path ~/.zshcache

# aliases
alias zshconfig="vim ~/.zshrc"
alias ports='sudo lsof -i -P | grep -i "listen"' # list open ports
alias f='find .-name'
alias h='htop'
alias c='clear'
alias bp='bpython'

# environment
export EDITOR='vim'
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
# grep
export GREP_OPTIONS='--color=auto'
# python
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# source some things
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh

