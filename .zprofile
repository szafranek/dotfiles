# $SCRIPTS can be exported before this script
if [ -z "$SCRIPTS" ]
then
	SCRIPTS=$HOME/work/dotfiles/scripts
fi


bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

export PATH=/usr/local/bin:$SCRIPTS:$PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

export EDITOR=vim
export CLICOLOR=1

export MYSQL_DIR='/usr/local/var/mysql'

export BAT_THEME="Monokai Extended Light"
export BAT_STYLE=numbers,changes


source $SCRIPTS/git-prompt.zsh

export PROMPT='%C $(gitprompt)%# '


alias grep="grep --color=auto"
alias ..="cd .."
alias ...="cd ../.."
alias cls="clear && ll"

alias gd="git diff"
alias gl="git l"
alias gs="git status"

alias dot="cd ~/work/dotfiles"
alias work="cd ~/work"

alias pe=pipenv
alias doco=docker-compose
alias mysqlstart='/usr/local/bin/mysql.server start'
alias mysqlstop='/usr/local/bin/mysql.server stop'

alias restart_sound="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"
alias dns_flush="sudo killall -HUP mDNSResponder"

if [[ "$OSTYPE" == "darwin"* ]]
then
	alias ll="ls -lahLT"
else
	alias ll="ls -lahL"
fi

alias topmem="top -o mem -s 10"
alias server="python -m http.server 8000"


# Go development
export GOPATH="${HOME}/work/go"
if [[ -d "$GOPATH" ]] && [[ -x "$(command -v brew)" ]]; then
    export GOROOT="$(brew --prefix golang)/libexec"
    export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
fi



# brew pyenv fix for Mojave
fix_brew() {
    export CFLAGS=-I$(brew --prefix)/opt/icu4c/include
    export LDFLAGS=-L$(brew --prefix)/opt/icu4c/lib
}

# cd into the folder open in Finder
cdf () {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]
    then
            cd "$target"
            pwd
    else
            echo 'No Finder window found' >&2
    fi
}


 # make directory and enter it
mdc() {
    mkdir -p "$@" && cd "$@"
}
