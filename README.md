# My personal development setup in Linux or in WSL

**This setup only includes** `apt` **and** `dnf` **packages** 

<br>

## ⚠️ WARNING

Please fork this repository if you want to customize it on your own

<br>

## Installation

Clone this repository:
```
git clone https://github.com/Yncy0/wsl-dev-setup.git ~/.linux-dev-setup
```

If using SSH:
```
git clone git@github.com:Yncy0/linux-dev-setup.git ~/.linux-dev-setup
```

Run the script:
```
cd ~/.linux-dev-setup && chmod +x setup.sh && ./setup.sh
```

## ZSH

If you wanted zsh to be your default shell, after installation run:

```
source ~/.zshrc
chsh -s $(which zsh)
```

If oh-my-zsh not showing, run this line:
```
zsh
```

⚠️ You might want to restart your terminal to apply the changes

<br>

## Project Includes:
- ✅ npm
- ✅ pnpm
- ✅ tmux
- ✅ zsh && oh-my-zsh
- ✅ neofetch || fastfetch
- ✅ Neovim

<br>

## Neovim:
- ✅ lazy.nvim (package manager) 
- ✅ catppuccin
- ✅ telescope
- ✅ treesitter
- ✅ neo-tree

<br>

## TMUX:
- ✅ catppuccin
- ✅ tpm

<br>

*Please if you have problems, contact me on my GitHub account: Yncy0, or open an issue on this repository. Thanks!*
