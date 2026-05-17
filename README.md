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

## Neovim

The Neovim config lives at `nvim/`.

Symlink the config:

```sh
ln -sfn ~/projects/dotfiles/nvim ~/.config/nvim
```

## Bash

The Bash config lives at `bash/` and is intended to work on Linux and macOS.

Symlink the config:

```sh
ln -sfn ~/projects/dotfiles/bash/.bashrc ~/.bashrc
ln -sfn ~/projects/dotfiles/bash/.bash_profile ~/.bash_profile
ln -sfn ~/projects/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln -sfn ~/projects/dotfiles/bash/.inputrc ~/.inputrc
```

If replacing existing files, move them aside first:

```sh
mv ~/.bashrc ~/.bashrc.backup
mv ~/.bash_profile ~/.bash_profile.backup
mv ~/.bash_aliases ~/.bash_aliases.backup
mv ~/.inputrc ~/.inputrc.backup
```

Configured behavior:

- Aliases live in `bash/.bash_aliases`
- Directory jumps include `dot`, `projects`, `cfg`, `nvimcfg`, `dl`, `docs`, `desk`, `..`, `...`
- `ls` uses GNU `--color=auto` on Linux and BSD/macOS `-G` with `CLICOLOR`
- `.inputrc` enables case-insensitive completion, prefix history search, visible completion markers, and tab cycling

If replacing an existing config, move it aside first:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
ln -sfn ~/projects/dotfiles/nvim ~/.config/nvim
```
