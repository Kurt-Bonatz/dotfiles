################################################################################
# Abbreviations
################################################################################

# Git
abbr -a ga git add
abbr -a gaa git add --all
abbr -a gb git branch
abbr -a gba git branch -a
abbr -a gbd git branch -D
abbr -a gbs git bisect
abbr -a gbsb git bisect bad
abbr -a gbsg git good
abbr -a gc git commit -v
abbr -a gc! git commit -v --amend
abbr -a gca git commit -v -a
abbr -a gca! git commit -v -a --amend
abbr -a gcam git commit -v -a -m
abbr -a gcb git checkout -b
abbr -a gcm git checkout master
abbr -a gco git checkout
abbr -a gd git diff
abbr -a gdca git diff --cached
abbr -a gf git fetch
abbr -a gl git pull
abbr -a glg git log --oneline
abbr -a grb git rebase
abbr -a grbc git rebase --continue
abbr -a grbca git rebase --abort
abbr -a grbm git rebase master
abbr -a gst git status
abbr -a gstp git stash pop

# Use Rust instead of POSIX
abbr -a cat bat
abbr -a find fd
abbr -a grep rg
abbr -a ls exa
abbr -a vimdiff delta
abbr -a top ytop
abbr -a htop ytop
abbr -a cd z

################################################################################
# Environment
################################################################################

# Path
set PATH ~/.cargo/bin ~/Library/Android/sdk/platform-tools/ $PATH

# Make sure our SHELL is fish
set --export SHELL /usr/local/bin/fish

# Set NeoVim as the default editor
set --export EDITOR nvim

# Set ANDROID_HOME
set --export ANDROID_HOME /Users/kbonatz/Library/Android/sdk

# Set up java 8 for android
set --export JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/

# Darkness
set --export BACKGROUND dark

# Support utf-8
set --export LANG "en_US.UTF-8"
set --export LC_COLLATE "en_US.UTF-8"
set --export LC_CTYPE "en_US.UTF-8"
set --export LC_MESSAGES "en_US.UTF-8"
set --export LC_MONETARY "en_US.UTF-8"
set --export LC_NUMERIC "en_US.UTF-8"
set --export LC_TIME "en_US.UTF-8"
set --export LC_ALL "en_US.UTF-8"

# Remove default fish greeting
set --erase fish_greeting
starship init fish | source
zoxide init fish | source

################################################################################
# FZF
################################################################################

# Use fd for faster fzf
set --export FZF_DEFAULT_COMMAND 'fd --type f'
set --export FZF_CTRL_T_COMMAND 'fd --type f'

################################################################################
# Base16 theming
################################################################################
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
