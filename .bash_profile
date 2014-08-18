# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
#source ~/dotfiles/git-completion.bash

source /ampd/tools/_env
export DYLD_LIBRARY_PATH=/ampd/apps/lib


#Colors
export TERM=xterm-color
export CLICOLOR=1
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[${COLOR_BLUE}\]\$(parse_git_branch) \[${COLOR_RED}\]\w \[${COLOR_NC}\]\t $ "

#Default editors
export EDITOR='edit'
export GIT_EDITOR='edit -w'

#git aliases
alias gs="git status"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gcm="git commit -m"
alias go="git checkout"
alias gb="git branch"
alias gd="git diff"

function gupdate() {
    for i in */.git;
        do ( cd "${i/\/.*/}"; git pull --ff-only);
    done # Pull updates from all git repos below your CWD. single level only (fix)
}

# http://stevenharman.net/git-clean-delete-already-merged-branches
function delete-merged-branches() {
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

#svn aliases
alias ss="svn status"
alias si="svn info"
alias scon="svn status | grep -p '^(?=.{0,6}C)'"
#function sbranch() {
#    local ticket=$1 #(echo "$1" | sed 's/^\(.\{2\}\)/&-/')
#    echo "$ticket"
#    svn copy $SVN_URL/trunk $SVN_URL/branches/$1 -m "Creating dev branch. refs #$ticket"
#    svn co $SVN_URL/branches/$1 $1
#    cd /Volumes/workspace/$1
#    ~/Documents/code/phpstorm-template-project/clone-project-settings.sh $1
#}

#vagrant aliases
#alias vs="vagrant status"
#alias vssh="vagrant ssh"
#alias vh="vagrant halt"
#alias vsuspend="vagrant suspend"
#alias vres="vagrant resume"
#alias vu="vagrant up"