# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt style {{{
if [ -x "$(which tput)" ] && tput setaf 1 >&/dev/null ; then
  if [ -z "$SSH_CONNECTION" ]; then
    prompt_ab=5
  else
    prompt_ab=6
  fi
  prompt_style="$(tput bold)$(tput smul)$(tput setaf 7)$(tput setab $prompt_ab)"
  prompt_plain="$(tput sgr0)"
  unset prompt_ab
else
  prompt_style=
  prompt_plain=
fi

if [ -z "$SSH_CONNECTION" ]; then
  prompt_text='\W\$'
else
  prompt_text='\u@\h \W\$'
fi

PS1="\[$prompt_style\]$prompt_text\[$prompt_plain\] "

unset prompt_style
unset prompt_plain
unset prompt_text

# new line after output
PROMPT_COMMAND="echo;"
# }}}

alias l='ls -CFG'
alias la='l -A'
alias ll='l -lh'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ "$(uname -s)" = "Darwin" -a -x "$(which brew)" ] ; then 
  PATH="/usr/local/bin:${PATH}"
  if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
  fi
fi

SCALA_HOME="${HOME}/bin/scala"
PATH="${HOME}/bin:${SCALA_HOME}/bin:${PATH}"
EDITOR=vim

bind '"\C-x\C-w": unix-filename-rubout'

grephere() {
  grep -r -I "$@" .
}

settitle() {
  echo -ne "\e]0;$*\a"
}

vim_less="/usr/share/vim/vim73/macros/less.sh" 
if [ -x "$vim_less" ]; then
    alias less="$vim_less"
fi

cdl() {
    cd "$@" && /bin/ls -l ;
}

if [ -x /usr/bin/tput ]; then
  cls() {
    tput reset
  }
fi

if [ -f "$HOME/.bashrc.local" ]; then
  . "$HOME/.bashrc.local"
fi
