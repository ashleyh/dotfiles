# based on blinks

_prompt_char() {
  if git branch >/dev/null 2>&1; then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  elif hg root >/dev/null 2>&1; then
    echo "%{%F{blue}%}☿%{%f%k%b%}"
  else
    echo ' '
  fi
}

hg_prompt_info() {
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT=\
'%{%b%F{red}%}%(?..(\$? = $?%)
)'\
'
%{%f%k%b%}'\
'%{%K{black}%B%F{green}%}%n'\
'%{%B%F{blue}%}@'\
'%{%B%F{cyan}%}%m'\
'%{%B%F{green}%} '\
'%{%b%F{yellow}%K{black}%}%~'\
'%{%B%F{green}%}$(git_prompt_info)'\
'%{%B%F{green}%}$(hg_prompt_info)'\
'%E
'\
'%{%f%k%b%}'\
'%{%K{black}%}$(_prompt_char)'\
'%{%K{black}%} %#'\
'%{%f%k%b%} '

RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
