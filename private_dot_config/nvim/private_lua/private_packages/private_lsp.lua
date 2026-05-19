MiniDeps.add("neovim/nvim-lspconfig")

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	update_in_insert = true,
	underline = true,
})

vim.lsp.enable({
	"lua_ls",
	"html",
	-- "julials",
	"texlab",
	"dartls",
})
--- These LSP is not available on termux
if vim.g.is_desktop then
	vim.lsp.enable({
		"pyright",
		-- "pyls",
		"nixd",
		"dprint",
		-- "jinja_lsp",
		"eslint",
	})

	vim.lsp.config( --- Julia JETLS
		"jetls",
		{
			cmd = { "jetls", "--threads=auto", "--" },
			filetypes = { "julia" },
		}
	)
	vim.lsp.enable("jetls")
end

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Lsp buffer configuration",
	group = vim.api.nvim_create_augroup("LspAutoKeybindings", {}),
	callback = function(event)
		-- completion with lsp's omnifunc
		-- also auto completion
		local client_id = event.data.client_id
		local bufnr = event.buf
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.lsp.completion.enable(true, client_id, bufnr, { autotrigger = false })

		local function document_symbols()
			MiniExtra.picker.lsp({ scope = "document_symbol" })
		end

		local conform, _ = pcall(require, "conform")
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", document_symbols, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		if not conform then
			vim.keymap.set({ "n", "x" }, "<leader>f", vim.lsp.buf.format, opts)
		end
		vim.keymap.set({ "x", "n" }, "<leader>a", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
		vim.keymap.set("n", "]a", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
		-- vim.keymap.set('s', '<C-l>', function() vim.snippet.jump(1) end, opts)
		vim.keymap.set("s", "<Tab>", function()
			vim.snippet.jump(1)
		end, opts)
		-- vim.keymap.set('i', '<C-space>', cmp.mapping.complete, opts)
	end,
})

--- https://www.andersevenrud.net/neovim.github.io/lsp/configurations/julials/
---
--- obtained by Base.find_package("LanguageServer")
-- do
-- 	local julials_path = "/home/hung/.cache/julia/packages/LanguageServer/Fwm1f/src/LanguageServer.jl"
--
-- 	local julia_script = [[
-- using Pkg
-- const project_path = let
--     dirname(
--         something(
--             ## 1. Finds an explicitly set project (JULIA_PROJECT)
--             Base.load_path_expand(
--                 (
--                     p = get(ENV, "JULIA_PROJECT", nothing);
--                     p === nothing ? nothing : isempty(p) ? nothing : p
--                 ),
--             ),
--             ## 2. Look for a Project.toml file in the current working directory,
--             ##    or parent directories, with $HOME as an upper boundary
--             Base.current_project(),
--             ## 3. First entry in the load path
--             get(Base.load_path(), 1, nothing),
--             ## 4. Fallback to default global environment,
--             ##    this is more or less unreachable
--             Base.load_path_expand("@v#.#"),
--         ),
--     )
-- end
--
-- # Include nvim-lspconfig package to LOAD_PATH
-- Pkg.activate("nvim-lspconfig"; shared = true)
-- using LanguageServer
-- Pkg.activate(project_path)
--
-- # Run language server
-- depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
-- @info "Running language server" VERSION pwd() project_path depot_path
-- server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
-- server.runlinter = true
-- run(server)
--         ]]
--
-- 	local cmd = {
-- 		"julia",
-- 		"--startup-file=no",
-- 		"--history-file=no",
-- 		"-e",
-- 		julia_script,
-- 	}
-- 	vim.lsp.config("julials", {
-- 		cmd = cmd,
-- 		-- on_new_config = function(new_config, new_root_dir)
-- 		-- 	new_config.cmd = cmd
-- 		-- end,
-- 	})
-- end
-- do
-- 	local jetls_path = "/home/hung/Application/JETLS.jl"
-- 	vim.lsp.config("jetls", {
-- 		cmd = {
-- 			"julia",
-- 			"--startup-file=no",
-- 			"--history-file=no",
-- 			"--project=" .. jetls_path,
-- 			"--threads=auto",
-- 			jetls_path .. "/runserver.jl",
-- 		},
-- 		filetypes = { "julia" },
-- 	})
-- 	vim.lsp.enable("jetls")
-- end
