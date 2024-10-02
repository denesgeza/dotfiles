-- Imports {{{
Is_Enabled = require("config.functions").is_enabled

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
-- }}}
-- Colorscheme {{{
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = require("settings.highlights.common").set_highlights,
})
-- }}}
-- Disable comment on save {{{
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})
-- }}}
-- Stylize markdown for nvim-cmp {{{
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cmp_docs",
  callback = function()
    vim.treesitter.start(0, "markdown")
  end,
})
-- }}}
-- Resize splits if window got resized {{{
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
-- }}}

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
-- Set `html` filetype to `htmldjango` when opening an html file
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.html",
  callback = function()
    vim.cmd("set filetype=htmldjango")
  end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 3
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Show line diagnostics in hover window
-- vim.o.updatetime = 1000
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
--   callback = function()
--     -- vim.diagnostic.open_float(nil, { focus = false }) -- to show if on the line
--     vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" }) -- to show if on the line
--   end,
-- })

-- Sync colorscheme with terminal
-- vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
--   callback = function()
--     local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
--     if not normal.bg then
--       return
--     end
--     io.write(string.format("\027]11;#%06x\027\\", normal.bg))
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("UILeave", {
--   callback = function()
--     io.write("\027]111\027\\")
--   end,
-- })
