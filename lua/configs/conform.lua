local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    sql = { "sql-formatter" },
    javascript = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
