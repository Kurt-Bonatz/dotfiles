################################################################################
# Zplug https://github.com/zplug/zplug
################################################################################
source ~/.zplug/init.zsh

 zplug "djui/alias-tips"
 zplug "mafredri/zsh-async"
 zplug "plugins/git", from:oh-my-zsh
 zplug "modules/utility", from:prezto
 zplug "plugins/adb", from:oh-my-zsh
 zplug "sindresorhus/pure", use:pure.zsh, as:theme
 zplug "zdharma/fast-syntax-highlighting", defer:2
 zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

################################################################################
# Autoload
################################################################################

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -Uz compinit
compinit

################################################################################
# Environment
################################################################################

#PATH
export PATH=$PATH:$HOME/.cargo/bin

# Continue to use ZSH
export SHELL=/bin/zsh

# Neovim
export EDITOR=nvim
export VISUAL=$EDITOR

# Darkness
export BACKGROUND=dark

# Support utf-8
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

################################################################################
# History
################################################################################

# Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.histfile
fi

HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first

# Ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

# Shares history and incrementally adds to the history file
setopt inc_append_history
setopt share_history

################################################################################
# Alias
################################################################################


################################################################################
# Options
################################################################################

# Invoke `cd` if typing out just a directory
setopt autocd
setopt extendedglob

################################################################################
# Contextual history
################################################################################

# Search history and highlight
searchup() {
  up-line-or-beginning-search
  _zsh_highlight_call_widget
}

# Up arrow uses history for searching
zle -N searchup
bindkey "^[[A" searchup

# Search history and highlight
searchdown() {
  down-line-or-beginning-search
  _zsh_highlight_call_widget
}

# Down arrow uses history for searching
zle -N searchdown
bindkey "^[[B" searchdown


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
