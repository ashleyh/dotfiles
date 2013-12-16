zle_keymap_select_redraw_prompt() {
  zle reset-prompt
  zle -R
}

zle_keymap_select_functions+=(zle_keymap_select_redraw_prompt)
