# Login shell entrypoint for Bash.

if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
