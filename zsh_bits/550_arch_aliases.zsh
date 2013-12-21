alias ys='yaourt -S'

function yss() {
  yaourt --color=always -Ss "$@" | less -R
}
