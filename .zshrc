# $SCRIPTS can be exported before this script
if [ -z "$SCRIPTS" ]
then
	SCRIPTS=$HOME/work/dotfiles/scripts
fi

source $SCRIPTS/git-prompt.zsh
source $SCRIPTS/zsh-syntax-highlighting.zsh
source $SCRIPTS/colored-man-pages.plugin.zsh

zstyle ':completion:*:*:git:*' script $SCRIPTS/git-completion.sh
autoload -Uz compinit && compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


bindkey \^U backward-kill-line

# Alt+Backspace
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir


# Alt+Left
backward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-word
}
zle -N backward-word-dir
bindkey "^[[1;9C" forward-word-dir

# Alt+Right
forward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle forward-word
}
zle -N forward-word-dir
bindkey "^[[1;9D" backward-word-dir


ZLE_REMOVE_SUFFIX_CHARS=""


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


export EDITOR=vim
export CLICOLOR=1

export MYSQL_DIR='/usr/local/var/mysql'

export BAT_THEME="Monokai Extended Light"
export BAT_STYLE=numbers,changes


export PROMPT='%C $(gitprompt)%# '


alias grep="grep --color=auto"
alias ..="cd .."
alias ...="cd ../.."
alias cls="clear && ll"

alias g="git"
alias gd="git diff"
alias gl="git l"
alias gs="git status"

alias dotfiles="cd ~/work/dotfiles"
alias work="cd ~/work"

alias pe=pipenv
alias poe=poetry
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
if [[ -d "$GOPATH" ]]; then
    export GOROOT="/usr/local/opt/go/libexec"
    export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
fi


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
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
