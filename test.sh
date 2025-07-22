#!/bin/bash

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/.dotfiles"
NEOVIM_DIR="/opt/nvim"

echo -e "Running test simulation\n"

if [ ! -d "$NVM_DIR" ]; then
  echo "TEST: Installing NVM"
else
  echo "NVM already exist"
fi

if [ ! -d "$NEOVIM_DIR" ]; then
  echo "TEST: Installing Neovim"
else 
  echo "Neovim already exist"
fi

echo -e "\nTesting Ended"
