#!/bin/bash

SOURCE_FILE_BASE="$(pwd)/config.kdl"

# Define the destination path in the .config directory
DEST_DIR="$HOME/.config/zellij"
DEST_FILE_BASE="$DEST_DIR/config.kdl"

echo "Ensuring destination directory exists: $DEST_DIR"
mkdir -p "$DEST_DIR"

# Create the symbolic link
# -s for symbolic link
# -f to force overwrite if a link already exists
# -v for verbose output (it will tell you what it did)
echo "Creating symlink for Zellij config..."
ln -sfv "$SOURCE_FILE_BASE" "$DEST_FILE_BASE"

echo "Done."