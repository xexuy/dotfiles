#!/usr/bin/env bash

# Copy binaries
ln -fs $DOTFILES_DIR/extras/bins $HOME/bin/

declare -a BINARIES=(
  "crlf"
  "git-delete-merged-branches"
  "ssh-key"
)

for i in ${BINARIES[@]}; do
  echo "Changing access permissions for binary script :: ${i##*/}"
  chmod +rwx $HOME/bin/${i##*/}
done

unset BINARIES

# Create symlinks

declare -a SYMLINK_FROM=(
  "$DOTFILES_DIR/config/shell/shell_aliases"
  "$DOTFILES_DIR/config/shell/shell_config"
  "$DOTFILES_DIR/config/shell/bash_exports"
  "$DOTFILES_DIR/config/shell/bash_functions"
  "$DOTFILES_DIR/config/ackrc"
  "$DOTFILES_DIR/config/bashrc"
  "$DOTFILES_DIR/config/zshrc"
  "$DOTFILES_DIR/config/curlrc"
  "$DOTFILES_DIR/config/gemrc"
  "$DOTFILES_DIR/config/git/gitattributes"
  "$DOTFILES_DIR/config/git/gitconfig"
  "$DOTFILES_DIR/config/git/gitignore"
  "$DOTFILES_DIR/config/alacritty/alacritty.yml"
  "$DOTFILES_DIR/config/kitty/kitty.conf"
  "$DOTFILES_DIR/config/mpd/mpd.conf"
  "$DOTFILES_DIR/config/mpDris2/mpDris2.conf"
  "$DOTFILES_DIR/config/ncmpcpp/bindings"
  "$DOTFILES_DIR/config/ncmpcpp/config"
  "$DOTFILES_DIR/config/starship/starship.toml"
  "$DOTFILES_DIR/config/awesome"
)

declare -a SYMLINK_TO=(
  "$HOME/.shell_aliases"
  "$HOME/.shell_config"
  "$HOME/.bash_exports"
  "$HOME/.bash_functions"
  "$HOME/.ackrc"
  "$HOME/.bashrc"
  "$HOME/.zshrc"
  "$HOME/.curlrc"
  "$HOME/.gemrc"
  "$HOME/.gitattributes"
  "$HOME/.gitconfig"
  "$HOME/.gitignore"
  "$CONFIG_DIR/alacritty/alacritty.yml"
  "$CONFIG_DIR/kitty/kitty.conf"
  "$CONFIG_DIR/mpd/mpd.conf"
  "$CONFIG_DIR/mpDris2/mpDris2.conf"
  "$CONFIG_DIR/ncmpcpp/bindings"
  "$CONFIG_DIR/ncmpcpp/config"
  "$CONFIG_DIR/starship/starship.toml"
  "$CONFIG_DIR/awesome"
)

for i in ${!SYMLINK_FROM[@]}; do
  if [ -e "${SYMLINK_TO[$i]}" ]; then
    # mv ${SYMLINK_TO[$i]} $DOTFILES_BAK
    echo "moving -> ${SYMLINK_TO[$i]}"
    echo "bak -> $DOTFILES_BAK"
  fi

  echo "Creating the link of ${SYMLINK_FROM[$i]}"
  ln -fs "${SYMLINK_FROM[$i]}" "${SYMLINK_TO[$i]}"
  # cp -r $DOTFILES_DIR/config/awesome $CONFIG_DIR/awesome
done

unset SYMLINK_FROM
unset SYMLINK_TO
