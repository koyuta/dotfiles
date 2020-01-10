#!/bin/bash
set -e

DOTFILE_DIR=$HOME/dotfiles

XDG_CONFIG_HOME=$HOME/.config

NEOVIM_DIR=$XDG_CONFIG_HOME/nvim
ALACRITTY_DIR=$XDG_CONFIG_HOME/alacritty

VIM_DIR=$HOME/.vim
VIM_RC_DIR=$VIM_DIR/rc
VIM_RCD_DIR=$VIM_DIR/vimrc.d

# conf files that set on $XDG_CONFIG_HOME/
[ -e $XDG_CONFIG_HOME ] || mkdir -p $XDG_CONFIG_HOME

[ -e $ALACRITTY_DIR ] || mkdir -p $ALACRITTY_DIR
ln -nfs $DOTFILE_DIR/alacritty.yml $ALACRITTY_DIR/alacritty.yml
[ -e $NEOVIM_DIR ] || mkdir -p $NEOVIM_DIR
ln -nfs $DOTFILE_DIR/.vimrc $NEOVIM_DIR/init.vim

# conf files that set on $HOME/
DOT_FILES=(.gitcommit_template .gitconfig .gitignore_global .tmux.conf .vimrc .zshrc .hyper.js)
for file in ${DOT_FILES[@]};do
    ln -nfs $DOTFILE_DIR/$file $HOME/$file
done

for dir in $VIM_RC_DIR $VIM_RCD_DIR; do
    [ ! -e $dir ] || mkdir -p $dir
done

ln -nfs $DOTFILE_DIR/.vim/rc $VIM_RC_DIR
ln -nfs $DOTFILE_DIR/.vim/vimrc.d $VIM_RCD_DIR
