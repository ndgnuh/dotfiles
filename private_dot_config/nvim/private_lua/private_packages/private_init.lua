-- usage:
-- local github = vim.pack.github
vim.pack.github = function(repo)
	return "https://github.com/" .. tostring(repo)
end

-- require("packages.bootstrap")
require("packages.blink-cmp")
require("packages.conform")
require("packages.colorscheme")
require("packages.mini-picks")
require("packages.tree-sitter")
require("packages.lsp")
-- require("packages.doi2bib")
-- require("packages.luarocks")
require("packages.smear")

require("packages.misc")
