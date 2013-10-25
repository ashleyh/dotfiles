# based on blinks

if [[ $EUID -eq 0 ]] ; then
  _prompt_who_style="%F{black}%K{red}"
elif [[ -n $SSH_CLIENT ]] ; then
  _prompt_who_style="%F{black}%K{yellow}"
else
  _prompt_who_style="%F{black}%K{blue}"
fi

_prompt_who="%{$_prompt_who_style%}(%n@%m)%{%K{black}%}"

if [[ -n $(hg showconfig extensions.prompt) ]] ; then
  hg_prompt_info() {
    hg prompt --angle-brackets \
"$ZSH_THEME_GIT_PROMPT_PREFIX"\
'<branch>'\
"$ZSH_THEME_GIT_PROMPT_SUFFIX" 2>/dev/null
  }
else
  hg_prompt_info() {
  }
fi

venv_prompt_info() {
  if [[ -n $VIRTUAL_ENV ]] ; then
    echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX"\
"${VIRTUAL_ENV:t}"\
"$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

keymap_prompt_info() {
  if [[ ( -n $KEYMAP ) && ( $KEYMAP != main ) ]] ; then
    echo -n "$KEYMAP "
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

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
'%{%B%F{green}%}$(git_prompt_info)'\
'%{%B%F{green}%}$(hg_prompt_info)'\
'%{%B%F{green}%}$(venv_prompt_info)'\
'%E'\
$'\n'\
'%{%f%k%b%} $(keymap_prompt_info)%# '

RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
