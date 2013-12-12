isearch-vi-cmd-mode() {
  accept-search
  vi-cmd-mode
}

zle -N isearch-vi-cmd-mode

bindkey -e
bindkey '^[v' vi-cmd-mode
bindkey -M isearch '^[v' isearch-vi-cmd-mode
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L vi-end-of-line
bindkey -s '^[gu' '^[qcd ..^j'
bindkey -s '^[gl' '^[qdirs -p^j'
bindkey -s '^[go' '^[qpushd -1^j'
bindkey -s '^[gi' '^[qpushd +0^j'
bindkey '^[gz' zaw-cdr
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
