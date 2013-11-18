zmodload zsh/zprof

_maybe_source() {
  [ -e "$1" ] && source "$1"
  return 0
}

_maybe_source "$HOME/.zshrc.before"
_maybe_source "$HOME/.zshrc.local"

if [ -n "$DISPLAY" -a -e "$(which gnome-keyring-daemon)" ]; then
  export $(gnome-keyring-daemon -sd)
fi

setopt interactivecomments

ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom
ZSH_THEME="ash"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE=true
plugins=(
  mercurial
  git
  command-not-found
  zaw
  zsh-syntax-highlighting
  vi-mode
  brew
  colored-man
  django
  history
  pip
  virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

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
  # defeat special BSD find
  find() {
    if [[ ( $# == 0 ) || ( "$1" =~ "-.*" ) ]] ; then
      /usr/bin/find . "$@"
    else
      /usr/bin/find "$@"
    fi
  }
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

_maybe_source "$HOME/.zshrc.after"
