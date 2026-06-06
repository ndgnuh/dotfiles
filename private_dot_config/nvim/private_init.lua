-- provide vim.g.is_termux and vim.g.is_desktop

-- Append global system LuaJIT/Lua 5.1 paths to Neovim's path profile
-- package.path = package.path .. ";/usr/share/lua/5.1/?.lua"
-- package.path = package.path .. ";/usr/share/lua/5.1/?/init.lua"
-- package.cpath = package.cpath .. ";/usr/lib/lua/5.1/?.so"
-- package.cpath = package.cpath .. ";/usr/lib/x86_64-linux-gnu/lua/5.1/?.so"

require("termux-detect")
require("packages")

-- IBus integration for desktop
if vim.g.is_desktop then
	require("ibus").setup()
	-- require("fcitx_lgi")
end
require("doi2bib")

vim.opt.number = true
vim.opt.signcolumn = "yes"

-- numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2

-- setup indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- write buffer when switch to other buffer
vim.opt.autowrite = true

-- other settings
vim.opt.winborder = "rounded"
vim.opt.signcolumn = "yes"

-- use system clipboard if available
if vim.g.is_desktop then
	vim.schedule(function()
		vim.opt.clipboard = "unnamedplus"
	end)
end
vim.opt.swapfile = false

-- remove search highlight but highlight the parts being searched, live
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- line wraps with linebreak is MUCH better
vim.opt.wrap = true
vim.opt.linebreak = true

-- completion
vim.opt.completeopt = "menu,popup,noinsert"
