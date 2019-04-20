# Path to your oh-my-zsh installation.
export ZSH="/home/nhat/.oh-my-zsh"

# Color
export TERM="xterm-256color"

# More themes: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="sobole"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="➩ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_debian_icon dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs virtualenv time)

POWERLEVEL9K_CUSTOM_DEBIAN_ICON="echo "
POWERLEVEL9K_CUSTOM_DEBIAN_ICON_FOREGROUND=015
POWERLEVEL9K_CUSTOM_DEBIAN_ICON_BACKGROUND=000


# Case-sensitive completion.
# CASE_SENSITIVE="true"

# Hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Disable colors in ls.
# DISABLE_LS_COLORS="true"

# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time stamp shown in the history command output.
# Three format options:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications, see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Format: plugins=(rails git textmate ruby lighthouse)
# Too many plugins slow down shell startup.
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
plugins=(git, python)


source $ZSH/oh-my-zsh.sh


# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/sbin:$PATH

export PATH="$HOME/neovim/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

export EDITOR='vim'

# Fix nvim conflicts
export VTE_VERSION="100"


# tmuxinator
source ~/.bin/tmuxinator.zsh

# alias
alias open='xdg-open'
alias tmux='tmux -2'
#alias tmux='TERM=screen-256color-bce tmux'
alias clion='/opt/clion-2018.3.2/bin/clion.sh &'
alias sudo_clion='/opt/clion-2018.3.2/bin/clion.sh &'
alias emacs='~/programs/emacs/bin/emacs'
alias mars='~/programs/mars/mars'
alias mux='tmuxinator'
alias subl='/opt/sublime_text_3/sublime_text'

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
    #[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        #eval "$("$BASE16_SHELL/profile_helper.sh")"


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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
