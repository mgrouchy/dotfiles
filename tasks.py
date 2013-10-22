#!/usr/bin/env python

from invoke import task, run, Collection


BREW_APPS = ['git', 'wget', 'autoconf', 'libevent', 'htop', 'rabbitmq', 'tmux',
             'sqlite', 'memcached', 'libmemcached', 'gettext', 'ctags', 'ack',
             'redis', 'readline', 'reattach-to-user-namespace',
             'macvim --env-std --override-system-vim']

CASK_APPS = ['iterm2']

PIP_APPS = ['bpython', '--user git+git://github.com/Lokaltog/powerline',
            'virtualenvwrapper']


def pip_install_system(library):
    run('sudo pip install %s' % library)


@task
def install_python_env():
    run('sudo easy_install pip')
    for app in PIP_APPS:
        try:
            pip_install_system(app)
        except:
            pass


@task
def install_ohmyzsh():
    run('cd ~/; wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh')


@task
def install_brew():
    # install if uninstalled
    run('which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"')
    # update if already installed
    run('brew update')


@task
def install_brew_cask():
    try:
        run('brew tap phinze/homebrew-cask')
    except Exception, ex:
        # Ignore if there is an issue installing the cask
        pass
    brew_install('brew-cask')


@task
def brew_install(appname):
    run('brew install %s' % appname)


@task
def brew_cask_install(appname):
    run('brew cask install %s' % appname)


def install_font(fontname):
    run('sudo cp fonts/%s /Library/Fonts/' % fontname)


@task
def install_fonts():
    pass


@task
def print_python_versions():
    run('cd /usr/bin/; ls -la | grep python')


@task
def bootstrap(ssh_keys=None):
    print "Installing Homebrew"
    install_brew()

    print "Installing Homebrew cask"
    install_brew_cask()

    print "Installing cask apps"
    for app in CASK_APPS:
        try:
            brew_cask_install(app)
        except:
            # ignore brew errors
            pass

    print "Installing homebrew apps"
    for app in BREW_APPS:
        try:
            brew_install(app)
        except:
            # ignore brew errors
            pass

    print "Installing Oh-my-zsh"
    install_ohmyzsh()
    print "Moving default .zshrc"
    run('mv ~/.zshrc ~/.zshrc.orig')

    print "Symlinking files"
    run('ln -s .bash_profile ~/.bash_profile')
    run('ln -s .bashrc ~/.bashrc')
    run('ln -s .gitconfig ~/.gitconfig')
    run('ln -s .tmux.conf ~/.tmux.conf')
    run('ln -s .zshalias ~/.zshalias')
    run('ln -s .zshfunc ~/.zshfunc')
    run('ln -s .zshenv ~/.zshenv')
    run('ln -s .zshrc ~/.zshrc')

    print "Copying PIP configuration"
    run('ln -s .pip ~/.pip')

    # optionally symlink ssh keys
    if ssh_keys:
        print "Symlinking SSH directory"
        run('ln -s %s ~/.ssh' % ssh_keys)

    print "Setting up osx defaults"
    run('./.osx')
