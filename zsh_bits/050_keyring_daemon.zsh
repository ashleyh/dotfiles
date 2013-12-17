if [[ -n "$DISPLAY" ]] ; then
  if [[ -e "$(which gnome-keyring-daemon)" ]] ; then
    export $(gnome-keyring-daemon -sd)
  elif [[ -e "$(which mate-keyring-daemon)" ]] ; then
    export $(mate-keyring-daemon -sd)
  fi
fi
