SCRIPTS=$HOME/work/dotfiles/scripts

source $SCRIPTS/git-completion.bash
source $SCRIPTS/rake-completion.sh
source $SCRIPTS/git-prompt.sh

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'


# Colors
TXTGREEN='\e[0;32m' # Green
TXTBLACK='\e[0;30m' # Black
TXTRESET='\e[0m' #Text reset

PATH=$PATH:$SCRIPTS:/usr/local/share/npm/bin
export PATH
export PATH=/usr/local/bin:$PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PS1="\W\[$TXTGREEN\]\$(__git_ps1)\[$TXTRESET\]\$ "

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

export MYSQL_DIR='/usr/local/var/mysql'

if [ -f /usr/local/bin/mate ]
then
	export EDITOR="mate -w"
else
	export EDITOR=vim
fi

export GREP_OPTIONS="--color"
export CLICOLOR=1

alias pyg='/usr/local/bin/pygmentize'
alias mysqlstart='/usr/local/bin/mysql.server start'
alias mysqlstop='/usr/local/bin/mysql.server stop'

alias restart_sound="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"
alias dns_flush="sudo killall -HUP mDNSResponder"
alias itunes="lsof | grep iTunes | grep TCP | grep ESTABLISHED" # show who listens to my iTunes library

if [[ "$OSTYPE" == "darwin"* ]]; then
	alias ll="ls -lahLT"
else
	alias ll="ls -lahL"
fi

alias ..="cd .."
alias ...="cd ../.."

alias topmem="top -o mem -s 10"

alias server="python -m SimpleHTTPServer 8000"



