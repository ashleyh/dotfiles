alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gch='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdv='git diff | view -'
alias gdvc='git diff --cached | view -'
alias gf='git fetch --all'
alias gl='git pull --ff-only'
alias gm='git merge'
alias gp='git push'
alias grm='git rm'
alias gs='git status'
alias gst='git status'
alias gsta='git stash'

function glg() {
  git log --color --graph --all --max-count=100 \
    --pretty=format:'%h %an @ %ad %d%n %s%n' --date=short \
    "$@" \
    | less -SR
}
