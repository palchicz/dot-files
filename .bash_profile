### BASH ONLY SYSTEM WIDE CONFIGURATIONS ###
# This file should never change. It just invokes .profile and .bashrc
# http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile?answertab=active#tab-top

if [ -r ~/.profile ]; then
    source ~/.profile
fi

if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi


if command -v pipenv 1>/dev/null 2>&1; then
  eval "$(pipenv --completion)"
fi

export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
