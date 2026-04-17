# Dotfiles

Personal dev environment config for macOS.

## What's inside

- `.zshrc` - Shell config, aliases, prompt (Starship)
- `.gitconfig` - Git settings and aliases
- `config/starship.toml` - Starship prompt config
- `config/ghostty/` - Ghostty terminal config
- `Brewfile` - Homebrew packages and casks

## Setup

```sh
git clone git@github.com:mattsafaii/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash setup.sh
brew bundle
```

`setup.sh` symlinks config files to their expected locations. `brew bundle` installs everything in the Brewfile.
