# based on blinks

setopt prompt_subst

if [[ $EUID -eq 0 ]] ; then
  _prompt_who_style="%F{black}%K{red}"
elif [[ -n $SSH_CLIENT ]] ; then
  _prompt_who_style="%F{black}%K{yellow}"
else
  _prompt_who_style="%F{black}%K{blue}"
fi

_prompt_who="%{$_prompt_who_style%}(%n@%m)%{%K{black}%}"

venv_prompt_info() {
  if [[ -n $VIRTUAL_ENV ]] ; then
    echo -n " (${VIRTUAL_ENV:t})"
  fi
}

keymap_prompt_info() {
  if [[ ( -n $KEYMAP ) && ( $KEYMAP != main ) ]] ; then
    echo -n "$KEYMAP "
  fi
}

zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' actionformats ' (%b%c%u) (%a)'
zstyle ':vcs_info:*' formats ' (%b%c%u)'

autoload -U add-zsh-hook
autoload -Uz vcs_info
add-zsh-hook precmd vcs_info

if [[ -z $_prompt_hide_last_status ]] ; then
  _prompt_last_status='%(?..(\$? = $?%)'$'\n)'
fi

PROMPT=\
"%{%b%F{red}%}$_prompt_last_status"\
'%{%f%k%b%}'\
$'\n'\
"$_prompt_who"\
'%{%B%F{green}%} '\
'%{%b%F{yellow}%K{black}%}(%~)'\
'%{%B%F{green}%}$vcs_info_msg_0_'\
'%{%B%F{green}%}$(venv_prompt_info)'\
'%E'\
$'\n'\
'%{%f%k%b%} $(keymap_prompt_info)%# '

RPROMPT='%{%B%F{black}%}!%!%{%f%k%b%}'

## idempotent
