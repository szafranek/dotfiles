# $SCRIPTS can be exported before this script
if [ -z "$SCRIPTS" ]
then
	SCRIPTS=$HOME/work/dotfiles/scripts
fi

source $SCRIPTS/git-completion.sh
source $SCRIPTS/make-completion.sh
source $SCRIPTS/rake-completion.sh
source $SCRIPTS/git-prompt.sh

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export PATH=/usr/local/bin:$SCRIPTS:$PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=erasedups
export HISTSIZE=10000
export EDITOR=vim
export CLICOLOR=1

export MYSQL_DIR='/usr/local/var/mysql'

export BAT_THEME="Monokai Extended Light"
export BAT_STYLE=numbers,changes

shopt -s histappend

# brew pyenv fix for Mojave
fix_brew() {
	export CFLAGS=-I$(brew --prefix)/opt/icu4c/include
	export LDFLAGS=-L$(brew --prefix)/opt/icu4c/lib
}

if [[ "$TERM" == "dumb" ]]
then
	export PS1="\W\$(__git_ps1)\$ "
else
	TXTGREEN='\e[0;32m' # Green
	TXTRESET='\e[0m' #Text reset
	export PS1="\W\[$TXTGREEN\]\$(__git_ps1)\[$TXTRESET\]\$ "
fi

alias grep="grep --color=auto"
alias ..="cd .."
alias ...="cd ../.."
alias cls="clear && ll"

alias gs="git status"
alias gd="git diff"

alias dot="cd ~/work/dotfiles"
alias work="cd ~/work"

alias pe=pipenv
alias doco=docker-compose
alias mysqlstart='/usr/local/bin/mysql.server start'
alias mysqlstop='/usr/local/bin/mysql.server stop'

alias restart_sound="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"
alias dns_flush="sudo killall -HUP mDNSResponder"
alias itunes="lsof | grep iTunes | grep TCP | grep ESTABLISHED" # show who listens to my iTunes library

if [[ "$OSTYPE" == "darwin"* ]]
then
	alias ll="ls -lahLT"
else
	alias ll="ls -lahL"
fi

alias topmem="top -o mem -s 10"
alias server="python -m http.server 8000"




