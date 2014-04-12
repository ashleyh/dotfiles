isearch-vi-cmd-mode() {
  accept-search
  vi-cmd-mode
}

zle -N isearch-vi-cmd-mode

bindkey -e

zmodload zsh/terminfo

zle_line_init_functions+=('echoti smkx')
zle_line_finish_functions+=('echoti rmkx')

bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
bindkey "${terminfo[kcud1]}" history-beginning-search-forward

# from OMZ {{{
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey "^[m" copy-prev-shell-word
# }}}

bindkey '^[v' vi-cmd-mode
bindkey -M isearch '^[v' isearch-vi-cmd-mode
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L vi-end-of-line
bindkey -s '^[gu' '^[qcd ..^j'
bindkey -s '^[gl' '^[qdirs -p^j'
bindkey -s '^[go' '^[qpushd +1^j'
bindkey -s '^[gi' '^[qpushd -0^j'
bindkey '^[gz' zaw-cdr
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
bindkey -s '^Z' '^[qfg %%^j'
