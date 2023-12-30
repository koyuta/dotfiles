#!/usr/bin/env bash
set -e

DOTFILE_DIR=$HOME/dotfiles
DOTFILE_XDG_CONFIG_DIR=$DOTFILE_DIR/xdg_config_dir

XDG_CONFIG_HOME=$HOME/.config

# Make XDG_CONFIG_HOME directory
[ -e $XDG_CONFIG_HOME ] || mkdir -p $XDG_CONFIG_HOME

ALACRITTY_DIR=$XDG_CONFIG_HOME/alacritty
ln -nfs $DOTFILE_XDG_CONFIG_DIR/alacritty $ALACRITTY_DIR

SHELDON_DIR=$XDG_CONFIG_HOME/sheldon
ln -nfs $DOTFILE_XDG_CONFIG_DIR/sheldon $SHELDON_DIR

KARABINER_DIR=$XDG_CONFIG_HOME/karabiner
ln -nfs $DOTFILE_XDG_CONFIG_DIR/karabiner $KARABINER_DIR

NEOVIM_DIR=$XDG_CONFIG_HOME/nvim
ln -nfs $DOTFILE_XDG_CONFIG_DIR/nvim $NEOVIM_DIR

K9S_DIR=$XDG_CONFIG_HOME/k9s
ln -nfs $DOTFILE_XDG_CONFIG_DIR/k9s $K9S_DIR

DOT_FILES=(
  .gitcommit_template
  .gitconfig
  .gitignore_global
  .tmux.conf
  .zshrc
)
for file in ${DOT_FILES[@]};do
    ln -nfs $DOTFILE_DIR/$file $HOME/$file
done

# others
mkdir -p ~/development
