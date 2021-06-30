#!/usr/bin/env bash
set -e

DOTFILE_DIR=$HOME/dotfiles

XDG_CONFIG_HOME=$HOME/.config

NEOVIM_DIR=$XDG_CONFIG_HOME/nvim
ALACRITTY_DIR=$XDG_CONFIG_HOME/alacritty
KARABINER_DIR=$XDG_CONFIG_HOME/karabiner

VIM_DIR=$HOME/.vim

# under XDG
[ -e $XDG_CONFIG_HOME ] || mkdir -p $XDG_CONFIG_HOME

[ -e $ALACRITTY_DIR ] || mkdir -p $ALACRITTY_DIR
ln -nfs $DOTFILE_DIR/alacritty.yml $ALACRITTY_DIR/alacritty.yml

[ -e $KARABINER_DIR ] || mkdir -p $KARABINER_DIR
ln -nfs $DOTFILE_DIR/karabiner.json $KARABINER_DIR/karabiner.json

[ -e $NEOVIM_DIR ] || mkdir -p $NEOVIM_DIR
ln -nfs $DOTFILE_DIR/.vimrc $NEOVIM_DIR/init.vim

# under HOME
DOT_FILES=(.gitcommit_template .gitconfig .gitignore_global .tmux.conf .vimrc .zshrc .hyper.js)
for file in ${DOT_FILES[@]};do
    ln -nfs $DOTFILE_DIR/$file $HOME/$file
done

# vim
ln -nfs $DOTFILE_DIR/.vim $VIM_DIR
