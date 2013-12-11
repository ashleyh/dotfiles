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
