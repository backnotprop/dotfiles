# dotfiles

macOS setup for terminal, shell, and dev tools.

## Install

```sh
git clone git@github.com:backnotprop/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

Backs up existing files to `.bak`, then symlinks everything into place.

## What's in here

```
dotfiles/
├── zsh/
│   ├── zshrc              # shell config (nvm, pyenv, rbenv, pnpm, bun, history, aliases)
│   ├── zprofile           # login shell (homebrew)
│   └── p10k.zsh           # powerlevel10k prompt theme
├── ghostty/
│   ├── config             # terminal themes, keybinds, split styling
│   └── toggle-theme.sh    # light/dark toggle (XcodeLightHC / Kanagawa Dragon)
├── macos/
│   ├── defaults.sh        # one-time keyboard speed setup
│   └── ensure-defaults.sh # checks keyboard defaults on every shell launch
├── git/
│   └── gitconfig          # user, pull ff, ssh url rewriting
├── worktree/
│   └── worktree.sh        # git worktree helpers (wt, wtr, wtrm, wtcd, wtl, wtprune)
├── claude/
│   └── statusline-command.sh  # claude code status line (model, dir, branch)
└── install.sh
```

## First-time Mac setup

After `install.sh`:

1. Install [Ghostty](https://ghostty.org), [Powerlevel10k](https://github.com/romkatv/powerlevel10k), Homebrew
2. Run `sh macos/defaults.sh` then log out and back in (sets keyboard repeat speed)
3. Open a terminal. If prompt looks wrong, run `p10k configure`

## Shell aliases

| Alias | What it does |
|-------|-------------|
| `cx` | Start Claude, skip permissions |
| `cc` | Continue last Claude session, skip permissions |
| `cg` | Start Claude with system understanding prompt |
| `cgp <prompt>` | Start Claude with custom prompt |
| `theme` | Toggle Ghostty light/dark mode |
| `wt <name>` | Create git worktree with new branch |
| `wtrm <name>` | Remove worktree and delete branch |
| `wtl` | List worktrees |
