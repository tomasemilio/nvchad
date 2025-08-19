# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Reference Documentation

For any questions about NvChad functionality, configuration options, or troubleshooting, feel free to search the official NvChad repository: https://github.com/NvChad/NvChad

## Overview

This is a Neovim configuration based on NvChad v2.5. The configuration follows NvChad's structure where the main NvChad repository is used as a plugin, and this repo imports its modules and extends functionality with custom configurations.

## Architecture

- **Entry Point**: `init.lua` - Bootstraps lazy.nvim, loads NvChad plugin, and initializes all configurations
- **Core Configuration**: 
  - `lua/chadrc.lua` - Main NvChad configuration (theme, UI settings)
  - `lua/options.lua` - Vim options and settings
  - `lua/mappings.lua` - Custom key mappings
  - `lua/autocmds.lua` - Auto commands
- **Plugin Management**: 
  - `lua/plugins/init.lua` - Custom plugin definitions extending NvChad's base plugins
  - `lua/configs/` - Individual plugin configurations
- **Package Management**: Uses lazy.nvim for plugin management with Mason for LSP/formatter/linter installation

## Key Plugins & Configurations

- **LSP**: Configured via `configs/lspconfig.lua` with Mason integration
- **Formatting**: Conform.nvim with Mason integration (`configs/conform.lua`)
- **Linting**: nvim-lint with Mason integration (`configs/lint.lua`)
- **File Navigation**: Telescope.nvim and nvim-tree
- **Git Integration**: diffview.nvim for git diffs and history
- **Syntax Highlighting**: nvim-treesitter

## Plugin Configuration Pattern

Custom plugins are defined in `lua/plugins/init.lua` with their configurations in separate files under `lua/configs/`. Each plugin config is loaded via `require "configs.{plugin-name}"`.

## Mason Integration

The configuration uses Mason for automatic installation of LSP servers, formatters, and linters:
- `mason-lspconfig.nvim` - Automatic LSP server installation
- `mason-conform.nvim` - Automatic formatter installation  
- `mason-nvim-lint` - Automatic linter installation

## Key Mappings

- `<C-b>` - Telescope find files
- `<leader>dv` - Open DiffView
- `<leader>dm` - DiffView vs main branch
- `<C-\>` - Toggle terminal with auto-save
- `jk` - Exit insert mode

## Configuration Workflow

1. Modify `lua/chadrc.lua` for NvChad-specific settings (theme, UI)
2. Add custom options in `lua/options.lua`
3. Add custom mappings in `lua/mappings.lua`
4. Add new plugins in `lua/plugins/init.lua`
5. Create plugin configs in `lua/configs/{plugin-name}.lua`

## Theme and UI

- Current theme: "onenord"
- Dashboard loads on startup
- Tabline is not lazy-loaded
- Comment highlighting uses italics