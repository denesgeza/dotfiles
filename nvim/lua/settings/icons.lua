local icons = {}
icons.cmp = {
  otter = "🦦",
  Copilot = " ",
  codeium = " ",
  nvim_lsp = "󰄴 ",
  luasnip = " ",
  snippets = " ",
  buffer = "󰌷 ",
  nvim_lua = " ",
  path = " ",
  nvim_treesitter = " ",
  spell = "󰓆 ",
  tags = " ",
  vim_dadbod_completion = "󰆼 ",
  calc = " ",
  emoji = "󰱨 ",
  lazydev = " ",
}

icons.lsp = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Field = "󰄶 ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "󰜰",
  Keyword = "󰌆 ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = "󰘍 ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = "󰎠 ",
  Variable = " ",
}

icons.cmp_border = {
  { "󱐋", "LazyCommitType" },
  --   { "", "LazyCommit" }, for documentation border
  { "─", "Comment" },
  { "╮", "Comment" },
  { "│", "Comment" },
  { "╯", "Comment" },
  { "─", "Comment" },
  { "╰", "Comment" },
  { "│", "Comment" },
}

function icons.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = icons.lsp[kind] or kind
  end
end

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

icons.db_ui_icons = {
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

icons.logo = [[
  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
]]

return icons
