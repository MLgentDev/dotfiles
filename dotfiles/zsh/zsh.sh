#!/bin/bash

SOURCE_FILE_BASE="$(pwd)/.zshrc"

DEST_DIR="$HOME"
DEST_FILE_BASE="$DEST_DIR/.zshrc"

echo "Ensuring destination directory exists: $DEST_DIR"
mkdir -p "$DEST_DIR"

# Create the symbolic link
# -s for symbolic link
# -f to force overwrite if a link already exists
# -v for verbose output (it will tell you what it did)
echo "Creating symlink for Zellij config..."
ln -sfv "$SOURCE_FILE_BASE" "$DEST_FILE_BASE"

echo "Done."