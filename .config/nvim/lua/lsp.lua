-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

require("lspconfig").pylsp.setup({
	autostart = true,
	-- on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").julials.setup({
	-- 	cmd = {
	-- 		"julia",
	-- 		"--sysimage=/home/hung/.cache/julia/environments/nvim-lspconfig/sys.so",
	-- 		"--startup-file=no",
	-- 		"--history-file=no",
	-- 		"-e",
	-- 		[[
	-- # Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig
	-- # with the regular load path as a fallback
	-- const ls_install_path = joinpath(
	-- 	get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),
	-- 	"environments", "nvim-lspconfig"
	-- )
	-- pushfirst!(LOAD_PATH, ls_install_path)
	-- using LanguageServer
	-- popfirst!(LOAD_PATH)
	-- depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
	-- project_path = let
	-- 	dirname(something(
	-- 		## 1. Finds an explicitly set project (JULIA_PROJECT)
	-- 		Base.load_path_expand((
	-- 			p = get(ENV, "JULIA_PROJECT", nothing);
	-- 			p === nothing ? nothing : isempty(p) ? nothing : p
	-- 		)),
	-- 		## 2. Look for a Project.toml file in the current working directory,
	-- 		##    or parent directories, with $HOME as an upper boundary
	-- 		Base.current_project(),
	-- 		## 3. First entry in the load path
	-- 		get(Base.load_path(), 1, nothing),
	-- 		## 4. Fallback to default global environment,
	-- 		##    this is more or less unreachable
	-- 		Base.load_path_expand("@v#.#"),
	-- 	))
	-- end
	-- @info "Running language server" VERSION pwd() project_path depot_path
	-- server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
	-- server.runlinter = true
	-- run(server)
	-- ]],
	-- 	},
	autostart = true,
	-- on_attach = on_attach,
	capabilities = capabilities,
})

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-x><C-o>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})
