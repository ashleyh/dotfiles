
alias v=vim
alias apts='aptitude search'
alias sai='sudo aptitude install'
alias py='python2'
alias py3='python3'
alias g='grep'
alias q='exit'
alias t='python ~/apps/t/t.py --task-dir ~/misc/tasks --list tasks'
alias gl='git pull --ff-only'
alias ipy='ipython' # as opposed to ironpython
alias gdvc='git diff --cached'
alias glggg='git log --graph --decorate --all --max-count=100'
alias m='./manage.py'
alias gcl='git clone'
alias ff='ffind'
alias ll='l -lh'

function hgdv() {
  hg diff "$@" | view -
}

function hglg() {
  hg glog --color=always "$@" | less -R
}

function f() {
  find "$@" 2>/dev/null
}
