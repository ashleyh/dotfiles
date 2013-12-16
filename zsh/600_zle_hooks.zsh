# taken from valodim/zshrc

# add zle _functions hook arrays
typeset -aH zle_keymap_select_functions
function zle-keymap-select () {
    for f in $zle_keymap_select_functions; "${(@z)f}"
}
zle -N zle-keymap-select

typeset -aH zle_line_init_functions
function zle-line-init () {
    for f in $zle_line_init_functions; "${(@z)f}"
}
zle -N zle-line-init

typeset -aH zle_line_finish_functions
function zle-line-finish () {
    for f in $zle_line_finish_functions; "${(@z)f}"
}
zle -N zle-line-finish
