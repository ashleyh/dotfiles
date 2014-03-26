
alias ap='sudo aptitude'
alias apts='aptitude search'
alias aq='ag -Q'
alias dig='dig +short'
alias g='grep'
alias h='history'
alias history='fc -l 1'
alias httpd='py -m SimpleHTTPServer'
alias ipy='ipython' # as opposed to ironpython
alias ll='l -lh'
alias m='./manage.py'
alias pong='ping 8.8.8.8'
alias py3='python3'
alias py='python2'
alias q='exit'
alias rb='ruby'
alias sai='sudo aptitude install'
alias t='python ~/apps/t/t.py --task-dir ~/misc/tasks --list tasks'
alias v=vim
alias vi3='v ~/dotfiles/.i3/config'
alias vv='v ~/dotfiles/.vimrc'
alias vz='v ~/dotfiles/zsh'

function hgdv() {
  hg diff "$@" | view -
}

function hglg() {
  hg glog --color=always "$@" | less -R
}

function pips() {
  pip search "$@" | least
}

function tree() {
  command tree "$@" | least
}

## idempotent
