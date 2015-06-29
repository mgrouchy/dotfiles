# These configs are meant to be used with oh-my-zsh
# path to zsh
ZSH=$HOME/.oh-my-zsh
# zsh theme
ZSH_THEME="kennethreitz"
# oh-my-zsh plugins
plugins=(gitfast, brew, django, github, heroku, osx, pip, python, redis-cli, rsync, celery, node, npm, vagrant, virtualenv, virtualenvwrapper)

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
source ~/.zshalias
#functions
source ~/.zshfunc

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# source some things
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper_lazy.sh
export VIRTUAL_ENV_DISABLE_PROMPT=true #fix prompt in powerline
#export PYTHONDONTWRITEBYTECODE=1
source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
export PORT=8000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="~/Library/Python/2.7/bin/:~/Library/Python/2.7/lib/:$PATH"
