_maybe_source() {
  [ -e "$1" ] && source "$1"
  return 0
}

_maybe_source "$HOME/.zshrc.before"
_maybe_source "$HOME/.zshrc.local"
