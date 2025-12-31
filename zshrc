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

# Rust
if [[ -s $HOME/.cargo/env ]] ; then source $HOME/.cargo/env ; fi

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

# GPG
export GPG_TTY="$(tty)"

if which hub >/dev/null ; then alias git=hub ; fi

if [[ $OSTYPE == darwin* ]] ; then source ~/.zshrc.darwin ; fi
if uname -r | grep -q microsoft-standard-WSL2 ; then source ~/.zshrc.wsl2 ; fi
if [[ -s ~/.zshrc.local ]] ; then source ~/.zshrc.local ; fi

if which rbenv >/dev/null ; then eval "$(rbenv init -)" ; fi
if which pyenv >/dev/null ; then eval "$(pyenv init -)" ; fi
if which pyenv-virtualenv >/dev/null ; then eval "$(pyenv virtualenv-init -)" ; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "$HOME/.local/bin/mise" ] && eval "$(~/.local/bin/mise activate zsh)"
[ -d /home/linuxbrew/.linuxbrew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Avoid cluttering the system namespace by accident
export PIP_REQUIRE_VIRTUALENV=true

export AWS_DEFAULT_REGION="us-west-2"

# Disable the use of the Amazon EC2 instance metadata service (IMDS). This
# eliminates a potential security risk and also speeds up failure of aws
# commands when no profile is selected.
export AWS_EC2_METADATA_DISABLED="true"

# Alias OpenTofu to `tf` if Terraform is not installed
if ! command -v tf &> /dev/null; then
  alias tf=tofu
fi