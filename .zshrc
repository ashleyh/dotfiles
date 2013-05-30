_maybe_source() {
  [ -e "$1" ] && source "$1"
  return 0
}

_maybe_source "$HOME/.zshrc.before"
_maybe_source "$HOME/.zshrc.local"

setopt interactivecomments

ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom
ZSH_THEME="ash"
COMPLETION_WAITING_DOTS="true"
plugins=(mercurial git zsh-syntax-highlighting command-not-found zaw)

source $ZSH/oh-my-zsh.sh

bindkey -s '^[gu' '^[qcd ..^j'
bindkey -s '^[gl' '^[qdirs -p^j'
bindkey -s '^[go' '^[qpushd +1^j'
bindkey -s '^[gi' '^[qpushd -0^j'

export EDITOR=vim VISUAL=vim
alias v=vim

export SAVEHIST=999999
export HISTSIZE=999999

alias apts='aptitude search'
alias sai='sudo aptitude install'
alias py='python2'
alias py3='python3'
alias f='find'
alias hi='history'
alias g='grep'

_maybe_source "$HOME/.zshrc.after"
