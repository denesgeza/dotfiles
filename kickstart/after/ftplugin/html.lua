---@diagnostic disable: missing-fields
local check_html_char = require("config.functions").check_html_char

vim.opt.shiftwidth = 2 ---@type number
vim.opt.tabstop = 2 ---@type number

-- Conform format_on_save
vim.b.disable_autoformat = false ---@type boolean
-- Lazy autoformat
vim.b.autoformat = false ---@type boolean

vim.opt.foldmethod = "indent" ---@type "indent" | "syntax" | "expr" | "diff" | "marker" | "manual"
vim.opt.smartindent = true ---@type boolean

vim.keymap.set("i", "<CR>", check_html_char, { expr = true, noremap = true, silent = true })

-- CSS completion
-- require("cmp").setup({
--   sources = {
--     {
--       name = "html-css",
--       option = {
--         max_count = {}, -- not ready yet
--         enable_on = { "html", "htmldjango" }, -- set the file types you want the plugin to work on
--         file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
--         style_sheets = { "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" },
--       },
--     },
--   },
-- })