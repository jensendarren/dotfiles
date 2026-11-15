# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/darren/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  # eval "$(pyenv virtualenv-init -)"
fi


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Ensure Homebrew zsh's core + site functions are in fpath
fpath=(
  /opt/homebrew/share/zsh/functions
  /opt/homebrew/share/zsh/site-functions
  $fpath
)
typeset -U fpath   # dedupe

ZSH_COMPDUMP="$HOME/.zcompdump-$ZSH_VERSION"

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# Ruby
# export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export GEM_HOME="$HOME/.gem"
export PATH=$PATH:/Users/darren/.point/bin/macos

source /Users/darren/.docker/init-zsh.sh || true # Added by Docker Desktop

export PATH="$PATH:/Users/darren/.foundry/bin"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/Applications/CMake.app/Contents/bin:$PATH"

# NOTE moved TON execs to /usr/local/bin/
# export PATH="/Users/darren/workspace/ton/execs/fiftexec:$PATH" 
export FIFTPATH="/usr/local/lib/fiftlib"
# GoLang
export GOROOT=/Users/darren/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/darren/go
export PATH=$GOPATH/bin:$PATH
# GoLang
export GOROOT=/Users/darren/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/darren/go
export PATH=$GOPATH/bin:$PATH
# GoLang
export GOROOT=/Users/darren/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/darren/go
export PATH=$GOPATH/bin:$PATH
# GoLang
export GOROOT=/Users/darren/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/darren/go
export PATH=$GOPATH/bin:$PATH

# export PATH="$PATH:/Users/darren/.huff/bin"

# Created by `pipx` on 2023-11-18 02:37:16
# export PATH="$PATH:/Users/darren/.local/bin"

# Created by `pipx` on 2023-11-18 02:37:18
# export PATH="$PATH:/Users/darren/Library/Python/3.8/bin"

# asdf https://asdf-vm.com/guide/getting-started.html
. "$HOME/.asdf/asdf.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/darren/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/darren/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/darren/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/darren/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/darren/.bun/_bun" ] && source "/Users/darren/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# claude system prompts (NOTE: rampup.md is in the claude-code-kit repo)
alias claude-rampup='claude --system-prompt-file ~/.claude/prompts/rampup.md'

# claude --dangerously-skip-permissions alias
alias claudeyolo='claude --dangerously-skip-permissions'

# utilities
alias psapp='f() { for pid in $(pgrep "$1"); do echo "$pid $1 $(lsof -p $pid -a -d cwd -Fn 2>/dev/null | grep ^n | cut -c2-)"; done }; f'

# hclaude - run claude inside a devcontainer
alias hclaude='HERDR_AGENT=claude devcontainer exec --workspace-folder . claude'

export NARGO_HOME="/Users/darren/.nargo"
export PATH="$PATH:$NARGO_HOME/bin"
export PATH="${HOME}/.bb:${PATH}"
export PATH="/Users/darren/.bb:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(rbenv init - zsh)"
eval "$(direnv hook zsh)"

# update omz automatically
zstyle ':omz:update' mode auto
