################################################################################
# Abbreviations
################################################################################

# Git
abbr -a -g ga git add
abbr -a -g gaa git add --all
abbr -a -g gb git branch
abbr -a -g gba git branch -a
abbr -a -g gbd git branch -d
abbr -a -g gbs git bisect
abbr -a -g gbsb git bisect bad
abbr -a -g gbsg git good
abbr -a -g gc git commit -v
abbr -a -g gc! git commit -v --amend
abbr -a -g gca git commit -v -a
abbr -a -g gca! git commit -v -a --amend
abbr -a -g gcam git commit -v -a -m
abbr -a -g gcb git checkout -b
abbr -a -g gcm git checkout master
abbr -a -g gco git checkout
abbr -a -g gd git diff
abbr -a -g gdca git diff --cached
abbr -a -g gf git fetch
abbr -a -g gl git pull
abbr -a -g grb git rebase
abbr -a -g grbc git rebase --continue
abbr -a -g grbca git rebase --abort
abbr -a -g grbm git rebase master
abbr -a -g gst git status
abbr -a -g gstp git stash pop

# Use Rust instead of POSIX
abbr -a -g cat bat
abbr -a -g ls exa
abbr -a -g grep rg
abbr -a -g find fd

################################################################################
# Environment
################################################################################

# Path
set PATH ~/.cargo/bin $PATH

# Make sure our SHELL is fish
set --export SHELL /usr/local/bin/fish

# Set NeoVim as the default editor
set --export EDITOR nvim

# Use bat as git's pager
set --export GIT_PAGER bat

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

################################################################################
# FZF
################################################################################

# Use fd for faster fzf
set --export FZF_DEFAULT_COMMAND 'rg --files --hidden --follow'
