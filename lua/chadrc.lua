-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "rosepine",

    hl_override = {
        -- 	-- Example
        Normal = { bg = "#000000" },
        NormalNC = { bg = "#000000" },
        NormalFloat = { bg = "#000000" },
        NormalNCFloat = { bg = "#000000" },
        FloatBorder = { bg = "#000000" },
        Border = { bg = "#000000" },
        BorderNC = { bg = "#000000" },
        BorderFocus = { bg = "#000000" },
        BorderFocusNC = { bg = "#000000" },
        -- 	SignColumn = { fg = "#FFFFFF", bg = "#000000" },
        -- 	VertSplit = { fg = "#FFFFFF", bg = "#000000" },
        -- 	VertSplitNC = { fg = "#FFFFFF", bg = "#000000" },
        -- 	VertSplitFocus = { fg = "#FFFFFF", bg = "#000000" },
        -- 	VertSplitFocusNC = { fg = "#FFFFFF", bg = "#000000" },
        -- 	LineNr = { fg = "#FFFFFF", bg = "#000000" },
        -- 	LineNrNC = { fg = "#FFFFFF", bg = "#000000" },
        -- 	CursorLineNr = { fg = "#FFFFFF", bg = "#000000" },
        -- 	CursorLineNrNC = { fg = "#FFFFFF", bg = "#000000" },
        -- 	MatchParen = { fg = "#FFFFFF", bg = "#000000" },
        -- 	MatchParenNC = { fg = "#FFFFFF", bg = "#000000" },
        -- 	MatchParenFocus = { fg = "#FFFFFF", bg = "#000000" },
        -- 	MatchParenFocusNC = { fg = "#FFFFFF", bg = "#000000" },
        -- 	MatchParenCursor = { fg = "#FFFFFF", bg = "#000000" },
        -- 	MatchParenCursorNC = { fg = "#FFFFFF", bg = "#000kjjjj
        -- 	Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

-- vim.cmd("highlight St_relativepath guifg=#626a83 guibg=#2a2b36")
-- local stbufnr = function()
--     return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
-- end

M.ui = {

    cmp = {
        style = "atom",
    },
    -- statusline = {
    --     theme = "default",
    --     order = { "mode", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    --     -- modules = {
    --     --     relativepath = function()
    --     --         local path = vim.api.nvim_buf_get_name(stbufnr())
    --     --
    --     --         if path == "" then
    --     --             return ""
    --     --         end
    --     --
    --     --         return "%#St_relativepath#  " .. vim.fn.expand("%:.:h") .. " /"
    --     --     end,
    --     -- },
    -- },
}

return M
