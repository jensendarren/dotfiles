export EDITOR=nano

# Git alias
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gg='git grep -n '

# Docker
alias ks='kubectl'
alias dc='docker-compose'
alias dp='docker ps'
alias di='docker images'

# Docker helper functions
dcr() { docker-compose run --rm "$@"; }
drun() { docker run -it --entrypoint bash "$1"; }

# dexec is a helper function to start a bash terminal in a running docker container
dexec() { docker exec -it "$1" bash; }

# dclean is a helper function to remove unused docker images and prune docker system resources
dclean() { docker stop $(docker ps -a -q); docker rm -f $(docker ps -a -q); docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}"); docker system prune -f; docker system prune --volumes -f; }

#  workspace
alias wk='cd ~/workspace/'

# claude --dangerously-skip-permissions alias
alias claudeyolo='claude --dangerously-skip-permissions'

# claude system prompts (NOTE: rampup.md is in the claude-code-kit repo)
alias claude-rampup='claude --system-prompt-file ~/.claude/prompts/rampup.md'

# utilities
alias psapp='f() { for pid in $(pgrep "$1"); do echo "$pid $1 $(lsof -p $pid -a -d cwd -Fn 2>/dev/null | grep ^n | cut -c2-)"; done }; f'
