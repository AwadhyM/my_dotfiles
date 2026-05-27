# Directory jumps.
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias home='cd ~'
alias dot='cd "$HOME/projects/dotfiles"'
alias projects='cd "$HOME/projects"'
alias desk='cd "$HOME/Desktop"'
alias docs='cd "$HOME/Documents"'
alias dl='cd "$HOME/Downloads"'
alias cfg='cd "$HOME/.config"'
alias nvimcfg='cd "$HOME/.config/nvim"'

# File listing.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Common shortcuts.
alias c='clear'
alias h='history'
alias path='printf "%s\n" "${PATH//:/$'\''\n'\''}"'
alias reload='source "$HOME/.bashrc"'
alias vim='nvim'
alias vi='nvim'

# Safer defaults.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Git.
alias g='git'
alias gs='git status --short'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gp='git push'
alias gl='git log --oneline --decorate --graph --all'

# Directory helpers.
mkcd() {
  mkdir -p "$1" && cd "$1"
}

up() {
  local levels="${1:-1}"
  local path=""

  while [ "$levels" -gt 0 ]; do
    path="../$path"
    levels=$((levels - 1))
  done

  cd "$path" || return
}
