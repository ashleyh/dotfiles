# adapted from something from the zsh wiki

typeset -Ag abbreviations
abbreviations=(
  "g" " | grep"
  "l" " | less"
  "s" " | sort"
)

magic-abbrev-expand() {
    emulate -L zsh
    setopt extendedglob
    local MATCH
    LBUFFER=${LBUFFER%%(#m),[_a-zA-Z0-9]#}
    local key=$MATCH[2,-1]
    LBUFFER+=${abbreviations[$key]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
