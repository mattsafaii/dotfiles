#!/bin/bash
DOTFILES_DIR=~/.dotfiles

# Link .zshrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc

# Link .gitconfig
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig

# Add more links as needed
echo "Dotfiles linked!"
