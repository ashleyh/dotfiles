ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom
COMPLETION_WAITING_DOTS="true"

libs=(
  correction
  directories
  functions
  grep
  history
  misc
  spectrum
  termsupport
  theme-and-appearance
)

for lib ($libs); do
  source $ZSH/lib/$lib.zsh
done

