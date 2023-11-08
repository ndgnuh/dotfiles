local lspconfig = require("lspconfig")
local nvim_cmp_lsp = require("cmp_nvim_lsp")

local myconfig = {
    auto_start = true,
    capabilities = nvim_cmp_lsp.default_capabilities()
}
local vim = _G.vim

-- auto setup language server
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup(myconfig)
    end
}

-- manually installed language servers
lspconfig.julials.setup(myconfig)
lspconfig.pylsp.setup({
    auto_start = myconfig.auto_start,
    capabilities = myconfig.capabilities,
    settings = {
        pylsp = {
            plugins = {
                autopep8 = { enabled = false },
                yapf = { enabled = false },
            }
        }
    }
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            local opts = { buffer = ev.buf }

            -- omni fucntion c-x c-o
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- go to declaration
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

            -- hover help
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

            -- format
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

            -- auto format when writting
            -- vim.api.nvim_create_autocmd(
            --     "BufWritePre",
            --     {
            --         callback = function(ev)
            --             local client = vim.lsp.get_active_clients()[1]

            --             -- Client may be nil
            --             if client then
            --                 -- Check if the server supports formatting
            --                 if client.server_capabilities.documentFormattingProvider then
            --                     -- Sync formatting prevents weird buffer interactions
            --                     -- But it's very slow!
            --                     pcall(vim.lsp.buf.format)
            --                 end
            --             end
            --         end
            --     }
            -- )
        end
    }
)
