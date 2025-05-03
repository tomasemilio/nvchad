require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent line(s) and keep selection" })
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Un-indent line(s) and keep selection" })
-- Telescope
map("n", "<C-b>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<M-b>", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>gr", "<cmd> Telescope lsp_references <cr>", { desc = "Telescope References" })
map("n", "<leader>dg", "<cmd> Telescope diagnostics <cr>", { desc = "Telescope Diagnostics" })
map("n", "<leader>re", "<cmd> Telescope registers <cr>", { desc = "Telescope Registers" })

-- Diffview
map("n", "<leader>dv", "<cmd> DiffviewOpen <cr>", { desc = "DiffView Open" })
map("n", "<leader>dc", "<cmd> DiffviewClose <cr>", { desc = "DiffView Close" })
map("n", "<leader>dh", "<cmd> DiffviewFileHistory <cr>", { desc = "DiffView History" })
map("n", "<leader>dH", "<cmd> DiffviewFileHistory %<cr>", { desc = "DiffView Buffer History" })
map("n", "<leader>dm", "<cmd> DiffviewOpen ..main <cr>", { desc = "DiffView vs main" })
map("n", "<leader>dl", "<cmd> DiffviewOpen ..HEAD~ <cr>", { desc = "DiffView vs last" })

-- Terminal
map("t", "<Esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t", "i" }, "<C-\\>", function()
  vim.cmd ":wa"
  require("nvchad.term").toggle {
    pos = "bo sp",
    id = "htoggleTerm",
    size = 1.0,
  }
end, { desc = "terminal Save and Terminal" })
