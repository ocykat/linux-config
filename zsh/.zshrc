# Path to oh-my-zsh installation.
export ZSH="/home/nhat/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="frisk"

export UPDATE_ZSH_DAYS=30

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

alias tmux='tmux -2'