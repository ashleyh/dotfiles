autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

export EDITOR=vim
export LC_CTYPE=$LANG
export LESS="-R"
export PAGER="less"
export VISUAL=vim

ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom

setopt auto_cd
setopt auto_pushd
setopt interactivecomments
setopt long_list_jobs
setopt multios
setopt pushd_ignore_dups

autoload -U url-quote-magic
zle -N self-insert url-quote-magic
