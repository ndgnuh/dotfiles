local github = vim.pack.github

vim.pack.add({
  	github"nvim-mini/mini.nvim",
	github"lukas-reineke/indent-blankline.nvim",
	github"itchyny/lightline.vim",

	-- Languages
	github"lervag/vimtex",
	github"JuliaEditorSupport/julia-vim",
	github"folke/lazydev.nvim",
	github"lark-parser/vim-lark-syntax",
	github"goerz/jupytext.nvim",

	-- etc
	github"tpope/vim-surround",
	github"terrortylor/nvim-comment",
	github"godlygeek/tabular",
})

local setup_default_packages = {
	"ibl",
	"lazydev",
	"nvim_comment",
}


for _, pkg in ipairs(setup_default_packages) do
	require(pkg).setup()
end

-- From package godlygeek/tabular
vim.keymap.set("x", "ga", ":Tabularize/")

-- Color scheme for lightline
vim.g.lightline = { colorscheme = "one" }
