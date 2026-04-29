#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
display_cwd=$(echo "$cwd" | sed "s|^$HOME|~|")
if [ -n "$branch" ]; then
  printf "\033[90m[%s]\033[0m \033[34m%s\033[0m \033[32m(%s)\033[0m" "$model" "$display_cwd" "$branch"
else
  printf "\033[90m[%s]\033[0m \033[34m%s\033[0m" "$model" "$display_cwd"
fi
