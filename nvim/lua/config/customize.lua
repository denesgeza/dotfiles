local Customize = {}

Customize = {
  -- {{{ Transparency
  transparency = true, ---@type boolean
  -- }}}
  -- {{{ Plugins
  plugins = {
    -- {{{ Builtins
    ["neodev.nvim"] = { enabled = true },
    ["neo-tree"] = { enabled = true },
    ["telescope"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["notify"] = { enabled = true },
    ["gitsigns"] = { enabled = true, defaults = false },
    ["noice.nvim"] = { enabled = true },
    ["lualine"] = { enabled = true, defaults = false },
    ["nvim-cmp"] = { enabled = true },
    ["null-ls"] = { enabled = true },
    -- }}}
    -- {{{ Utilities
    ["lsp-zero"] = { enabled = true },
    ["toggleterm.nvim"] = { enabled = true },
    ["outline"] = { enabled = false },
    ["multicursors-lua"] = { enabled = true },
    ["tmux-navigator"] = { enabled = true },
    ["ufo"] = { enabled = false },
    ["neorg"] = { enabled = true },
    ["dadbod"] = { enabled = false },
    ["typescript-tools"] = { enabled = true },
    ["compiler.nvim"] = { enabled = false },
    ["mini.clue"] = { enabled = false },
    ["bigfile"] = { enabled = true },
    ["efm"] = { enabled = false },
    ["speedtyper"] = { enabled = true },
    -- AI
    ["Copilot"] = { enabled = true },
    -- }}}
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = true },
    ["kanagawa"] = { enabled = true, defaults = true },
    ["tokyonight"] = { enabled = false },
    ["everforest"] = { enabled = false },
    ["gruvbox"] = { enabled = true },
    ["github"] = { enabled = false },
    -- }}}
  },
}
-- }}}
-- {{{ Telescope
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

  edit_neovim = function()
    require("telescope.builtin").git_files({
      -- shorten_path = true,
      prompt_title = "~ dotfiles ~",
      path_display = { "smart" },
      cwd = "~/.config/nvim",
      height = 10,

      layout_strategy = "horizontal",
      layout_options = {
        preview_width = 0.75,
      },
    })
  end,

  find_files = function()
    local opts = {
      results_title = "Results",
      path_display = { "smart" },
      layout_strategy = "horizontal",
      layout_config = { preview_width = 0.5, width = 0.75 },
      file_ignore_patterns = {
        "venv/",
        "node_modules/",
        "vendor/",
      },
    } -- define here if you want to define something
    vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
      opts.prompt_title = " Git Files"
      opts.prompt_prefix = "  "
      opts.results_title = " Repo Files"
      require("telescope.builtin").git_files(opts)
    else
      opts.prompt_title = " Find Files"
      require("telescope.builtin").find_files(opts)
    end
  end,
}

-- }}}
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

  vertical = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "vertical", size = 200 })
    return t:toggle()
  end,

  lazygit = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "lazygit", direction = "float" })
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
  -- }}}
}

return Customize
