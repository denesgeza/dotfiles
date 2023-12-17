local Customize = {}

Customize = {
  -- {{{ Settings
  transparency = false, ---@type boolean
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  ---@type "kanagawa" | "catppuccin" | "tokyonight" | "gruvbox" | "github" | "base16" | "night-owl" | "onedark" | "default"
  colorscheme = "default",
  background = "light", ---@type "light" | "dark"
  -- }}}
  -- {{{ Plugins
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- {{{ Builtins
    ["neo-tree"] = { enabled = true },
    ["bufferline"] = { enabled = false },
    ["which-key"] = { enabled = true },
    ["nvim-notify"] = { enabled = true },
    ["noice.nvim"] = { enabled = false, defaults = false },
    ["lualine"] = { enabled = false, defaults = false },
    ["luasnip"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["indent-blankline"] = { enabled = false },
    ["conform"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["Copilot"] = { enabled = true },
    ["Copilot-cmp"] = { enabled = false },
    ["fidget.nvim"] = { enabled = true },
    ["gitsigns.nvim"] = { enabled = true },
    ["mini.surround"] = { enabled = false },
    -- }}}
    -- {{{ Utilities
    ["toggleterm.nvim"] = { enabled = true },
    ["neorg"] = { enabled = false },
    ["tmux-navigator"] = { enabled = false },
    ["dadbod"] = { enabled = true },
    ["bigfile"] = { enabled = false },
    ["harpoon"] = { enabled = false },
    ["mini.clue"] = { enabled = false },
    ["mini.pick"] = { enabled = false },
    ["neoscroll"] = { enabled = true },
    ["nerdy"] = { enabled = true }, -- Nerd Font icons lookup
    ["hardtime"] = { enabled = false },
    ["lsp-timeout"] = { enabled = false },
    ["refactoring"] = { enabled = false },
    ["sttusline"] = { enabled = false },
    ["octo"] = { enabled = true },
    ["vim-visual-multi"] = { enabled = true },
    ["orgmode"] = { enabled = false },
    ["vim-doge"] = { enabled = false },
    -- TS
    ["typescript-tools"] = { enabled = true },
    ["tsc"] = { enabled = false },
    ["cmp-bootstrap"] = { enabled = false },
    -- PYTHON
    ["compiler.nvim"] = { enabled = false },
    ["molten.nvim"] = { enabled = false },
    ["puppeteer"] = { enabled = false }, -- Auto f-strings
    -- RUST
    ["rustacean"] = { enabled = false },
    -- }}}
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = true },
    ["kanagawa"] = { enabled = true },
    ["tokyonight"] = { enabled = false },
    ["gruvbox"] = { enabled = false },
    ["github"] = { enabled = false },
    ["base16"] = { enabled = false },
    ["night-owl"] = { enabled = false },
    ["onedark"] = { enabled = false },
    ["solarized-osaka"] = { enabled = false },
    -- }}}
  },
}
-- }}}
-- {{{ Icons
Customize.icons = {
  otter = "🦦",
  Copilot = " ",
  nvim_lsp = " ",
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
  neorg = "󰄴 ",
  orgmode = "󰄴 ",
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
    local t = Terminal:new({ dir = "git_dir", direction = "vertical", size = 40, name = "Term" })
    return t:toggle()
  end,

  tab = function()
    local Terminal = require("toggleterm.terminal").Terminal
    -- local t = Terminal:new({ dir = "~/Desktop", direction = "tab", size = 40 })
    local t = Terminal:new({ direction = "tab", size = 40 })
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
