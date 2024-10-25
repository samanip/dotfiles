vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

vim.opt.swapfile = false
local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
-- vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])

vim.wo.relativenumber = true -- Enable relative line numbers
require("options")
require("nvchad.autocmds")

vim.schedule(function()
    require("mappings")
end)
local function open_nvdash()
    if vim.fn.argc() == 0 then
        vim.cmd("Nvdash") -- Use the command directly
    end
end

-- Autocommand to run the function on VimEnter event
vim.api.nvim_create_autocmd("VimEnter", {
    callback = open_nvdash,
})