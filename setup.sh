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
    elif command -v dnf &>/dev/null; then
      echo "Fedora-based system detected. Installing dependencies using dnf..."
      sudo dnf install -y \
        curl \
        wget \
        fastfetch \
        fuse \
        tmux \
      else
        echo "Unsupported package manager. Please install dependencies manually."
        exit 1
  fi
}

install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing OhMyZsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "OhMyZsh is already installed."
  fi
}

install_node_packages() {
  echo "Installing Node packages..."
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

  echo "Sourcing NVM..."
 # echo 'export NVIM_DIR="$HOME/.nvm"' >> ~/.zshrc
 # echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
 # echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
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

  echo "Installing Neovim..."
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod u+x nvim-linux-x86_64.appimage
  ./nvim-linux-x86_64.appimage

  echo "Exposing Neovim Globally..."
  sudo mkdir -p /opt/nvim
  sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim

  echo "Sourcing Neovim..."
  # echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.zshrc

  echo "Now you can officially say Neovim BTW"

}

# echo "Putting all $PATH into ~/.zshrc..."
# echo 'export NVIM_DIR="$HOME/.nvm"' >> ~/.zshrc
# echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
# echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.zshrc

install_tmux_config() {

  echo "Adding tmux configurtion..."
  git clone https://github.com/tmux-plugins/tpm "$REPO_DIR/.config/tmux/plugins/tpm"
  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$REPOS_DIR/.config/tmux/plugins/catppuccin/tmux"

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
  install_oh_my_zsh
  install_node_packages
  install_neovim
  install_tmux_config
  syslink
}

main
