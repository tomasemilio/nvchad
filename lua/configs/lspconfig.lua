local servers = {
  "html",
  "cssls",
  "ts_ls",
  "sqlls",
  "pyright",
}

-- Store for mason-lspconfig to read
vim.g.custom_lsp_servers = servers

vim.lsp.enable(servers)
