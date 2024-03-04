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

# mise
eval "$(~/.local/bin/mise activate zsh)"

# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# rust
export CARGO_PATH="$HOME/.cargo"
export PATH="$PATH:$CARGO_PATH/bin"

# haskell
if [ -f "/Users/s03621/.ghcup/env" ]; then
  source "/Users/s03621/.ghcup/env"
fi

# k9s
export EDITOR=nvim

# krew
export KREW_ROOT="$HOME/.krew"
export PATH="$KREW_ROOT/bin:$PATH"

# minikube
#eval $(minikube -p minikube docker-env)

# kubebuilder
#export PATH=$PATH:/usr/local/kubebuilder/bin

# istioctl
export PATH=$PATH:$HOME/.istioctl/bin
