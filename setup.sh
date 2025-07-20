#!/bin/bash

set -e

REPO_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

#===============================================================================


echo -e "░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀"  
echo -e "░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█"  
echo -e "░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀"  


#===============================================================================

#===============================================================================

echo "Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage

echo "Exposing Neovim Globally..."
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim

echo "Sourcing Neovim..."

echo -e "Now you can officially say Neovim BTW\n"

#===============================================================================

echo "Installing Node packages..."
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "Sourcing NVM..."
\. "$HOME/.nvm/nvm.sh"

echo "Installing NVM..."
nvm install 22

echo "Verifying Packages..."
node -v 
nvm current 

echo "Verifying npm..."
npm -v 

echo "Enabling Corepack for pnpm..."
corepack enable pnpm

echo -e "Verifying pnpm...\n"
pnpm -v

#===============================================================================

stow zsh

stow -t "$HOME/.config" .config

#===============================================================================

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing OhMyZsh..."

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" 

  if [ $? -ne 0 ]; then
    echo "Failed to install OhMyZsh. Exiting."
    exit 1
  fi
else
  echo "OhMyZsh is already installed."
fi

