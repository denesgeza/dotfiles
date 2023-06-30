local Customize = {}

Customize = {
  -- {{{ Transparency in themes
  transparency = true,
  -- ------------------------------------------------------------------------- }}}
  plugins = {
    -- {{{ Builtins
    ["telescope.nvim"] = { enabled = true },
    ["telescope-fzf-native.nvim"] = { enabled = true },
    ["bufferline"] = { enabled = true },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["notify"] = { enabled = true, defaults = false },
    ["lualine"] = { enabled = true },
    ["gitsigns"] = { enabled = true, defaults = false },
    ["lspconfig"] = { enabled = true },
    ["null-ls"] = { enabled = true },
    ["mason-nvim-dap"] = { enabled = false },
    ["mini.hipatterns"] = { enabled = true },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Utilities
    ["telescope-frecency.nvim"] = { enabled = true },
    ["toggleterm.nvim"] = { enabled = true },
    ["outline"] = { enabled = true },
    ["multicursor"] = { enabled = true },
    ["tmux-navigator"] = { enabled = true },
    ["ufo"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["oil"] = { enabled = true },
    ["ranger"] = { enabled = false },
    ["todo-comments.nvim"] = { enabled = true },
    ["mini.jump"] = { enabled = false },
    ["hardtime"] = { enabled = false },
    ["dadbod"] = { enabled = false },
    ["themery"] = { enabled = true },
    ["better-escape"] = { enabled = true },
    ["typescript-tools"] = { enabled = true },
    ["pretty-fold"] = { enabled = true },
    ["headlines"] = { enabled = true },
    ["cmp_bootstrap"] = { enabled = false },
    -- TO TEST
    ["harpoon"] = { enabled = false },
    -- ------------------------------------------------------------------------- }}}
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = true },
    ["nvim-base16"] = { enabled = false },
    ["everforest"] = { enabled = false },
    ["gruvbox"] = { enabled = true },
    ["night-owl"] = { enabled = false },
    ["kanagawa"] = { enabled = true, defaults = true },
    ["github"] = { enabled = false },
    ["transparent"] = { enabled = false },
    ["rose-pine"] = { enabled = true },
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
      path_display = { "smart" },
      cwd = "~/.config/nvim",
      prompt = "~ dotfiles ~",
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

  -- require("telescope.builtin").find_files({
  --   prompt_title = " Find Files",
  --   results_title = "Results",
  --   path_display = { "smart" },
  --   layout_strategy = "horizontal",
  --   layout_config = { preview_width = 0.65, width = 0.75 },
  --   file_ignore_patterns = {
  --     "venv/",
  --     "node_modules/",
  --   },
  -- })
  -- end,

  -- TODO: Add ignore patterns for folke/todo-comments, delete the function
  find_todos = function()
    require("telescope.builtin").grep_string({
      prompt_title = " Find TODOs",
      prompt_prefix = " ",
      results_title = "TODOs",
      path_display = { "smart" },
      -- search = {
      --   "TODO",
      --   "NOTES",
      --   "FIXME",
      --   "BUG",
      --   "WARN",
      --   "FIX",
      --   "WARN:",
      -- },
      search = "TODO",
      layout_strategy = "horizontal",
      layout_config = { preview_width = 0.65, width = 0.75 },
      file_ignore_patterns = {
        "venv/",
        "node_modules/",
        "*/vendor/*",
      },
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

  vertical = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "vertical", size = 80 })
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
