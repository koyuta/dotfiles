export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/opt/bin:/usr/bin:$PATH
# envvars
export LANG=ja_JP.UTF-8
export KCODE=u
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export LDFLAGS="-L/usr/local/opt/gettext/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include"

# zsh settings
autoload -Uz colors
colors
autoload -Uz compinit
compinit -u
setopt ignoreeof
setopt COMBINING_CHARS
bindkey -d
bindkey -e

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

ulimit -n 4096

# do not distinct upper and lower case letter then tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# print filename in Japanese
setopt print_eight_bit

# vcs setting
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

# prompt
PROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}%1(v| %F{red}%1v%f|) "

# alias
alias ls='ls -G'
alias ll='ls -la'
alias vi='nvim'
alias vim='nvim'
alias ssh='cat ~/.ssh/conf.d/*.config > ~/.ssh/config;ssh'
alias restart_network='sudo killall -HUP mDNSResponder'


# homebrew for apple silicon
if [[ `uname -p` == "arm" ]]; then
  HOMEBREW_ROOT=/opt/homebrew
  export PATH=$HOMEBREW_ROOT/bin:$PATH
fi

# keychain
if [ ! -f $HOME/.keychain/$HOSTNAME-sh ] ; then
    unset SSH_AUTH_SOCK
fi
eval $(keychain -q --eval)

# openssl
export OPENSSL_ROOT="/usr/local/opt/openssl@1.1"
export PATH="$PATH:$OPENSSL_ROOT/bin"

# vscode
export VSCODE_ROOT="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app"
export PATH="$PATH:$VSCODE_ROOT/bin"

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# rbenv
#export RBENV_ROOT="$HOME/.rbenv"
#export PATH="$RBENV_ROOT/bin:$PATH"
#eval "$(rbenv init -)"

# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"

# rust
export CARGO_PATH="$HOME/.cargo"
export PATH="$PATH:$CARGO_PATH/bin"

# nodebrew
export NODEBREW_ROOT="$HOME/.nodebrew"
export PATH="$NODEBREW_ROOT/current/bin:$PATH"

# k9s
export EDITOR=nvim

# krew
export KREW_ROOT="$HOME/.krew"
export PATH="$KREW_ROOT/bin:$PATH"

# minikube
#eval $(minikube -p minikube docker-env)

# kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# istioctl
export PATH=$PATH:$HOME/.istioctl/bin

# attach tmux when loggin
if [[ -z "$TMUX" ]]; then
  tmux attach || tmux new-session
  exit;
fi
