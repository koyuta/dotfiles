export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/opt/bin:/usr/bin:$PATH

# envvars
export LANG=ja_JP.UTF-8
export KCODE=u

# zsh settings
autoload -Uz colors
colors
autoload -Uz compinit
compinit -u
setopt ignoreeof
setopt COMBINING_CHARS

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

ulimit -n 4096

# Do not distinct upper and lower case letter then tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Print filename in Japanese
setopt print_eight_bit

# VCS setting
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' formats '(%b%c%u)'
zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# prompt setting
PROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}%1(v| %F{red}%1v%f|) "

# aliases
alias ls='ls -G'
alias ll='ls -la'
alias vi='nvim'
alias vim='nvim'
alias sed='gsed'
alias ssh='cat ~/.ssh/conf.d/*.config > ~/.ssh/config;ssh'
alias restart_network='sudo killall -HUP mDNSResponder'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# nodebrew
export NODEBREW_ROOT="$HOME/.nodebrew"
export PATH="$NODEBREW_ROOT/current/bin:$PATH"

# rust
export CARGO_PATH="$HOME/.cargo"
export PATH="$PATH:$CARGO_PATH/bin"

# attach tmux when loggin
if [[ -z "$TMUX" ]]; then
  tmux attach || tmux new-session
  exit;
fi

# keychain
if [ ! -f $HOME/.keychain/$HOSTNAME-sh ] ; then
    unset SSH_AUTH_SOCK
fi
