#!/bin/bash

### BASH RUNTIME CONFIGURATIONS ###
# run for non-login shells
# Put alias, functions, and other bash specific things here

## Homebrew ##

# For loading homebrew bash completion scripts
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

## LiquidPrompt ##

# For enabling liquidprompt
if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
fi


## Bash History ##

# Extend history
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# Ignore whitespace and duplicates
export HISTCONTROL=ignoredups:erasedups:ignorespace

# Ignore common commands
export HISTIGNORE="history:pwd:ls:clear:[bf]g:ps"

# Append history instead of overwriting it. Closing multiple terminals will update
# the history file with all of their history instead of just the most recent one.
shopt -s histappend

# Record timestamps
export HISTTIMEFORMAT='%F %T '


## Bash Aliases ##
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Some shortcuts for different directory listings
alias ls='ls -G'			     # colorized output	
alias l='ls -hF'                             # human readable
alias ll='l -l'                              # long list
alias la='l -A'                              # all but . and ..

# Misc
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Comman typos
alias cd..="cd .."
