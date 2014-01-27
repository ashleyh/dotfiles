export HISTFILE=$HOME/.zsh_history
export SAVEHIST=999999
export HISTSIZE=999999

# from omz
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
