zmodload zsh/zprof

_maybe_source() {
  [ -e "$1" ] && source "$1"
  return 0
}

_maybe_source "$HOME/.zshrc.before"
_maybe_source "$HOME/.zshrc.local"

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

if [ -n "$DISPLAY" -a -e "$(which gnome-keyring-daemon)" ]; then
  export $(gnome-keyring-daemon -sd)
fi

setopt interactivecomments

isearch-vi-cmd-mode() {
  accept-search
  vi-cmd-mode
}

zle -N isearch-vi-cmd-mode

bindkey -e
bindkey '^[v' vi-cmd-mode
bindkey -M isearch '^[v' isearch-vi-cmd-mode
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L vi-end-of-line
bindkey -s '^[gu' '^[qcd ..^j'
bindkey -s '^[gl' '^[qdirs -p^j'
bindkey -s '^[go' '^[qpushd -1^j'
bindkey -s '^[gi' '^[qpushd +0^j'
bindkey '^[gz' zaw-cdr
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

export UNAME="$( uname )"

export EDITOR=vim VISUAL=vim
alias v=vim
if [[ "$UNAME" == "Darwin" ]] ; then
  alias l='ls -G'
else
  alias l='ls --color=tty'
fi
alias ll='l -lh'

export SAVEHIST=999999
export HISTSIZE=999999

if [[ "$UNAME" == "Darwin" ]] ; then
  if [[ ${+commands[gfind]} == 1 ]] ; then
    # from brew install findutils
    alias find=gfind
  fi
fi

if [[ "$UNAME" == "Darwin" ]] ; then
  unalias run-help
  autoload run-help
  HELPDIR=/usr/local/share/zsh/helpfiles
fi

if [[ "$UNAME" == "Darwin" ]] ; then
  export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads
elif [[ "$UNAME" == "Linux" ]] ; then
  export PIP_DOWNLOAD_CACHE=$HOME/.cache/pip-downloads
fi

alias apts='aptitude search'
alias sai='sudo aptitude install'
alias py='python2'
alias py3='python3'
alias g='grep'
alias q='exit'
alias t='python ~/apps/t/t.py --task-dir ~/misc/tasks --list tasks'
alias gl='git pull --ff-only'
alias ipy='ipython' # as opposed to ironpython
alias gdvc='git diff --cached'
alias glggg='git log --graph --decorate --all --max-count=100'
alias m='./manage.py'
alias gcl='git clone'
alias ff='ffind'

function hgdv() {
  hg diff "$@" | view -
}

function hglg() {
  hg glog --color=always "$@" | less -R
}

function f() {
  find "$@" 2>/dev/null
}

#export REPORTTIME=0
export VIRTUAL_ENV_DISABLE_PROMPT=1
export WORKON_HOME="$HOME/.virtualenvs"

