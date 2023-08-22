local Customize = {}

Customize = {
  -- {{{ Transparency
  transparency = true,
  -- ------------------------------------------------------------------------- }}}
  plugins = {
    -- {{{ Builtins
    ["neodev.nvim"] = { enabled = true },
    ["telescope.nvim"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["bufferline"] = { enabled = true },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["notify"] = { enabled = true, defaults = false },
    ["lualine"] = { enabled = true, defaults = false },
    ["gitsigns"] = { enabled = true, defaults = true },
    ["null-ls"] = { enabled = true },
    ["dap"] = { enabled = false },
    ["mini.hipatterns"] = { enabled = true },
    ["neo-tree"] = { enabled = true },
    ["Copilot"] = { enabled = true },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Utilities
    ["telescope-file-browser"] = { enabled = false },
    ["toggleterm.nvim"] = { enabled = true },
    ["outline"] = { enabled = false },
    ["vim-visual-multi"] = { enabled = false },
    ["multicursors-lua"] = { enabled = true },
    ["tmux-navigator"] = { enabled = false },
    ["ufo"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["oil"] = { enabled = false },
    ["todo-comments.nvim"] = { enabled = true },
    ["dadbod"] = { enabled = false },
    ["better-escape"] = { enabled = false },
    ["typescript-tools"] = { enabled = true },
    ["pretty-fold"] = { enabled = false },
    ["headlines"] = { enabled = false },
    ["BufferTabs"] = { enabled = false },
    ["lsp_lines"] = { enabled = true },
    ["mini.clue"] = { enabled = false },
    ["mini.statusline"] = { enabled = false },
    ["fzf-lua"] = { enabled = false },
    ["compiler.nvim"] = { enabled = false },
    ["bigfile"] = { enabled = true },
    ["tabout"] = { enabled = false },
    -- CMP sources
    ["cmp_bootstrap"] = { enabled = false },
    -- AI
    ["Codeium"] = { enabled = false },
    ["TabNine"] = { enabled = false },
    ["ChatGPT"] = { enabled = false },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = true },
    ["kanagawa"] = { enabled = false, defaults = true },
    ["tokyonight"] = { enabled = true },
    ["nvim-base16"] = { enabled = false },
    ["everforest"] = { enabled = false },
    ["gruvbox"] = { enabled = true },
    ["night-owl"] = { enabled = false },
    ["github"] = { enabled = false },
    ["transparent"] = { enabled = false },
    -- ------------------------------------------------------------------------- }}}
  },
}
-- -- {{{ Telescope customization
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
  -- ------------------------------------------------------------------------- }}}
}

return Customize
