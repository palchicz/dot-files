### SYSTEM WIDE CONFIGURATIONS ###
# Invoked for login shells, including if this machine is ssh'd in to
# Environmental variables go here
# http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile?answertab=active#tab-top

## Homebrew ##
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# For loading homebrew bash completion scripts
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# For loading git auto-complete scripts
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Pip Install
export PATH="$HOME/.local/bin:$PATH"


# set where virutal environments will live
export WORKON_HOME=$HOME/.virtualenvs

export PATH="$HOME/.poetry/bin:$PATH"

# pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path &> /dev/null)"
if [ -n "$PS1" -a -n "$BASH_VERSION" ]; then source ~/.bashrc; fi
