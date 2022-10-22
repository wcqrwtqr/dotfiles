#!/bin/bash

# Sync the doom files
rsync -av --progress ~/.doom.d .
echo "============================"
echo "Finished syncing doom files"
echo "============================"

# Sync the tumux file
rsync -av --progress ~/.tmux.conf .
echo "============================"
echo "Finished syncing tmux file"
echo "============================"

# Sync the vimrc file (old file, I use neovim now)
rsync -av --progress ~/.vimrc .
echo "============================"
echo "Finished syncing vimrc file"
echo "============================"

# Sync the zshrc file 
rsync -av --progress ~/.zshrc .
echo "============================"
echo "Finished syncing zshrc file"
echo "============================"

# Sync the nvim folder 
rsync -av --progress ~/.config/nvim .
echo "============================"
echo "Finished syncing nvim files"
echo "============================"
