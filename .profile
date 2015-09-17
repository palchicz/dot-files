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

## Virtualenv

# set where virutal environments will live
export WORKON_HOME=$HOME/.virtualenvs

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi
