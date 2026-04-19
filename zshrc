# Add our functions to the search path
FPATH="$FPATH:$HOME/.zsh/func"

# Set custom prompt
autoload -Uz promptinit
promptinit
prompt tessro

# Initialize completion
autoload -U compinit
compinit -D

# Add paths
export PATH="$HOME/bin:$PATH:$HOME/.local/bin"

# Brew
[ -d /opt/homebrew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -d /home/linuxbrew/.linuxbrew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Rust
if [[ -s $HOME/.cargo/env ]] ; then source $HOME/.cargo/env ; fi

# Go
if command -v go &>/dev/null ; then export PATH="$(go env GOPATH)/bin:$PATH" ; fi

# Handy
function mkcd () {
  mkdir -p "$*"
  cd "$*"
}

# Colorize terminal
if [[ $OSTYPE == darwin* ]] ; then
  alias ls='ls -G'
  alias ll='ls -lG'
  export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
else
  alias ls='ls --color=auto'
  alias ll='ls -l --color=auto'
fi
export GREP_OPTIONS="--color=auto"

# Enable history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt appendhistory

# We want `cursor` in Cursor
if [ -z $EDITOR ]; then
  export EDITOR=nvim
fi

# use emacs mode on the command line
bindkey -e

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

if [[ $OSTYPE == darwin* ]] ; then source ~/.zshrc.darwin ; fi
if uname -r | grep -q microsoft-standard-WSL2 ; then source ~/.zshrc.wsl2 ; fi
if [[ -s ~/.zshrc.local ]] ; then source ~/.zshrc.local ; fi

if command -v wt >/dev/null 2>&1 ; then eval "$(wt config shell init zsh)" ; fi
command -v fnox >/dev/null && eval "$(fnox activate zsh)"
command -v mise >/dev/null && eval "$(mise activate zsh)"

export AWS_DEFAULT_REGION="us-west-2"

# Disable the use of the Amazon EC2 instance metadata service (IMDS). This
# eliminates a potential security risk and also speeds up failure of aws
# commands when no profile is selected.
export AWS_EC2_METADATA_DISABLED="true"

# Zellij
alias z="zellij"
alias zl="zellij ls"
zc() { zellij --session "${1:-${PWD:t}}" "${@:2}" }
za() { zellij attach "${1:-${PWD:t}}" "${@:2}" }

# Open a new zellij tab for a project with claude+shell layout
zellij-new-worktree() {
  local repos_dir="${HOME}/repos"
  local selected

  selected=$(find "$repos_dir" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | \
    sed "s|^${repos_dir}/||" | \
    sort | \
    fzf --height=40% --reverse --prompt="project> ")

  [[ -z "$selected" ]] && return 0

  local project_path="${repos_dir}/${selected}"
  local tab_name="${selected:0:20}"  # truncate to 20 chars

  zellij action new-tab --layout project --name "$tab_name" --cwd "$project_path"
}

# Alias OpenTofu to `tf` if Terraform is not installed
if ! command -v tf &> /dev/null; then
  alias tf=tofu
fi
