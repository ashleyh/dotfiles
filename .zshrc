# inspired by Valodim's 

export ZSH=$HOME/dotfiles/zsh

_sort_by_filename() {
  REPLY="${REPLY:t}"
}

for file in $ZSH/*.zsh(Noe!_sort_by_filename!^-@); do
  source "$file"
done
