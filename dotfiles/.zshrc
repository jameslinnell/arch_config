# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="strug"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws asdf chucknorris colored-man-pages command-not-found eza httpie zsh-interactive-cd jsontools sudo)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.atuin/bin/env"

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
# eval "$(thefuck --alias)"
#eval "$(zellij --layout .config/zellij/my-layout.kdl setup --generate-auto-start zsh)"
#export PATH="~/.local/bin/"
alias vim=nvim
alias nvf="nvim \$(fzf)"
alias cat=batcat
alias bfz="batcat \$(fzf)"
export PATH=~/.local/bin:$PATH

# CPM
alias cpm-full="sh ~/Scripts/run-cpm.sh"
alias cpm-full-ignore="sh ~/Scripts/run-cpm.sh --build --test --destroy --ignore"
alias cpm-start="sh ~/Scripts/run-cpm-tmux.sh"
alias cpm-build="sh ~/Scripts/run-cpm.sh --build"
alias cpm-test="sh ~/Scripts/run-cpm.sh --test"
alias cpm-test-unit="sh ~/Scripts/run-cpm.sh --unittest"
alias cpm-test-int="sh ~/Scripts/run-cpm.sh --inttest"
alias cpm-test-floc="sh ~/Scripts/run-cpm.sh --feattest"
alias cpm-test-fint="sh ~/Scripts/run-cpm.sh --featinttest"
alias cpm-test-smoke="sh ~/Scripts/run-cpm.sh --smoketest"
alias cpm-stop="sh ~/Scripts/run-cpm.sh --destroy"
alias cpm-build-test="sh ~/Scripts/run-cpm.sh --build --test"
alias cpm-build-test-ignore="sh ~/Scripts/run-cpm.sh --build --test --ignore"
alias cpm-test-stop="sh ~/Scripts/run-cpm.sh --test --destroy"

alias lg=lazygit
alias lsls="exa -h -a -1 -l -r --sort name --tree -L 1 --group-directories-first --total-size --time-style iso --git --icons=auto"
alias ls="exa -h -a -1 -l -r --sort name --tree -L 1 --group-directories-first --total-size --time-style iso --git --no-permissions --no-user --no-time --icons=auto"
alias cdf="cd \$(find . -type d | fzf)"
alias cdcpm="cd ~/Development/NHS/CPM/connecting-party-manager/"
alias crypto="clear; python ~/Scripts/crypto.py"
source ~/.zsh_plugins/cpm/cpm.plugin.zsh
