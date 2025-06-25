require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "pyright",
  "html",
  "cssls",
  "ts_ls",
  -- "sqlls",
}

local servers_to_install = { "lua_ls" }
for _, server in ipairs(servers) do
  table.insert(servers_to_install, server)
end
lspconfig.servers = servers_to_install

for _, server_name in ipairs(servers) do
  lspconfig[server_name].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
