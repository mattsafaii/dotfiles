#!/bin/bash
DOTFILES_DIR=~/.dotfiles

# Link .zshrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc

# Link .gitconfig
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig

# Link starship config
mkdir -p ~/.config
ln -sf $DOTFILES_DIR/config/starship.toml ~/.config/starship.toml

# Link ghostty config
mkdir -p ~/.config/ghostty
ln -sf $DOTFILES_DIR/config/ghostty/config ~/.config/ghostty/config

echo "Dotfiles linked!"
