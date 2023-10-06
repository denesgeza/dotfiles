local Customize = {}

Customize = {
  -- {{{ Colorscheme
  transparency = true, ---@type boolean
  colorscheme = "kanagawa", ---@type "kanagawa" | "catppuccin" | "tokyonight" | "gruvbox" | "github"
  -- }}}
  -- {{{ Plugins
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- {{{ Builtins
    ["telescope"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["notify"] = { enabled = true },
    ["gitsigns"] = { enabled = true, defaults = false },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["lualine"] = { enabled = true, defaults = false },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["indent-blankline"] = { enabled = true },
    ["conform"] = { enabled = true },
    ["Copilot"] = { enabled = true },
    -- }}}
    -- {{{ Utilities
    ["toggleterm.nvim"] = { enabled = true },
    ["typescript-tools"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["outline"] = { enabled = false },
    ["multicursors-lua"] = { enabled = true },
    ["tmux-navigator"] = { enabled = false },
    ["dadbod"] = { enabled = true },
    ["compiler.nvim"] = { enabled = false },
    ["bigfile"] = { enabled = false },
    ["speedtyper"] = { enabled = true },
    ["harpoon"] = { enabled = true },
    ["mini.clue"] = { enabled = false },
    ["nvim-lint"] = { enabled = false },
    ["neoscroll"] = { enabled = true },
    ["nerdy"] = { enabled = false }, -- Nerd Font icons lookup
    ["puppeteer"] = { enabled = true }, -- Auto f-strings
    ["symbol-usage"] = { enabled = false },
    ["zen-mode"] = { enabled = false },
    ["hardtime"] = { enabled = true },
    -- }}}
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = true },
    ["kanagawa"] = { enabled = true, defaults = true },
    ["tokyonight"] = { enabled = false },
    ["gruvbox"] = { enabled = false },
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
