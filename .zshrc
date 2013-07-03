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
plugins=(mercurial git command-not-found zaw zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

bindkey -s '^[gu' '^[qcd ..^j'
bindkey -s '^[gl' '^[qdirs -p^j'
bindkey -s '^[go' '^[qpushd -1^j'
bindkey -s '^[gi' '^[qpushd +0^j'

export EDITOR=vim VISUAL=vim
alias v=vim
alias l='ls --color=tty'
alias ll='ls --color=tty -lh'

export SAVEHIST=999999
export HISTSIZE=999999

alias apts='aptitude search'
alias sai='sudo aptitude install'
alias py='python2'
alias py3='python3'
alias f='find'
alias hi='history'
alias g='grep'

function hgdv() {
  hg diff "$@" | view -
}

function hglg() {
  hg glog --color=always "$@" | less -R
}

_maybe_source "$HOME/.zshrc.after"
