require("mason-lspconfig").setup {
  ensure_installed = require "configs.servers",
  -- servers are enabled in configs/lspconfig.lua
  automatic_enable = false,
}
