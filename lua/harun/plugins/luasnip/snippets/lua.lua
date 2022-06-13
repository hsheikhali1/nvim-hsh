local ls = require("luasnip")

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

cs("cmd", fmt("vim.cmd[[{}]]", { i(1, "") }))
