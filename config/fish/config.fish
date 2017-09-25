# Make sure our SHELL is fish
set --export SHELL /usr/bin/fish

# Set NeoVim as the default editor
set --export EDITOR nvim

# Remove default fish greeting
set --erase fish_greeting

# Set theme to Gruvbox (Fisherman + bobthefish theme)
set -g theme_color_scheme gruvbox

# Git aliases
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbs="git bisect"
alias gbsb="git bisect bad"
alias gbsg="git good"
alias gc="git commit -v"
alias gc!="git commit -v --amend"
alias gca="git commit -v -a"
alias gca!="git commit -v -a --amend"
alias gcam="git commit -v -a -m"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gco="git checkout"
alias gd="git diff"
alias gdca="git diff --cached"
alias gf="git fetch"
alias gl="git pull"
alias grb="git rebase"
alias grbca="git rebase --abort"
alias grbc="git rebase --continue"
alias gst="git status"
