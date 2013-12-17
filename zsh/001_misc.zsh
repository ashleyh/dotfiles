autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

setopt interactivecomments

export EDITOR=vim VISUAL=vim
