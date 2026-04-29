#!/bin/sh
# Toggle Ghostty between light (XcodeLightHC) and dark (Kanagawa Dragon).
# Flips `window-theme` in the config, then tells Ghostty to reload via
# the cmd+shift+l keybind (defined in config).

set -e

CONFIG="$HOME/.config/ghostty/config"

if grep -q '^window-theme = dark' "$CONFIG"; then
  sed -i '' 's/^window-theme = dark/window-theme = light/' "$CONFIG"
  echo "Ghostty: light (XcodeLightHC)"
else
  sed -i '' 's/^window-theme = light/window-theme = dark/' "$CONFIG"
  echo "Ghostty: dark (Kanagawa Dragon)"
fi

# Trigger reload_config in Ghostty by sending the cmd+shift+l keybind.
# Requires Ghostty to be the frontmost app.
osascript <<'EOF' >/dev/null 2>&1 || true
tell application "System Events"
  if (name of first application process whose frontmost is true) is "ghostty" then
    keystroke "l" using {command down, shift down}
  end if
end tell
EOF
