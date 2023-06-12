local Customize = {}

Customize = {
  plugins = {
    -- {{{ Builtins
    ["telescope.nvim"] = { enabled = true },
    ["telescope-fzf-native.nvim"] = { enabled = true },
    ["bufferline"] = { enabled = true },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["notify"] = { enabled = true, defaults = true },
    ["lualine"] = { enabled = true, defaults = false },
    ["gitsigns"] = { enabled = true, defaults = false },
    ["flit.nvim"] = { enabled = false },
    ["leap.nvim"] = { enabled = false },
    ["lspconfig"] = { enabled = true },
    ["mason-nvim-dap"] = { enabled = true },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Utilities
    ["toggleterm.nvim"] = { enabled = true },
    ["outline"] = { enabled = true },
    ["multicursor"] = { enabled = true },
    ["markdown-preview.nvim"] = { enabled = false },
    ["tmux-navigator"] = { enabled = true },
    ["ufo"] = { enabled = false },
    ["neorg"] = { enabled = true },
    ["oil"] = { enabled = true },
    ["ranger"] = { enabled = true },
    ["todo-comments.nvim"] = { enabled = true },
    ["mini.jump"] = { enabled = true },
    ["hardtime"] = { enabled = false },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = true },
    ["nvim-base16"] = { enabled = false },
    ["everforest"] = { enabled = false },
    ["gruvbox"] = { enabled = false },
    ["night-owl"] = { enabled = false },
    ["kanagawa"] = { enabled = true, defaults = true },
    ["github"] = { enabled = true },
    -- ------------------------------------------------------------------------- }}}
  },
}

-- {{{ Telescope customization
Customize.telescope = {
  file_browser = function()
    require("telescope").extensions.file_browser.file_browser({
      prompt_title = " File Browser",
      hidden = true,
      path_display = { "smart" },
      layout_strategy = "horizontal",
      layout_config = { preview_width = 0.5, width = 0.75 },
    })
  end,

  commands = function()
    require("telescope.builtin").commands({
      prompt_title = "Commands",
      layout_strategy = "horizontal",
      -- layout_config = { preview_width = 0.5, width = 0.75 },
    })
  end,
}

-- ------------------------------------------------------------------------- }}}
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

  btop = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "btop", hidden = true, direction = "float" })
    return t:toggle()
  end,
  -- ------------------------------------------------------------------------- }}}
}

return Customize
