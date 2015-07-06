export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTIGNORE="[bf]g:[ ]*:exit:??"
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s cmdhist

export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

#Bind commands
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias xclip="xclip -selection c"

# make sure ssh-add is available with current user's RSA key
if ! ssh-add -l >/dev/null 2>&1; then
    ssh-add ~/.ssh/id_rsa
fi

# set up python virtualenv manager
#if [ `id -u` != '0' ]; then
#  export VIRTUALENV_USE_DISTRIBUTE=1        # <-- Always use pip/distribute
#  export WORKON_HOME=/Volumes/workspace/.virtualenvs       # <-- Where all virtualenvs will be stored
#  source /usr/local/bin/virtualenvwrapper.sh
#  export PIP_VIRTUALENV_BASE=$WORKON_HOME
#  export PIP_RESPECT_VIRTUALENV=true
#fi

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -RN "

# set up NVM
export NVM_DIR=/Users/brian.fenton/.nvm
source /usr/local/opt/nvm/nvm.sh
nvm use default

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
