local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local orig_util_make_position_params = vim.lsp.util.make_position_params
vim.lsp.util.make_position_params = function(...)
    local params = orig_util_make_position_params(...)
    params.position = params.position or {}
    params.position.character = params.position.character or 0
    params.position.encoding = "utf-16"
    return params
end

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "eslint",
    "phpactor",
    "ts_ls",
    "omnisharp",
    "gopls",
}

-- list of servers configured with default config.
-- local default_servers = { "pyright" }
--
-- -- lsps with default config
-- for _, lsp in ipairs(default_servers) do
--     lspconfig[lsp].setup({
--         on_attach = on_attach,
--         on_init = on_init,
--         capabilities = capabilities,
--     })
-- end

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                diagnosticMode = "workspace", -- Can be "workspace" or "openFilesOnly"
                useLibraryCodeForTypes = true, -- Use type information from libraries
            },
        },
    },
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.eslint.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.phpactor.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.omnisharp.setup({
    cmd = { "/Users/pedram/.local/share/nvim/mason/packages/omnisharp/omnisharp" },
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl", "gowork" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
        },
    },
})

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = { -- Insert mode
                ["<C-x>"] = actions.delete_buffer, -- Delete buffer in insert mode
            },
            n = { -- Normal mode
                ["<C-x>"] = actions.delete_buffer, -- Delete buffer in normal mode
            },
        },
    },
})
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- fd for file diagnostics
