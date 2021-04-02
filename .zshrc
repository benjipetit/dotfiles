# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# use pyenv version of python
eval "$(pyenv init -)"

# use rbenv version of ruby
eval "$(rbenv init -)"

# use a theme I like
ZSH_THEME=lambda

# make the command line behave like vi
set -o vi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bitbucket-git-helpers)

# User configuration

# PATH: 
# support for pyenv
export PATH="$(pyenv root)/shims"

# support for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

# standard binaries directories
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# support for Haskell projects
export PATH="$HOME/Library/Haskell/bin:$PATH"

# personal scripts
export PATH="$PATH:~/scripts-private:~/code/utils/scripts:~/.local/bin"

# aws cli
export PATH="/Users/ben/.ebcli-virtual-env/executables:$PATH"

# Flutter
# export PATH="$PATH:/opt/flutter/bin"
source ~/.private_path

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
export PATH="$PATH:$JAVA_HOME"
export PATH="$PATH:/opt/maven/bin"

source $ZSH/oh-my-zsh.sh
# source /Users/benjamin/code/tide/swift-app/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[ -f ~/.private_aliases ] && source ~/.private_aliases
[ -f ~/.private_env ] && source ~/.private_env

_exists() { (( $+commands[$1] )) }

_exists nvim && alias vim='nvim'

unfunction _exists

alias ll="ls -ahlvp"
alias weather="curl wttr.in"
alias covid='curl "https://corona-stats.online?top=30"'
alias ctags="`brew --prefix`/bin/ctags" # use brew installation for ctags (install with `brew install ctags`)

# Git
alias ga="git add ."
alias gc="git commit"
alias gac="ga;gc"
alias gp="git pull"
alias gg="stash;git co develop;gp;pop"
alias gs="git st"
alias stash="git stash save"
alias pop="git stash pop"
alias br="git co -b"
alias push="git push"
alias prune="git remote prune origin"
alias pruner="git gc --prune=now"
alias prunest="prune && pruner"

alias gday="git shortlog -sn --since=$(date -v-1d +%F)"
alias gweek="git shortlog -sn --since=$(date -v-1w +%F)"
alias gmonth="git shortlog -sn --since=$(date -v-1m +%F)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# support for nnn
# when quitting with ^G, I want to go to the selected dir.
export NNN_TMPFILE="/tmp/nnn"

n()
{
    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
        . $NNN_TMPFILE
        rm $NNN_TMPFILE
    fi
}

# Ruby

# ruby-build:
# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following to your .zshrc
# Note: this may interfere with building old versions of Ruby (e.g <2.4) that use OpenSSL <1.1.
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ben/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ben/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ben/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ben/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
