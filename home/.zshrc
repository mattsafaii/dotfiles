# ==============================================================================
# Oh My Zsh
# ==============================================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
CASE_SENSITIVE="true"
plugins=(sudo z)
source $ZSH/oh-my-zsh.sh

# ==============================================================================
# Helpers
# ==============================================================================

# Prevent duplicate PATH entries on shell reload
add_to_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# ==============================================================================
# PATH
# ==============================================================================

add_to_path "/opt/homebrew/bin"
add_to_path "/opt/homebrew/opt/ruby/bin"
add_to_path "$HOME/.npm-global/bin"
add_to_path "$HOME"

# Bun
export BUN_INSTALL="$HOME/.bun"
add_to_path "$BUN_INSTALL/bin"

# ==============================================================================
# Environment
# ==============================================================================

export EDITOR='subl'
export NODE_NO_WARNINGS=1
export SKILLS_NO_TELEMETRY=1
export LEDGER_FILE=~/Documents/Finances/main.journal

# ==============================================================================
# History
# ==============================================================================

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# ==============================================================================
# Aliases — Navigation
# ==============================================================================

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"
alias cdc="cd ~/Code/Clients"
alias cdp="cd ~/Code/Personal"
alias cds="cd ~/Code/Sandbox"
alias cdo="cd '$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Matt Safaii'"

# ==============================================================================
# Aliases — Git
# ==============================================================================

alias gst='git status'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gd='git diff'
alias glog='git log --oneline --decorate --graph'

# ==============================================================================
# Aliases — Rails
# ==============================================================================

alias rc='rails c'
alias rdm='rake db:migrate'
alias rdb='rake db:rollback'
alias bi='bundle install'

# ==============================================================================
# Aliases — Basecamp CLI
# ==============================================================================

alias bcs='basecamp -a 6191443'   # Safaii Studio
alias bcz='basecamp -a 6060605'   # Zonebrite Solutions

# ==============================================================================
# Aliases — Network
# ==============================================================================

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# ==============================================================================
# Aliases — Finder
# ==============================================================================

alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ==============================================================================
# Aliases — Safety
# ==============================================================================

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

# ==============================================================================
# Aliases — Misc
# ==============================================================================

alias zs="source ~/.zshrc"
alias zshconfig="$EDITOR ~/.zshrc"
alias gitconfig="git config --global --edit"
alias kamal='docker run -it --rm -v "${PWD}:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/basecamp/kamal:latest'
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias path='echo -e ${PATH//:/\\n}'
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Public key copied to clipboard'"

# ==============================================================================
# Functions
# ==============================================================================

# Interactive add, commit, push
g() {
  GREEN='\033[0;32m'
  RED='\033[0;31m'
  NC='\033[0m'
  ARROW="${GREEN}->${NC}"
  ERROR_ARROW="${RED}->${NC}"

  echo -e "$ARROW Enter commit message:"
  read -r commit_message
  git add .
  if [ -n "$commit_message" ]; then
    git commit -m "$commit_message"
    echo -e "$ARROW Pushing..."
    if git push; then
      echo -e "$ARROW Done"
    else
      echo -e "$ERROR_ARROW Push failed"
    fi
  else
    echo -e "$ERROR_ARROW Commit aborted: empty message"
  fi
}

# Create directory and cd into it
mkd() { mkdir -p "$@" && cd "$_"; }

# cd to whatever Finder has open
cdf() { cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"; }

# Extract any archive format
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar -jxvf "$1" ;;
      *.tar.gz)  tar -zxvf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.dmg)     hdiutil mount "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar -xvf "$1" ;;
      *.tbz2)    tar -jxvf "$1" ;;
      *.tgz)     tar -zxvf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.ZIP)     unzip "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.Z)       uncompress "$1" ;;
      *)         echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ==============================================================================
# Tool init (order matters — load after PATH is set)
# ==============================================================================

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Mise
. "$HOME/.local/bin/env"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# fzf
source <(fzf --zsh)

# Starship prompt (must be last)
eval "$(starship init zsh)"
