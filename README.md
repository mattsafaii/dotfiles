# Dotfiles

Personal dev environment config for macOS.

## Structure

```
home/           → ~/          (.zshrc, .gitconfig, .gemrc, .railsrc, .editorconfig)
config/         → ~/.config/  (starship.toml)
library/        → ~/Library/Application Support/  (ghostty)
```

Drop a file in the right folder and `setup.sh` symlinks it automatically.

## Fresh Mac Setup

```sh
# 1. Clone
git clone git@github.com:mattsafaii/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 2. Symlink configs
bash setup.sh

# 3. Install packages
brew bundle

# 4. Set macOS preferences
bash .macos

# 5. Restore app settings from iCloud
mackup restore
```

## Updating

```sh
# After installing/removing a Homebrew package
brew bundle dump --file=~/.dotfiles/Brewfile --force

# After changing app settings
mackup backup --force

# After any change
cd ~/.dotfiles && git add -A && git commit -m "description" && git push
```

## Shell Aliases

### Navigation

| Alias | Command |
|-------|---------|
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |
| `cdc` | `cd ~/Code/Clients` |
| `cdp` | `cd ~/Code/Personal` |
| `cds` | `cd ~/Code/Sandbox` |
| `cdo` | `cd` to Obsidian vault |
| `c` | `clear` |

### Git

| Alias | Command |
|-------|---------|
| `gst` | `git status` |
| `ga` | `git add` |
| `ga.` | `git add .` |
| `gc` | `git commit` |
| `gcm` | `git commit -m` |
| `gp` | `git push` |
| `gl` | `git pull` |
| `gco` | `git checkout` |
| `gd` | `git diff` |
| `glog` | Pretty log graph |

### Rails

| Alias | Command |
|-------|---------|
| `rc` | `rails c` |
| `rdm` | `rake db:migrate` |
| `rdb` | `rake db:rollback` |
| `bi` | `bundle install` |

### Basecamp CLI

| Alias | Account |
|-------|---------|
| `bcs` | Safaii Studio (6191443) |
| `bcz` | Zonebrite Solutions (6060605) |

### Network

| Alias | What it does |
|-------|--------------|
| `ip` | Show public IP |
| `localip` | Show local IP |
| `flush` | Flush DNS cache |

### Finder

| Alias | What it does |
|-------|--------------|
| `show` / `hide` | Toggle hidden files in Finder |
| `hidedesktop` / `showdesktop` | Toggle desktop icons (for presentations) |
| `cleanup` | Recursively delete `.DS_Store` files |

### Misc

| Alias | What it does |
|-------|--------------|
| `afk` | Lock screen |
| `path` | Print each PATH entry on its own line |
| `pubkey` | Copy SSH public key to clipboard |
| `zs` | Reload `.zshrc` |

## Shell Functions

| Function | What it does |
|----------|--------------|
| `g` | Interactive add, commit, push (prompts for message) |
| `mkd mydir` | Create directory and cd into it |
| `cdf` | cd to whatever folder Finder has open |
| `extract file.tar.gz` | Extract any archive format (tar, zip, gz, bz2, dmg, rar) |

## What's Where

| File | Purpose |
|------|---------|
| `home/.zshrc` | Shell config, aliases, PATH |
| `home/.gitconfig` | Git settings and aliases |
| `home/.gemrc` | Skip gem docs on install |
| `home/.railsrc` | `rails new` defaults: sqlite3, skip-test |
| `home/.editorconfig` | Editor formatting (tabs, UTF-8, trailing whitespace) |
| `home/.gitignore_global` | Global gitignore (.DS_Store, *.swp, etc.) |
| `home/.hushlogin` | Suppress "Last login" terminal message |
| `home/.irbrc` | Ruby IRB config (history, auto-indent, `cop` to copy last result) |
| `config/starship.toml` | Starship prompt config |
| `library/com.mitchellh.ghostty/config` | Ghostty terminal config |
| `.macos` | macOS system preferences script |
| `macos/set-hostname.sh` | Fix hostname if macOS appended random numbers |
| `Brewfile` | Homebrew packages and casks |
| `setup.sh` | Symlink installer |

## macOS Preferences (.macos)

The `.macos` script sets these preferences. Run `bash .macos` to apply.

- Dark mode
- Disable autocorrect, smart quotes, smart dashes, auto-capitalization
- Expand save/print dialogs by default
- Save to disk (not iCloud) by default
- Auto-quit printer app when done
- Fast key repeat, disable press-and-hold
- Disable focus ring animation, faster window resize
- Full keyboard access (Tab works in modal dialogs)
- Spring loading with zero delay
- Dock: 34px icons, bottom, no recents, don't rearrange Spaces, fast Mission Control
- Finder: list view, path bar, status bar, no animations, search current folder, folders on top, ~/Library visible
- No `.DS_Store` on network/USB volumes
- Screenshots without shadows
- Password required immediately after sleep
- Activity Monitor: CPU graph in Dock icon, show all processes, sort by CPU
- Messages: no emoji substitution, no smart quotes, no spell check
- TextEdit defaults to plain text
- Photos won't auto-open when plugging in devices
- Time Machine won't prompt for new backup drives

## Mackup

Mackup backs up app settings to iCloud. Config at `~/.mackup.cfg`.

Managed by Mackup (app preferences): Sublime Text, iTerm2, Zed, Spotify, Zoom, etc.

Managed by dotfiles (shell/dev config): zsh, git, starship, btop, fish, ghostty, Claude Code.
