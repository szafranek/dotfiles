# $SCRIPTS can be exported before this script
if [ -z "$SCRIPTS" ]
then
	SCRIPTS=$HOME/work/dotfiles/scripts
fi

# needed by VSCode terminal
set -o emacs

export PATH="$SCRIPTS/bin:$PATH"
source $SCRIPTS/git-prompt.zsh
source $SCRIPTS/zsh-syntax-highlighting.zsh
source $SCRIPTS/colored-man-pages.plugin.zsh

# Command autocomplete
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit -i
zstyle ':completion:*:*:git:*' script $SCRIPTS/git-completion.sh

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Clear line with Ctrl+U
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

# Don't remove spaces from completion
ZLE_REMOVE_SUFFIX_CHARS=""


# fzf configuration
export FZF_DEFAULT_OPTS='--height 40%  --multi'
export FZF_DEFAULT_COMMAND="fd -H . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

source <(fzf --zsh)

export PATH=/usr/local/bin:$SCRIPTS:$PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# Increase the default limit for file descriptors
ulimit -n 4096

# make bash `help` command work in zsh
autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help


export EDITOR=vim
export CLICOLOR=1

export MYSQL_DIR='/usr/local/var/mysql'

export BAT_THEME="Monokai Extended Light"
export BAT_STYLE=numbers,changes
export BAT_PAGER=""


export PROMPT='%C $(gitprompt)%# '


alias grep="grep --color=auto"
alias ..="cd .."
alias ...="cd ../.."
alias cls="clear && ll"

alias g="git"
alias gd="git diff"
alias gl="git l"
alias gp="git p"
alias gs="git status"

alias dotfiles="cd ~/work/dotfiles"
alias work="cd ~/work"

alias pe=pipenv
alias poe=poetry
alias pr="poetry run"
alias ip=ipython
alias y=yt-dlp
alias vpython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'" # ipython inside a virtualenv
alias doco=docker-compose
alias mysqlstart='/usr/local/bin/mysql.server start'
alias mysqlstop='/usr/local/bin/mysql.server stop'

alias night="nightlight toggle"
alias dns_flush="sudo killall -HUP mDNSResponder"

if [[ "$OSTYPE" == "darwin"* ]]
then
	alias ll="ls -lahLT"
else
	alias ll="ls -lahL"
fi

alias topmem="top -o mem -s 10"
alias server="python -m http.server 8000"


export PYENV_ROOT="$HOME/.pyenv"
if [[ -d "$PYENV_ROOT" ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi


 # make directory and enter it
mdc() {
    mkdir -p "$@" && cd "$@"
}

restart_sound() {
    sudo kill -9 `ps ax | grep 'coreaudio[a-z]' | awk '{print $1}'`
}

kill-by-port() {
    kill "$(lsof -t -i :$1)"
}

ports() {
    sudo lsof -iTCP -sTCP:LISTEN -n -P | awk 'NR>1 { print $9,$2 }' | sed 's/.*://' | while read port pid; do echo "$port\t$(ps -p $pid -o command= | sed 's/^-//')\t$pid"; done | sort -un
}

# git clone and enter the new directory
gclone() {
    repo="$1"
    directory=$(echo $repo | awk -F/ '{print $NF}' | sed s/.git//)
    git clone $repo && cd $directory
}

idea() {
    open -a "IntelliJ IDEA.app" --args "$@"
}
