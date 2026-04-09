local lint = package.loaded["lint"]

local seen = {}
local all_linters = {}
for _, v in pairs(lint.linters_by_ft) do
  for _, linter in ipairs(v) do
    if not seen[linter] then
      seen[linter] = true
      table.insert(all_linters, linter)
    end
  end
end

require("mason-nvim-lint").setup {
  ensure_installed = all_linters,
  automatic_installation = false,
}

