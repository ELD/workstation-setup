# Need to do this, otherwise it uses legacy vi for some reason
alias vi="vim"

# Rust CLI utilities
alias ls="exa"
alias ps='procs'
alias cat='bat'
alias less='bat'
alias grep='rg'
alias find='fd'
alias du='dust'
alias time='hyperfine'
alias top='ytop'
alias objdump='bingrep'
alias http-server='miniserve'
alias license='licensor'

# Git aliases
alias git="hub"
alias gst="git status"
alias gpp="git pull --rebase=preserve && git push"
alias gap='git add -p'
alias wipit="git add . && git ci -m 'wip' && git push"
alias gcia="git ci --amend --no-edit"

