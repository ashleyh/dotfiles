autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

setopt interactivecomments
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt multios

export EDITOR=vim VISUAL=vim

# copied from omz {{{
## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-R"

export LC_CTYPE=$LANG
#}}}
