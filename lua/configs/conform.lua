local options = {
  formatters_by_ft = {
    lua = { "lua_ls", "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "isort", "black" },
    sql = { "sql-formatter" },
    javascript = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
