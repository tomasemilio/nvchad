local parsers = {
  "vim",
  "lua",
  "vimdoc",
  "html",
  "css",
  "python",
  "sql",
  "json",
  "javascript",
  "bash",
  "toml",
  "yaml",
  "markdown",
  "c",
  "xml",
  "dockerfile",
}

require("nvim-treesitter").install(parsers)

