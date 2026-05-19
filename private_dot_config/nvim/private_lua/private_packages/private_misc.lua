local install_packages = {
	"lukas-reineke/indent-blankline.nvim",
	"itchyny/lightline.vim",

	-- Languages
	"lervag/vimtex",
	"JuliaEditorSupport/julia-vim",
	"hiphish/jinja.vim",
	"folke/lazydev.nvim",
	"lark-parser/vim-lark-syntax",
	"goerz/jupytext.nvim",

	-- etc
	"tpope/vim-surround",
	"terrortylor/nvim-comment",
	"godlygeek/tabular",
	-- "github/copilot.vim",
}

local setup_default_packages = {
	"ibl",
	"lazydev",
	"nvim_comment",
}

for _, pkg in ipairs(install_packages) do
	MiniDeps.add(pkg)
end

for _, pkg in ipairs(setup_default_packages) do
	require(pkg).setup()
end

-- From package godlygeek/tabular
vim.keymap.set("x", "ga", ":Tabularize/")

vim.g.lightline = {
	colorscheme = "one",
}
