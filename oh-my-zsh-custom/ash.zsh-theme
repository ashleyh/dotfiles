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

if [ $EUID -eq 0 ]; then
  _prompt_who_style="%F{black}%K{red}"
elif [ -n "$SSH_CLIENT" ]; then
  _prompt_who_style="%F{black}%K{yellow}"
else
  _prompt_who_style="%F{black}%K{blue}"
fi

_prompt_who="%{$_prompt_who_style%}❨%n@%m❩%{%K{black}%}"

hg_prompt_info() {
}

ZSH_THEME_GIT_PROMPT_PREFIX=" ❨%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}❩"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT=\
'%{%b%F{red}%}%(?..(\$? = $?%)
)'\
'
%{%f%k%b%}'\
"$_prompt_who"\
'%{%B%F{green}%} '\
'%{%b%F{yellow}%K{black}%}❨%~❩'\
'%{%B%F{green}%}$(git_prompt_info)'\
'%{%B%F{green}%}$(hg_prompt_info)'\
'%E
'\
'%{%f%k%b%}$ '

RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
