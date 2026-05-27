# Portable interactive Bash config for Linux and macOS.

case $- in
  *i*) ;;
  *) return ;;
esac

# History.
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

# Use readline settings from the symlinked dotfiles file when present.
if [ -z "${INPUTRC:-}" ] && [ -f "$HOME/.inputrc" ]; then
  export INPUTRC="$HOME/.inputrc"
fi

# Platform helpers.
case "$(uname -s)" in
  Darwin) DOTFILES_OS=macos ;;
  Linux) DOTFILES_OS=linux ;;
  *) DOTFILES_OS=unknown ;;
esac
export DOTFILES_OS

# Colored output for common tools.
if ls --color=auto >/dev/null 2>&1; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
else
  export CLICOLOR=1
  export LSCOLORS="${LSCOLORS:-ExGxBxDxCxEgEdxbxgxcxd}"
  alias ls='ls -G'
fi

# Prompt.
__dotfiles_git_branch() {
  local branch

  branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null)" ||
    branch="$(git rev-parse --short HEAD 2>/dev/null)" ||
    return

  printf ' (%s)' "$branch"
}

if [ -n "${debian_chroot:-}" ]; then
  DOTFILES_CHROOT="($debian_chroot)"
else
  DOTFILES_CHROOT=""
fi

if [ -t 1 ] && command -v tput >/dev/null 2>&1 && [ "$(tput colors 2>/dev/null || echo 0)" -ge 8 ]; then
  PS1='${DOTFILES_CHROOT}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;35m\]$(__dotfiles_git_branch)\[\033[00m\]\$ '
else
  PS1='${DOTFILES_CHROOT}\u@\h:\w$(__dotfiles_git_branch)\$ '
fi

case "$TERM" in
  xterm*|rxvt*|screen*|tmux*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
esac

# User aliases and functions.
DOTFILES_BASH_ALIASES="$HOME/.aliases"
if [ ! -f "$DOTFILES_BASH_ALIASES" ] && [ -n "${BASH_SOURCE[0]:-}" ]; then
  DOTFILES_BASH_ALIASES="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/.bash_aliases"
fi

if [ -f "$DOTFILES_BASH_ALIASES" ]; then
  . "$DOTFILES_BASH_ALIASES"
fi

# Bash completion.
if ! shopt -oq posix; then
  if [ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
    . /opt/homebrew/etc/profile.d/bash_completion.sh
  elif [ -r /usr/local/etc/profile.d/bash_completion.sh ]; then
    . /usr/local/etc/profile.d/bash_completion.sh
  elif [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Local paths.
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d /opt/nvim/bin ]; then
  PATH="$PATH:/opt/nvim/bin"
fi

export PATH

# NVM.
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
  . "$NVM_DIR/bash_completion"
fi

unset DOTFILES_BASH_ALIASES DOTFILES_CHROOT
