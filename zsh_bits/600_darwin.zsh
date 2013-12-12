alias l='ls -G'

if [[ ${+commands[gfind]} == 1 ]] ; then
  # from brew install findutils
  alias find=gfind
fi

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads


