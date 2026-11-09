return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- main branch does not support lazy-loading
    build = ":TSUpdate",
    -- table (not function) so NvChad's :TSInstallAll can read it
    opts = require "configs.nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter").install(opts.ensure_installed)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim", "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim", "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim", "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    -- merged into NvChad's gitsigns opts. 'diffopt' has linematch on, which pairs
    -- each new line with its most similar old one and splits a rewritten block
    -- into interleaved red/green pieces. Off here, the unified diffs show the whole
    -- removed block, then the whole added block, like preview_hunk. Side-by-side
    -- diffs still use 'diffopt', so they keep linematch.
    opts = { diff_opts = { linematch = 0 } },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
}
