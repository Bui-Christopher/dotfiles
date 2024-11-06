#!/bin/bash

# Note: "$(cd "$(dirname "$0")" && pwd)" cd to running script directory
export SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
export DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
export NIX_CONFIG_DIR="$(cd "$DOTFILES_DIR/../nix" && pwd)"
export TARGET_DIR="/etc/nixos"
export BACKUP_DIR="/etc/nixos.bak"

if [[ ! -d "$NIX_CONFIG_DIR" ]]; then
    echo "Nix configurations not found"
    exit 1
fi

# Check if the target directory exists
if [ -e "$TARGET_DIR" ]; then
    # Create a backup folder if it doesn't exist
    echo "$TARGET_DIR already exists, moving it to backup..."
    if [ ! -d "$BACKUP_DIR" ]; then
        sudo mkdir -p "$BACKUP_DIR"
    fi

    # Move the existing directory to the backup folder with a timestamp
    timestamp=$(date +%Y%m%d%H%M%S)
    backup_name="$BACKUP_DIR/nixos_backup_$timestamp"
    echo "Backing up $TARGET_DIR to $backup_name"
    sudo mv "$TARGET_DIR" "$backup_name"
    echo "Moved existing $TARGET_DIR to $backup_name"
fi

# Create the symbolic link to the whole folder
sudo ln -s "$NIX_CONFIG_DIR" "$TARGET_DIR"
echo "Created symbolic link: $TARGET_DIR -> $NIX_CONFIG_DIR"

echo "Symbolic link created successfully."
