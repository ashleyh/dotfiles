zmodload zsh/zprof

_maybe_source() {
  [ -e "$1" ] && source "$1"
  return 0
}

_maybe_source "$HOME/.zshrc.before"
_maybe_source "$HOME/.zshrc.local"

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

if [ -n "$DISPLAY" -a -e "$(which gnome-keyring-daemon)" ]; then
  export $(gnome-keyring-daemon -sd)
fi

setopt interactivecomments

export EDITOR=vim VISUAL=vim
export VIRTUAL_ENV_DISABLE_PROMPT=1
export WORKON_HOME="$HOME/.virtualenvs"
