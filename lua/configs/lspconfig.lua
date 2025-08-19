local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Load NvChad defaults (includes lua_ls and pyright)
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls", 
  "ts_ls",
  "sqlls",
}

-- Set servers for Mason to install (lua_ls and pyright already handled by defaults)
lspconfig.servers = servers

-- Setup additional servers (lua_ls and pyright already setup by defaults)
for _, server_name in ipairs(servers) do
  lspconfig[server_name].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
