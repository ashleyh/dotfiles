source $ZSH/lib/completion.zsh

ZSH_COMPDUMP="$HOME/.zcompdump-${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"
