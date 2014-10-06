SCRIPTS=~/work/dotfiles/scripts

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

PATH=$PATH:$SCRIPTS:/usr/local/share/npm/bin
export PATH
export PATH=/usr/local/bin:$PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PS1="\W\$ "

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

export MYSQL_DIR='/usr/local/var/mysql'

export EDITOR="mate -w"
export CLICOLOR=1

alias pyg='/usr/local/bin/pygmentize'
alias mysqlstart='/usr/local/bin/mysql.server start'
alias mysqlstop='/usr/local/bin/mysql.server stop'

alias restart_sound="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"
alias itunes="lsof | grep iTunes | grep TCP | grep ESTABLISHED" # show who listens to my iTunes library

alias ll="ls -lahL"
alias ..="cd .."
alias ...="cd ../.."

alias topmem="top -o mem -s 10"

alias server="python -m SimpleHTTPServer 8000"


source $SCRIPTS/git-completion.bash
