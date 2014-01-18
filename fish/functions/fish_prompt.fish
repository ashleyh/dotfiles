function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  echo

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  printf '%s\n' (__fish_git_prompt)

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n ' $ '

end
