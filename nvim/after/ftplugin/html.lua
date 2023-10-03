vim.opt.shiftwidth = 2 ---@type number
vim.opt.tabstop = 2 ---@type number
vim.b.disable_autoformat = true ---@type boolean
vim.opt.foldmethod = "indent" ---@type "indent" | "syntax" | "expr" | "diff" | "marker" | "manual"
vim.opt.smartindent = true ---@type boolean

local check_html_char = function()
  local prev_col, next_col = vim.fn.col(".") - 1, vim.fn.col(".")
  local prev_char = vim.fn.getline("."):sub(prev_col, prev_col)
  local next_char = vim.fn.getline("."):sub(next_col, next_col)

  if prev_char:match(">") and next_char:match("<") then
    return "<cr><esc>ko"
  else
    return "<cr>"
  end
end

vim.keymap.set("i", "<CR>", check_html_char, { expr = true, noremap = true, silent = true })
