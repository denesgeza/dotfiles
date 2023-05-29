local Customize = {}

Customize = {
  plugins = {
    -- {{{ Builtins
    ["neo-tree.nvim"] = { enabled = true, defaults = true },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["notify"] = { enabled = true, defaults = false },
    ["lualine"] = { enabled = true, defaults = false },
    ["gitsigns"] = { enabled = true, defaults = false },
    ["flit.nvim"] = { enabled = false },
    ["leap.nvim"] = { enabled = false },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Utilities
    ["toggleterm.nvim"] = { enabled = true },
    ["outline"] = { enabled = true },
    ["multicursor"] = { enabled = true },
    ["markdown-preview.nvim"] = { enabled = false },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Finders
    ["ranger"] = { enabled = true },
    ["hop"] = { enabled = true },
    ["telescope.nvim"] = { enabled = true },
    ["telescope-fzf-native.nvim"] = { enabled = true },
    ["todo-comments.nvim"] = { enabled = true },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Colorscheme
    ["nvim-base16"] = { enabled = true },
    ["everforest"] = { enabled = true },
    ["gruvbox"] = { enabled = false },
    ["night-owl"] = { enabled = false },
    ["kanagawa"] = { enabled = true },
    -- ------------------------------------------------------------------------- }}}
  },
}

-- {{{ Toggle terminals
Customize.toggleterm = {

  float = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "float" })
    return t:toggle()
  end,

  horizontal = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "horizontal", size = 12 })
    return t:toggle()
  end,

  lazygit = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "lazygit", direction = "float" })
    return t:toggle()
  end,

  neomutt = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "neomutt", direction = "float" })
    return t:toggle()
  end,

  ranger = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "ranger", direction = "float" })
    return t:toggle()
  end,

  python = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "python3", hidden = true })
    return t:toggle()
  end,

  node = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "node", hidden = true })
    return t:toggle()
  end,

  htop = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
    return t:toggle()
  end,
  -- ------------------------------------------------------------------------- }}}
}

return Customize
