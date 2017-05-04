#!/bin/bash

VIM_DIR=$HOME/.vimmmm
VIM_RC_DIR=$VIM_DIR/rc
VIM_RCD_DIR=$VIM_DIR/vimrc.d

for dir in $VIM_RC_DIR $VIM_RCD_DIR; do
    if [ ! -e $dir ]; then
        mkdir -p $dir
    fi
done

DOT_FILES=(.gitconfig .gitconfig_global .tmux.conf .vimrc .zshrc)

VIM_RC_FILES=(dein.toml dein_lazy.toml )
VIM_RCD_FILES=(fugitive.vim indent-guid.vim neocomplete.vim syntastic.vim vim-go.vim)

for file in ${DOT_FILES[@]};do
    ln -nfs $HOME/dotfiles/$file $HOME/$file
done

for file in ${VIM_RC_FILES[@]};do
    ln -nfs $HOME/dotfiles/.vim/rc/$file $HOME/.vim/rc/$file
done

for file in ${VIM_RCD_FILES[@]};do
    ln -nfs $HOME/dotfiles/.vim/vimrc.d/$file $HOME/.vim/vimrc.d/$file
done

