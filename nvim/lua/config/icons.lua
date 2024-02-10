local icons = {
  otter = "🦦",
  Copilot = " ",
  nvim_lsp = "󰄴 ",
  luasnip = " ",
  buffer = "󰌷 ",
  nvim_lua = " ",
  path = " ",
  nvim_treesitter = " ",
  spell = "󰓆 ",
  tags = " ",
  vim_dadbod_completion = "󰆼 ",
  calc = " ",
  emoji = "󰱨 ",
}

icons.diagnostics = {
  Error = "E ",
  Warn = "W ",
  Hint = "H ",
  Info = "I ",
}

icons.git = {
  added = "A ",
  modified = "M ",
  removed = "E ",
}

vim.g.db_ui_icons = {
  expanded = "",
  collapsed = "",
  saved_query = "*",
  new_query = "+",
  tables = "~",
  buffers = "»",
  connection_ok = "✓",
  connection_error = "✕",
}

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
    },
  },
  virtual_text = false,
})

return icons
