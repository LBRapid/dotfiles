# Correct spelling for commands
setopt correct

# Turn off correct for filenames
unsetopt correctall
autoload -Uz compinit
compinit

ZSH_DISABLE_COMPFIX="false"

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Run compinit after antidote loads
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch .zcompdump
else
  compinit -C
fi

# Enable touchbar-git for iterm
TOUCHBAR_GIT_ENABLED=true

if [ -f ~/.env ]; then
  . ~/.env
fi

if [ -f ~/.env_private ]; then
  . ~/.env_private
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.functions ]; then
  . ~/.functions
fi

if [ -f ~/.functions_private ]; then
  . ~/.functions_private
fi

# Set some history options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history

bindkey ' ' magic-space

# Keep a ton of history
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

ulimit -S -n 2048

# Some more options
setopt pushd_ignore_dups

# Zoxide
eval "$(zoxide init zsh)"

# FNM is faster
eval "$(fnm env --use-on-cd)"

# Add node@10 to path
export PATH="/usr/local/opt/node@10/bin:$PATH"

# Enable starship
eval "$(starship init zsh)"

# Enable McFly (history search replacement)
eval "$(mcfly init zsh)"

# Pyenv
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Created by `pipx` on 2022-04-26 01:52:53
export PATH="$PATH:/Users/johndyer/.local/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
