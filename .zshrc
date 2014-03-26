# inspired by Valodim's

_sort_by_filename() {
  REPLY="${REPLY:t}"
}

_get_zsh_files() {
  _zsh_files=($HOME/dotfiles/zsh(|_local)/*.zsh(Noe!_sort_by_filename!^-@))
}

_get_zsh_files
for file ($_zsh_files) source "$file"
