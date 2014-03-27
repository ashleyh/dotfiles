alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gcl='git clone'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdv='git diff | view -'
alias gdvc='git diff --cached | view -'
alias gf='git fetch --all'
alias gh='git help'
alias gl='git pull --ff-only'
alias glr='git pull --rebase'
alias gm='git merge'
alias gmv='git mv'
alias gp='git push'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grm='git rm'
alias grs='git reset'
alias gs='git status'
alias gsh='git show'
alias gst='git status'
alias gsta='git stash'
alias gstal='git stash list'
alias gstap='git stash pop'

function glg() {
  git log --color --graph --all --max-count=100 \
    --pretty=format:'%h %an @ %ad %d%n %s%n' --date=short \
    "$@" \
    | less -SR
}
