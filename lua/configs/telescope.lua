dofile(vim.g.base46_cache .. "telescope")

return {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.7,
      height = 0.7,
    },
    mappings = {
      n = {
        ["<C-b>"] = require("telescope.actions").close,
        ["<M-b>"] = require("telescope.actions").close,
      },
      i = {
        ["<C-b>"] = require("telescope.actions").close,
        ["<M-b>"] = require("telescope.actions").close,
      },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
}
