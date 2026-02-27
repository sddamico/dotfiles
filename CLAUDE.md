# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for macOS development environment setup, primarily oriented around Android/Java development with Vim and Zsh.

## Setup

Run `init.sh` to bootstrap a new machine. It installs Homebrew packages, fonts, Vim plugins, and clones color scheme repos.

## Key Files

- `.zshrc` — Zsh config using Oh My Zsh (theme: blinks). Sets up Java 21, Android SDK/NDK, Groovy, PostgreSQL 17, NVM, and many custom aliases/functions.
- `.vimrc` — Vim config using vim-plug. Solarized8 dark theme, 2-space indentation, plugins for completion (YouCompleteMe), syntax (Syntastic), Git (fugitive/gitgutter), and Clojure/Groovy/Gradle support.
- `.gitconfig` — Git config with rebase-on-pull, vimdiff merge tool, and aliases (`publish`, `unpublish`, `cleanup`, `delete-merged-branches`).
- `init.sh` — Machine bootstrap script (Homebrew, fonts, Vim plugins, YCM compilation).
- `bin/` — Executable utilities.
- `tools/` — Development tools (RAM disk scripts, DEX method counter, Spoon runner).

## Conventions

- Indentation: 2 spaces (enforced in .vimrc)
- Line endings: Unix (LF)
- Git pull strategy: rebase
- Shell: Zsh with Oh My Zsh framework
