#!/bin/bash

set -e

REPO_DIR="$HOME/.linux-dev-setup"
CONFIG_DIR="$HOME/.config"

install_packages() {
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
}

install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing OhMyZsh..."

    # Install OhMyZsh non-interactively
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

    if [ $? -ne 0 ]; then
      echo "Failed to install OhMyZsh. Exiting."
      exit 1
    fi
  else
    echo "OhMyZsh is already installed."
  fi
}


install_node_packages() {
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

  echo "Verifying pnpm..."
  pnpm -v
}

install_neovim() {
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

  echo "Now you can officially say Neovim BTW"

}


install_tmux_config() {
  echo -e "████████╗███╗   ███╗██╗   ██╗██╗  ██╗"
  echo -e "╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝"
  echo -e "   ██║   ██╔████╔██║██║   ██║ ╚███╔╝ "
  echo -e "   ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ "
  echo -e "   ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗"
  echo -e "   ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝ " 

  echo "Adding tmux configurtion..."
  # if [ ! -d "$REPO_DIR/.config/tmux/plugins/tpm"]; then
  #   git clone https://github.com/tmux-plugins/tpm "$REPO_DIR/.config/tmux/plugins/tpm"
  # else 
  #   echo "TPM already exist, skipping"
  # fi

  # if [ ! -d "$REPO_DIR/.config/tmux/plugins/catppuccin/tmux"]; then
  #   mkdir -p ~/.config/tmux/plugins/catppuccin
  #   git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$REPO_DIR/.config/tmux/plugins/catppuccin/tmux"
  # else
  #   echo "catppuccin already exist, skipping"
  # fi

  git clone https://github.com/tmux-plugins/tpm "$REPO_DIR/.config/tmux/plugins/tpm"

  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$REPO_DIR/.config/tmux/plugins/catppuccin/tmux"

  ln -sfn "$REPO_DIR/.config/tmux" "$HOME/.config/tmux"
  


}

syslink() {

  ln -sf "$REPO_DIR/.zshrc" "$HOME/.zshrc"

  for config in "$REPO_DIR/.config/"*; do
    name=$(basename "$config")
    ln -sfn "$config" "$CONFIG_DIR/$name"
  done
}

main() {
  install_packages
  install_node_packages
  install_neovim
  install_tmux_config
  syslink
  install_oh_my_zsh
}

main
