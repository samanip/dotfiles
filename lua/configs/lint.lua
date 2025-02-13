local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "mypy", "ruff" },
    c_sharp = { "csharpier" },
}

lint.linters.luacheck.args = {
    "--globals",
    "love",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
    callback = function()
        lint.try_lint()
    end,
})
