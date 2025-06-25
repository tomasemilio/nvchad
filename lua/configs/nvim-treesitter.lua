local options = {
  ensure_installed = {
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
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  window_picker = { enable = false },
}

require("nvim-treesitter.configs").setup(options)
