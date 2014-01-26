zle-mouse-enable-and-notify() {
  zle-mouse-enable
  zle -M 'mouse enabled'
}
zle -N zle-mouse-enable-and-notify

bindkey '^[m' zle-mouse-enable-and-notify

add-zsh-hook precmd zle-mouse-disable

source $ZSH_CUSTOM/plugins/zsh-mouse/mouse.zsh
