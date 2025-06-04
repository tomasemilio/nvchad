-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

lspconfig.servers = {
  "lua_ls",
  "pyright",
  "html",
  "ts_ls",
  -- "sqlls",
}

-- EXAMPLE
local default_servers = {
  "pyright",
  "html",
  "cssls",
  "ts_ls",
  -- "sqlls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
