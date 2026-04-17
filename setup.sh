#!/bin/bash
DOTFILES_DIR=~/.dotfiles

# Link everything in home/ to ~/
for f in "$DOTFILES_DIR"/home/.*; do
  [ -f "$f" ] && ln -sf "$f" ~/
done

# Link everything in config/ to ~/.config/
mkdir -p ~/.config
for f in "$DOTFILES_DIR"/config/*; do
  ln -sf "$f" ~/.config/
done

# Link everything in library/ to ~/Library/Application Support/
for d in "$DOTFILES_DIR"/library/*/; do
  app=$(basename "$d")
  mkdir -p ~/Library/Application\ Support/"$app"
  for f in "$d"*; do
    ln -sf "$f" ~/Library/Application\ Support/"$app"/
  done
done

echo "Dotfiles linked!"
