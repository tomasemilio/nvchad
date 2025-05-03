dofile(vim.g.base46_cache .. "nvimtree")
local win_width = 91
local win_height = 27
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
      open_win_config = {
        relative = "editor",
        border = true,
        width = win_width,
        height = win_height,
        row = math.floor((vim.o.lines - win_height) / 2),
        col = math.floor((vim.o.columns - win_width) / 2),
      },
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
