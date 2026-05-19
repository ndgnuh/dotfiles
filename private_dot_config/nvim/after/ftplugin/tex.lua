local main_file = nil;

local function set_main_file()
    vim.print("Setting main LaTeX file...")
    main_file = vim.fn.expand("%")
    if main_file == nil then
        vim.opt.makeprg = "latexmk -pdf -interaction=nonstopmode -synctex=1 %"
    else
        vim.opt.makeprg = "latexmk -pdf -interaction=nonstopmode -synctex=1 " .. main_file
    end
    vim.print("Main LaTeX file is set to " .. main_file)
end


vim.keymap.set({ "i", "n" }, "<F5>", "<cmd>make<cr>", { buffer = true })
vim.keymap.set({ "i", "n" }, "<F6>", set_main_file, { buffer = true })
