local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    sql = { "sql_formatter" },
    javascript = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 3000,
    -- "fallback" = use the LSP's formatter for filetypes with no conform formatter above.
    -- Side effect: TS/JSON/YAML etc. get reformatted by their LSP on save even though
    -- they aren't listed in formatters_by_ft. If that becomes annoying, either remove
    -- this line (only format configured filetypes) or add explicit formatters for them.
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
