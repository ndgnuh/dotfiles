local prefix = os.getenv("PREFIX") or ""

if prefix:find("com.termux") then
    vim.g.is_termux = true
else
    vim.g.is_termux = false
end

vim.g.is_desktop = not vim.g.is_termux
