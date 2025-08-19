require "nvchad.options"

local options = {
  colorcolumn = "80",
  rnu = true,
  foldmethod = "indent",
  wrap = false,
  foldlevelstart = 99,
  scrolloff = 8,
  swapfile = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
