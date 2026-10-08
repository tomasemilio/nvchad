-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onenord",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },

		-- Diffs: visible tints, keep syntax colors (fg = NONE).
		-- { color, "black", n } = mix with n% black; lower n = stronger tint.
		DiffAdd = { fg = "NONE", bg = { "green", "black", 80 } },
		DiffDelete = { fg = "NONE", bg = { "red", "black", 80 } },
		DiffChange = { fg = "NONE", bg = { "blue", "black", 88 } },
		DiffText = { fg = "NONE", bg = { "blue", "black", 60 } }, -- changed chars within a line
	},
}
M.nvdash = { load_on_startup = true }
M.ui = {
      tabufline = {
         lazyload = false
     }
}

return M
