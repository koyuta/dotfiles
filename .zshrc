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

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

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
alias vi='vim'
alias ssh='cat ~/.ssh/conf.d/*.config > ~/.ssh/config;ssh'
alias restart_network='sudo killall -HUP mDNSResponder'

# keychain
if [ ! -f $HOME/.keychain/$HOSTNAME-sh ] ; then
    unset SSH_AUTH_SOCK
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# go
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH

# attach tmux when loggin
if which tmux 2>&1 >/dev/null; then
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi
