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
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.diffview"
    end,
  },
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
}
