vim.pack.add({ "https://github.com/timoleistner/doi2bib.nvim" })

vim.api.nvim_set_keymap("n", "gb", '<cmd>lua require("doi2bib").doi2bib()<cr>', { noremap = true, silent = true })
