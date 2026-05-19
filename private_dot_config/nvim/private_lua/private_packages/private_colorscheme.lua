MiniDeps.add("RRethy/base16-nvim")

vim.schedule(function()
	vim.opt.termguicolors = true
	vim.opt.background = "dark"
	vim.cmd([[colorscheme base16-tokyo-city-dark]])
end)
