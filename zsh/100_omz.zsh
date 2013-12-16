ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom
COMPLETION_WAITING_DOTS="true"
plugins=(
  mercurial
  git
  command-not-found
  brew
  colored-man
  django
  history
  pip
  virtualenvwrapper
)

libs=(
  completion
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

for plugin ($plugins); do
    fpath=($ZSH/plugins/$plugin $fpath)
done

ZSH_COMPDUMP="$HOME/.zcompdump-${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [[ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done
