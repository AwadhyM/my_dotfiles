# Dotfiles

Personal dotfiles intended to be backed up to GitHub and installed with symlinks.

## tmux

The tmux config lives at `tmux/.tmux.conf`.

Install TPM once:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Symlink the config:

```sh
ln -sfn ~/projects/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

Reload tmux:

```sh
tmux source-file ~/.tmux.conf
```

Inside tmux, press `Ctrl-Space` then `I` to install the Dracula plugin.

Configured behavior:

- Prefix is `Ctrl-Space`
- `Prefix h/j/k/l` moves between panes
- `Prefix H/L` moves between windows
- Status bar is at the top
- Theme is Dracula via TPM
