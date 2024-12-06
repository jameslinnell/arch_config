#!/bin/bash

# function install_config() {
#   current_dir=$(pwd)
#   cp -rf $current_dir/config/rofi ~/.config/
#   cp -rf $current_dir/config/dunst ~/.config/
# }

function i3setup() {
  echo "Setting up i3..."
  sudo pacman -Sy xorg xorg-xinit dmenu i3 polybar feh rofi picom ttf-liberation
  echo "exec i3" >>~/temp
  cd ~
  cp -rf arch_config/dotfiles ~/
  cd ~/dotfiles
  stow i3
  # startx

  # current_dir=$(pwd)
  # mkdir ~/.config/i3
  # cp -rf $current_dir/config/i3/* ~/.config/i3/
  # cp -rf $current_dir/config/polybar ~/.config/
  # install_config
  echo "i3 window manger is now installed. Log out, and on the login screen set i3 to be the window manager before logging back in."
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
prompt_user "Would you like to set up i3 window manager?" i3setup
