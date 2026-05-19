MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "main",
})

local ts = require("nvim-treesitter")

ts.install({
	"julia",
	"bash",
	"dart",
	"python",
	"lua",
	"html",
	"javascript",
	"ebnf",
	-- "latex"
})

if vim.g.is_desktop then
	ts.install({ "latex" })
end

ts.setup({
	highlighting = { enable = true },
})
