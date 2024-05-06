local M = {}

M.cmp = {
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

M.lsp = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Enum = " ",
  EnumMember = " ",
  Folder = " ",
  Function = " ",
  Interface = "󰜰",
  Keyword = "󰌆 ",
  Module = "󰏗 ",
  Property = " ",
  Struct = " ",
  Unit = " ",
  Value = "󰎠 ",
  Variable = " ",
  Text = "󰉿",
  Method = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Snippet = "",
  File = "󰈙",
  Reference = "󰈇",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons.lsp[kind] or kind
  end
end

M.diagnostics = {
  Error = "E ",
  Warn = "W ",
  Hint = "H ",
  Info = "I ",
}

M.git = {
  added = "A ",
  modified = "M ",
  removed = "E ",
}

M.logo = [[
  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
]]

return M
