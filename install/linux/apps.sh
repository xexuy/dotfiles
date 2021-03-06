#!/usr/bin/env bash

# Installation of required packages
sudo pacman -S --needed base-devel yay starship curl git
yay -S paru kitty visual-studio-code-bin asdf-vm-git
paru -S awesome-git
paru -Sy picom-git alacritty rofi todo-bin acpi acpid acpi_call \
  upower jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg \
  blueman pamixer brightnessctl scrot redshift feh mpv mpd mpc \
  mpdris2 ncmpcpp playerctl --needed

# Enable music daemon player
systemctl --user enable mpd.service
systemctl --user start mpd.service
