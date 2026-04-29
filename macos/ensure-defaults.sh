#!/bin/sh
# Verify macOS defaults are set. Runs on every shell launch — only writes if
# a value is missing or wrong, and stays silent when everything's correct.

_ensure() {
  local current
  current=$(defaults read -g "$1" 2>/dev/null)
  if [ "$current" != "$2" ]; then
    defaults write -g "$1" -int "$2"
    echo "[dotfiles] Set $1 to $2 (was: ${current:-unset}). Log out to apply."
  fi
}

_ensure KeyRepeat 1
_ensure InitialKeyRepeat 10

unset -f _ensure
