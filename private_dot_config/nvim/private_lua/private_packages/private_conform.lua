MiniDeps.add({
	source = "stevearc/conform.nvim",
})

local conform = require("conform")
conform.setup({
	-- custom formatter for languages without LSP
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		tex = { "tex-fmt" },
		julia = { "runic" },
		html = { "prettier" },
		javascript = { "prettier" },
		xml = { "xmllint" },
		css = { "prettier" },
		scss = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		less = { "prettier" },
		typescript = { "prettier" },
	},

	-- These options will be passed to conform.format()
	format_on_save = {
		timeout_ms = 2000, -- black CONSTANTLY times out
		lsp_fallback = true,
	},
})

-- Format using leader+f
vim.keymap.set({ "n", "x" }, "<leader>f", function()
	conform.format({ async = true, lsp_fallback = true })
end, {})
