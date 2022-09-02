#!/bin/env bash
set -e

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# general
brew install git keychain jq

# tmux
brew install tmux reattach-to-user-namespace

# vim
brew install neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh
pip3 install --user pynvim
vim +UpdateRemotePlugins +qall

# golang
GO_VERSION=1.16.4
git clone https://github.com/syndbg/goenv.git ~/.goenv
goenv install ${GO_VERSION}
goenv global ${GO_VERSION}
go get golang.org/x/tools/cmd/goimports
go get golang.org/x/tools/gopls
