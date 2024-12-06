#!/bin/bash

function i3setup() {
  echo "Setting up i3..."
  sudo pacman -Sy xorg xorg-xinit i3 polybar feh rofi picom
  echo "exec i3" >>~/.xinitrc
  cd ~
  git clone https://github.com/jameslinnell/dotfiles.git
  cd ~/dotfiles
  local arg="$1"
  stow vscode
  stow tmux
  stow starship
  stow rofi
  stow polybar
  stow nvim
  stow lazygit
  stow kitty
  if [ -n "$arg" ]; then
    stow i3-arch-vm
  else
    stow i3
  fi
  stow zsh
  echo "i3 window manger is now installed. Type 'startx'"
}

function install_zsh() {
  echo "Installing zsh..."
  sudo pacman -S zsh
  sudo chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "ZSH is now installed"
}

function install_yay() {
  echo "Installing YAY package manager..."
  cd ~/
  sudo pacman -S --needed base-devel
  sudo git clone https://aur.archlinux.org/yay.git
  sudo chown -R "$USER:$USER" yay/
  cd yay/
  makepkg -si
  yay --version
  echo "YAY is now installed..."
  echo "Installing Nerd Fonts..."
  yay -Ss nerd-fonts-cousine
  echo "Complete"
}

function arch_update() {
  echo "Updating system..."
  sudo pacman -Syu
}

function arch_base_packages() {
  echo "Installing base packages..."
  sudo pacman -S make upower tmux curl file wget starship lazygit ranger yazi tree btop tldr atuin eza bat fzf neofetch vim neovim kitty alacritty stow
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
prompt_user "Would you like to install YAY package manager?" install_yay
prompt_user "Would you like to install ZSH?" install_zsh
prompt_user "Would you like to install i3 window manager to VM? (You will have the opportunity to install for non-VM next)" i3setup "$1"
prompt_user "Would you like to install i3 window manager to hardware? (If you already installed to VM select no for this option.)" i3setup
