# Correct spelling for commands
setopt correct

# Turn off correct for filenames
unsetopt correctall

ZSH_DISABLE_COMPFIX="true"

# Clone zgen if you haven't already
if [[ -z "$ZGEN_PARENT_DIR" ]]; then
  ZGEN_PARENT_DIR=$HOME
fi
if [[ ! -f $ZGEN_PARENT_DIR/.zgen/zgen.zsh ]]; then
  if [[ ! -d "$ZGEN_PARENT_DIR" ]]; then
    mkdir -p "$ZGEN_PARENT_DIR"
  fi
  pushd $ZGEN_PARENT_DIR
  git clone git@github.com:tarjoilija/zgen.git
  popd
fi
source $ZGEN_PARENT_DIR/.zgen/zgen.zsh
unset ZGEN_PARENT_DIR

if ! zgen saved; then
  echo "Creating a zgen save"
  ZGEN_LOADED=()
  ZGEN_COMPLETIONS=()

  # Specify plugins
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/bundler
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/sudo
  zgen load unixorn/autoupdate-zgen
  zgen load unixorn/git-extra-commands
  zgen load unixorn/rake-completion.zshplugin
  zgen load Tarrasch/zsh-bd
  zgen load ltj/gitgo
  zgen load iam4x/zsh-iterm-touchbar
  zgen load chrissicool/zsh-256color
  zgen load supercrabtree/k
  zgen load djui/alias-tips

  if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    # Load macOS-specific plugins
    #zgen oh-my-zsh plugins/brew
    #zgen oh-my-zsh plugins/osx
  fi

  # Completions
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  # Up/Down Arrow for History Substring Search
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  bindkey '^T' autosuggest-toggle
  zstyle ':completion:*' menu select

  # Theme
  # zgen load https://github.com/denysdovhan/spaceship-prompt spaceship

  # Save to init script
  zgen save
fi

# Enable touchbar-git for iterm
TOUCHBAR_GIT_ENABLED=true

# Spaceship prompt options
# SPACESHIP_PROMPT_ORDER=(
#   time
#   user
#   dir
#   host
#   git
#   package
#   line_sep
#   battery
#   vi_mode
#   jobs
#   exit_code
#   char
# )

# SPACESHIP_RPROMPT_ORDER=(
#   node
#   ruby
#   elixir
# )

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

# Some more options
setopt pushd_ignore_dups

# Zoxide
eval "$(zoxide init zsh)"

# Start rbenv
#eval "$(rbenv init - zsh)"

# Start nodenv
#eval "$(nodenv init -)"

# Start pyenv
#eval "$(pyenv init -)"

# Start nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Add node@10 to path
export PATH="/usr/local/opt/node@10/bin:$PATH"

# Start asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable starship
eval "$(starship init zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
