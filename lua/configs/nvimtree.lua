dofile(vim.g.base46_cache .. "nvimtree")

return {
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = function()
        local w = math.min(math.max(math.floor(vim.o.columns * 0.8), 60), 120)
        local h = math.min(math.max(math.floor(vim.o.lines * 0.8), 20), 40)
        return {
          relative = "editor",
          border = "rounded",
          width = w,
          height = h,
          row = math.floor((vim.o.lines - h) / 2),
          col = math.floor((vim.o.columns - w) / 2),
        }
      end,
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = { unmerged = "" },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = { enable = false },
      quit_on_open = false,
    },
  },
}

