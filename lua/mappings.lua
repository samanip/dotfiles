require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

-- Normal
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>pv", vim.cmd.Ex)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]])

map("", ";", ";")
map("", ",", ",")
map("n", "<Leader>bd", ":bd<CR>", { noremap = true, silent = true })
-- harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

map("n", "<leader>a", function()
    harpoon:list():add()
end)
map("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)
map("n", "<C-h>", function()
    harpoon:list():select(1)
end)
map("n", "<C-t>", function()
    harpoon:list():select(2)
end)
-- map("n", "<C-n>", function()
--     harpoon:list():select(3)
-- end)
-- map("n", "<C-s>", function()
--     harpoon:list():select(4)
-- end)
-- map("n", "<C-S-P>", function()
--     harpoon:list():prev()
-- end)
map("n", "<C-S-N>", function()
    harpoon:list():next()
end)

-- todo comments
map("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
-- Disable mappings
local nomap = vim.keymap.del