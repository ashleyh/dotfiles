
alias history='fc -l 1'
alias v=vim
alias apts='aptitude search'
alias sai='sudo aptitude install'
alias py='python2'
alias py3='python3'
alias g='grep'
alias q='exit'
alias t='python ~/apps/t/t.py --task-dir ~/misc/tasks --list tasks'
alias ipy='ipython' # as opposed to ironpython
alias m='./manage.py'
alias ll='l -lh'
alias vv='v ~/dotfiles/.vimrc'
alias vz='v ~/dotfiles/zsh'
alias vi3='v ~/dotfiles/.i3/config'
alias httpd='py -m SimpleHTTPServer'
alias dig='dig +short'

function hgdv() {
  hg diff "$@" | view -
}

function hglg() {
  hg glog --color=always "$@" | less -R
}
