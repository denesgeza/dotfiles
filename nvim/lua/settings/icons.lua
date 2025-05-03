local icons = {}
icons.cmp = {
  otter = "🦦",
  Copilot = " ",
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
icons.blink = {
  Text = "󰉿 ",
  Method = "󰊕 ",
  Function = "󰊕 ",
  Constructor = "󰒓 ",

  Field = "󰜢 ",
  Variable = "󰆦 ",
  Property = "󰖷 ",

  Class = "󱡠 ",
  Interface = "󱡠 ",
  Struct = "󱡠 ",
  Module = "󰅩",

  Unit = "󰪚",
  Value = "󰦨 ",
  Enum = "󰦨 ",
  EnumMember = "󰦨 ",

  Keyword = "󰻾 ",
  Constant = "󰏿 ",

  Snippet = "󱄽 ",
  snippets = "󱄽 ",
  LSP = "󰄴 ",
  Color = "󰏘 ",
  File = "󰈔 ",
  Reference = "󰬲 ",
  Folder = "󰉋 ",
  Event = " ",
  Operator = "󰪚",
  TypeParameter = "󰬛",

  Copilot = " ",
  Dadbod = "󰆼 ",
  Omni = "󰳭 ",
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

icons.logo = [[
  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
]]

return icons
