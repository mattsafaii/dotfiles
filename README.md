# Dotfiles

Personal dev environment config for macOS.

## Structure

```
home/           → ~/          (.zshrc, .gitconfig)
config/         → ~/.config/  (starship.toml)
library/        → ~/Library/Application Support/  (ghostty)
```

Drop a file in the right folder and `setup.sh` symlinks it automatically.

## Setup

```sh
git clone git@github.com:mattsafaii/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash setup.sh
brew bundle
bash .macos
mackup restore
```

- `setup.sh` — symlinks config files to their expected locations
- `brew bundle` — installs everything in the Brewfile
- `.macos` — sets macOS system preferences (Dock, Finder, keyboard, etc.)
- `mackup restore` — restores app settings from iCloud
