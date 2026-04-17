export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
CASE_SENSITIVE="true"

plugins=(git sudo z)

source $ZSH/oh-my-zsh.sh

export EDITOR='subl'

# ----------------------
# History
# ----------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# -------
# Aliases
# -------
alias zshconfig="nano ~/.zshrc"
alias gitconfig="git config --global --edit"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias zs="source ~/.zshrc"
alias kamal='docker run -it --rm -v "${PWD}:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/basecamp/kamal:latest'
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdc="cd ~/Code/Clients"
alias cdp="cd ~/Code/Personal"
alias cds="cd ~/Code/Sandbox"
alias cdo="cd '/Users/matt/Library/Mobile Documents/iCloud~md~obsidian/Documents/Matt Safaii'"

# ----------------------
# Network
# ----------------------
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# ----------------------
# Finder
# ----------------------
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ----------------------
# Safety
# ----------------------
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

# ----------------------
# Misc
# ----------------------
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias path='echo -e ${PATH//:/\\n}'
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Public key copied to clipboard'"

# ----------------------
# Git Aliases
# ----------------------
alias gut='git'
alias got='git'
alias gkt='git'
alias gir='git'
alias giy='git'

alias cpr="~/create-repo.sh"

function gp() {
    git add .
    git commit -m "$1"
    git push
}

function g() {
    GREEN='\033[0;32m'
    RED='\033[0;31m'
    NC='\033[0m'
    ARROW="${GREEN}->${NC}"
    ERROR_ARROW="${RED}->${NC}"

    echo -e "$ARROW 👇 Enter commit message:"
    read -r commit_message
    git add .
    if [ -n "commit_message" ]; then
        git commit -m "$commit_message"
        echo -e "$ARROW 🫸 Pushing"
        echo -e "$ARROW 🛡️ What's the secret word?"
        if git push; then
            echo -e "$ARROW 🫡 Done"
        else
            echo -e "$ERROR_ARROW ❌ Push failed"
        fi
    else
        echo -e "$ERROR_ARROW ❌ Commit aborted: empty commit message"
    fi
}

# ----------------------
# Functions
# ----------------------
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

# ----------------------
# Rails Aliases
# ----------------------
alias rc='rails c'
alias rdm='rake db:migrate'
alias rdb='rake db:rollback'
alias bi='bundle install'

# ----------------------
# Basecamp CLI Aliases
# ----------------------
alias bcs='basecamp -a 6191443'   # Safaii Studio
alias bcz='basecamp -a 6060605'   # Zonebrite Solutions

# -------
# NVM
# -------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -------
# Ruby
# -------
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# bun completions
[ -s "/Users/matt/.bun/_bun" ] && source "/Users/matt/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH=$PATH:~/
export PATH="/opt/homebrew/bin:$PATH"

# hide all node.js warnings
export NODE_NO_WARNINGS=1

. "$HOME/.local/bin/env"

export PATH=~/.npm-global/bin:$PATH

#zoxide
eval "$(zoxide init --cmd cd zsh)"

#fzf
source <(fzf --zsh)

# Opt-out of telemtry for skills.sh
export SKILLS_NO_TELEMETRY=1
export LEDGER_FILE=~/Documents/Finances/main.journal

# Starship prompt
eval "$(starship init zsh)"
