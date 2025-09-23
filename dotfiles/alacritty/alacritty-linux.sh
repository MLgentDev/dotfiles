#!/bin/bash

SOURCE_FILE_BASE="$(pwd)/alacritty-base.toml"
SOURCE_FILE_LINUX="$(pwd)/alacritty-linux.toml"

# Define the destination path in the .config directory
DEST_DIR="$HOME/.config/alacritty"
DEST_FILE_BASE="$DEST_DIR/alacritty-base.toml"
DEST_FILE_LINUX="$DEST_DIR/alacritty.toml"

echo "Ensuring destination directory exists: $DEST_DIR"
mkdir -p "$DEST_DIR"

# Create the symbolic link
# -s for symbolic link
# -f to force overwrite if a link already exists
# -v for verbose output (it will tell you what it did)
echo "Creating symlink for Alacritty config..."
ln -sfv "$SOURCE_FILE_BASE" "$DEST_FILE_BASE"
ln -sfv "$SOURCE_FILE_LINUX" "$DEST_FILE_LINUX"

echo "Done."