#!/bin/sh
# macOS keyboard defaults — run once, requires logout to take effect.

# Key repeat rate (lower = faster). Fastest in System Settings is 2.
defaults write -g KeyRepeat -int 1

# Delay before key repeat starts (lower = shorter). Fastest in System Settings is 15.
defaults write -g InitialKeyRepeat -int 10

echo "Done. Log out and back in for changes to take effect."
