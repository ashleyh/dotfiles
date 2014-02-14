plugins=(
  mercurial
  command-not-found
  brew
  colored-man
  django
  pip
)

for plugin ($plugins); do
    fpath=($ZSH/plugins/$plugin $fpath)
done

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [[ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done
