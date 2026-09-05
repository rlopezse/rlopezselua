# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration (user: rlopezse), written in Lua, using
[lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Requires Neovim 0.12+.

## Commands

There is no build/lint/test tooling — this is a Neovim config, not an application. To validate changes:

- Reload config inside Neovim: `<leader><leader>` (mapped to `:source` in `lua/rlopezse/remap.lua`)
- Launch Neovim with this config to sanity-check: `nvim`
- Check Lua syntax without opening Neovim: `nvim --headless -c 'luafile <path>' -c 'qa'`
- Plugin versions are pinned in `lazy-lock.json`; run `:Lazy sync` inside Neovim after adding/changing a plugin spec, then commit the updated lockfile.

## Architecture

Load order, set by `init.lua` -> `lua/rlopezse/init.lua`:

1. `lua/rlopezse/set.lua` — core `vim.opt` settings (numbers, indentation, undo dir, etc.)
2. `lua/rlopezse/remap.lua` — global keymaps not tied to a specific plugin (leader is `<space>`)
3. `lua/rlopezse/lazy_init.lua` — bootstraps lazy.nvim and loads plugin specs from `lua/rlopezse/plugins/`

Each file in `lua/rlopezse/plugins/` is an independent lazy.nvim plugin spec (one plugin, or a small
related group, per file) returning a table consumed via `spec = "rlopezse.plugins"`. To add a plugin,
create a new file there returning a lazy.nvim spec table — no other registration is needed, lazy.nvim
picks up every file in that directory automatically.

Plugin-specific keymaps live inside that plugin's `config` function in `lua/rlopezse/plugins/*.lua`
rather than in `remap.lua`, so check both locations when hunting for a keybinding.

Known quirk: `<leader>s` is bound twice — as a substitute-word command in `remap.lua` and as
`telescope.builtin.find_files` in `plugins/telescope.lua`. Since plugin keymaps are set up after core
remaps during lazy.nvim's config phase, the Telescope binding wins in practice.
