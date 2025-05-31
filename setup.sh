#!/bin/bash

set -e

REPO_DIR="$HOME/.linux-dev-setup"
CONFIG_DIR="$HOME/.config"

#===============================================================================

if command -v apt &>/dev/null; then
  echo "Debian-based system detected. Installing dependencies using apt..."
  sudo apt update && sudo apt install -y \
    curl \
    wget \
    neofetch \
    libfuse2 \
    tmux \
    zsh
elif command -v dnf &>/dev/null; then
  echo "Fedora-based system detected. Installing dependencies using dnf..."
  sudo dnf install -y \
    curl \
    wget \
    fastfetch \
    fuse \
    tmux \
    zsh
else
  echo "Unsupported package manager. Please install dependencies manually."
  exit 1
fi

echo -e "\n"

#===============================================================================

echo -e "  ███╗   ██╗ ██████╗ ██████╗ ███████╗     ██╗███████╗"
echo -e "  ████╗  ██║██╔═══██╗██╔══██╗██╔════╝     ██║██╔════╝"
echo -e "  ██╔██╗ ██║██║   ██║██║  ██║█████╗       ██║███████╗"
echo -e "  ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ██   ██║╚════██║"
echo -e "  ██║ ╚████║╚██████╔╝██████╔╝███████╗╚█████╔╝███████║"
echo -e "  ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚════╝ ╚══════╝"


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

echo -e "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
echo -e "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
echo -e "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
echo -e "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
echo -e "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
echo -e "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"

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

ln -sf "$REPO_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO_DIR/.local/share/fonts" "$HOME/.local/share/fonts"

#===============================================================================

for config in "$REPO_DIR/.config/"*; do
  name=$(basename "$config")
  ln -sfn "$config" "$CONFIG_DIR/$name"
done

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

