#!/bin/bash

# function install_zsh() {
#   sudo chsh -s /usr/bin/zsh
#   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#   sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="strug"/g' $HOME/.zshrc
#   echo "ZSH now installed please rerun to carry on"
# }

function arch_update() {
  echo "Updating system..."
  sudo pacman -Syu
}

function arch_base_packages() {
  echo "Installing base packages..."
  sudo pacman -Sy fd-find make tmux awscli curl file wget ranger tree btop tldr atuin eza bat fzf neofetch vim neovim kitty alacritty stow
  install_zsh
}

function prompt_user() {
  local prompt_message="$1"
  local function_to_run="$2"

  while true; do
    read -p "$prompt_message (Y/n): " user_input
    case $user_input in
    [Yy]* | "") # Default to 'yes' if the user presses enter without typing anything
      $function_to_run
      break
      ;;
    [Nn]*)
      echo "Skipping $function_to_run."
      break
      ;;
    *)
      echo "Please answer Y or n."
      ;;
    esac
  done
}

# Main script execution with prompts
prompt_user "Would you like to update the system?" arch_update
prompt_user "Would you like to install base packages?" arch_base_packages
