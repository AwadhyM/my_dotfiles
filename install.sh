#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_symlink() {
    SOURCE="$1"
    TARGET="$2"

    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        if [ ! -L "$TARGET" ]; then
            echo "Backing up existing config found in "$SOURCE"..."
            mv "$TARGET" "${TARGET}.backup"
        else
            echo "Removing existing symlink found in "$SOURCE"..."
            rm "$TARGET"
        fi
    fi
    echo "Creating symlink... "$SOURCE" "$TARGET""
    ln -s "$SOURCE" "$TARGET"
}
create_symlink "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
create_symlink "$SCRIPT_DIR/tmux" "$HOME/.config/tmux"
create_symlink "$SCRIPT_DIR/bash/.bashrc" "$HOME/.bashrc"
create_symlink "$SCRIPT_DIR/bash/.bash_profile" "$HOME/.bash_profile"
create_symlink "$SCRIPT_DIR/bash/.aliases" "$HOME/.aliases"
create_symlink "$SCRIPT_DIR/bash/.inputrc" "$HOME/.inputrc"

