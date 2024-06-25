Is_Enabled = require("config.functions").is_enabled

return {
  "gh-liu/fold_line.nvim",
  enabled = Is_Enabled("fold-line"),
  event = "VeryLazy",
  init = function()
    -- change the char of the line, see the `Appearance` section
    vim.g.fold_line_char_open_start = "╭"
    vim.g.fold_line_char_open_end = "╰"
    vim.g.fold_line_char_top_close = "+" -- default: fillchars.foldclose or "+"
    vim.g.fold_line_char_close = "├" -- default: fillchars.vertright or "├"
    vim.g.fold_line_char_open_sep = "│" -- default: fillchars.foldsep or "│"
  end,
}
