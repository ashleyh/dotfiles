# taken from zsh wiki somewhere

typeset -Ag abbreviations
abbreviations=(
  "g," "| grep"
  "l," "| less"
)

magic-abbrev-expand() {
    emulate -L zsh
    setopt extendedglob
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#,}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
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
