zreload() {
  _get_zsh_files
  for file ($_zsh_files) ; do 
    if grep -q '^## idempotent' $file ; then
      echo $file
      source $file
    fi
  done
}

## idempotent
