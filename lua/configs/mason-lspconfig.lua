require("mason-lspconfig").setup {
  ensure_installed = vim.g.custom_lsp_servers or {},
  automatic_installation = false,
}

