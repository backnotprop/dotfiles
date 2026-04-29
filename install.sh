#!/bin/sh
set -e

DOTFILES="$HOME/dotfiles"

link() {
  src="$DOTFILES/$1"
  dst="$2"

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "  backup: $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi

  ln -s "$src" "$dst"
  echo "  linked: $dst -> $src"
}

echo "Installing dotfiles..."

link "zsh/zshrc"                    "$HOME/.zshrc"
link "zsh/zprofile"                 "$HOME/.zprofile"
link "zsh/p10k.zsh"                 "$HOME/.p10k.zsh"
link "git/gitconfig"                "$HOME/.gitconfig"
link "ghostty/config"               "$HOME/.config/ghostty/config"
link "ghostty/toggle-theme.sh"      "$HOME/.config/ghostty/toggle-theme.sh"
link "claude/statusline-command.sh" "$HOME/.claude/statusline-command.sh"

echo "Checking macOS defaults..."
sh "$DOTFILES/macos/ensure-defaults.sh"

echo "Done. Open a new terminal to pick up changes."
