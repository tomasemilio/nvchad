require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> silent! wa <cr>")
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

-- Gitsigns
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Gitsigns Preview Hunk" })
map("n", "<leader>rh", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Gitsigns Reset Hunk" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Gitsigns Blame Line" })
-- ]c/[c everywhere: side-by-side diffs (incl. `gu` in the review panel) use Vim's
-- jump, which follows that diff's comparison; elsewhere gitsigns' hunks, which in
-- the unified review view are the review's own
-- a window keeps 'diff' after its partner closes, so require a partner too
local function in_side_by_side_diff()
  if not vim.wo.diff then
    return false
  end
  local cur = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if win ~= cur and vim.wo[win].diff then
      return true
    end
  end
  return false
end
local function nav_change(direction)
  return function()
    if in_side_by_side_diff() then
      vim.cmd.normal { vim.v.count1 .. (direction == "next" and "]c" or "[c"), bang = true }
    else
      require("gitsigns").nav_hunk(direction)
    end
  end
end
map("n", "]c", nav_change "next", { desc = "Gitsigns Next change" })
map("n", "[c", nav_change "prev", { desc = "Gitsigns Prev change" })
-- on an already-staged hunk this unstages it
map({ "n", "v" }, "<leader>sh", ":Gitsigns stage_hunk<cr>", { desc = "Gitsigns Stage/Unstage Hunk" })

-- origin's default branch (origin/main, origin/master, ...) in the current file's repo,
-- since that's the repo gitsigns diffs; falls back to whichever main/master exists
local function default_branch()
  local dir = vim.fn.expand "%:p:h"
  if vim.fn.isdirectory(dir) == 0 then
    dir = vim.fn.getcwd()
  end
  local function git(...)
    local out = vim.fn.systemlist { "git", "-C", dir, ... }
    return vim.v.shell_error == 0 and out[1] or nil
  end
  local ref = git("symbolic-ref", "--short", "refs/remotes/origin/HEAD")
  if ref then
    return ref
  end
  for _, branch in ipairs { "origin/main", "origin/master", "main", "master" } do
    if git("rev-parse", "--verify", "--quiet", branch) then
      return branch
    end
  end
end

-- Unified diffs: one buffer, added lines green, removed lines inline in red
-- (require rather than :Gitsigns, which doesn't exist until gitsigns lazy-loads)
map("n", "<leader>df", function()
  require("gitsigns").diffthis(nil, { unified = true })
end, { desc = "Gitsigns Toggle unified diff (file)" })
map("n", "<leader>dv", function()
  require("gitsigns").diff(nil, nil, { diff = "unified" })
end, { desc = "Gitsigns Unified diff (all changes)" })
map("n", "<leader>dm", function()
  local base = default_branch()
  if not base then
    vim.notify("No default branch found", vim.log.levels.WARN)
    return
  end
  require("gitsigns").diff(base .. "...HEAD", nil, { diff = "unified" })
end, { desc = "Gitsigns Unified diff vs default branch" })
map("n", "<leader>dl", function()
  require("gitsigns").diff("HEAD~..HEAD", nil, { diff = "unified" })
end, { desc = "Gitsigns Unified diff of last commit" })
map("n", "<leader>dc", function()
  -- the panel lives in its own tab; close it from any of its windows, like its `q`
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match "^gitsigns%-diff://" then
      if #vim.api.nvim_list_tabpages() == 1 then
        vim.cmd "tabnew | tabprevious"
      end
      vim.cmd "tabclose"
      return
    end
  end
  -- otherwise close a <leader>df view; repeating diffthis toggles it off
  if require("gitsigns.unified").get_view() then
    require("gitsigns").diffthis(nil, { unified = true })
    return
  end
  vim.notify("No diff open", vim.log.levels.INFO)
end, { desc = "Gitsigns Close diff" })
map("n", "<leader>dH", function()
  require("gitsigns").blame()
end, { desc = "Gitsigns Blame buffer" })

-- Terminal
map("t", "<Esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t", "i" }, "<C-\\>", function()
  vim.cmd "silent! wa"
  require("nvchad.term").toggle {
    pos = "bo sp",
    id = "htoggleTerm",
    size = 1.0,
  }
end, { desc = "terminal Save and Terminal" })
