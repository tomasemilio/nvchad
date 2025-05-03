local options = {
  view = {
    default = {
      layout = "diff2_horizontal", -- This places diff views side by side (left and right)
    },
  },
  file_panel = {
    win_config = {
      position = "bottom", -- This places the file selection panel at the bottom
      width = 35,
      height = 10,
    },
  },
  file_history_panel = {
    win_config = {
      position = "bottom",
      width = 35,
      height = 10,
    },
  },
  default_args = {
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
}

return options
