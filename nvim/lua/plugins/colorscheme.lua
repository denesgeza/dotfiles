Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

return {
  -- {{{ nvim-base16
  {
    "RRethy/nvim-base16",
    enabled = Is_Enabled("nvim-base16"),
    lazy = false,
    priority = 1000,

    config = function()
      vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ everforest

  {
    "neanias/everforest-nvim",
    enabled = Is_Enabled("everforest"),
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    enabled = Is_Enabled("gruvbox"),
    lazy = false,
    priority = 1000,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Night-owl
  {
    "oxfist/night-owl.nvim",
    enabled = Is_Enabled("night-owl"),
    lazy = false,
    name = "night-owl",
    priority = 1000,
    opts = {},
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ kanagawa
  {
    "rebelot/kanagawa.nvim",
    enabled = Is_Enabled("kanagawa"),
    lazy = false,
    name = "kanagawa",
    priority = 1000,
    opts = {},
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ catppuccin
  {
    "catppuccin/nvim",
    enabled = Is_Enabled("catppuccin"),
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        term_colors = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = { "bold" },
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          latte = {
            base = "#ffffff",
            lavender = "#000000",
          },
          frappe = {},
          macchiato = {},
          mocha = {},
        },
        integrations = {
          alpha = true,
          cmp = true,
          gitsigns = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          lsp_trouble = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true },
          neotest = true,
          noice = true,
          notify = true,
          nvimtree = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      })
    end,

    -- opts = {
    --   styles = {
    --     comments = { "italic" },
    --     conditionals = { "italic" },
    --     loops = {},
    --     functions = { "bold" },
    --     keywords = {},
    --     strings = {},
    --     variables = {},
    --     numbers = {},
    --     booleans = {},
    --     properties = {},
    --     types = {},
    --     operators = {},
    --   },
    --   color_overrides = {
    --     latte = {
    --       base = "#ffffff",
    --       mantle = "#ffffff",
    --     },
    --     frappe = {},
    --     macchiato = {},
    --     mocha = {},
    --   },
    --   integrations = {
    --     alpha = true,
    --     cmp = true,
    --     gitsigns = true,
    --     illuminate = true,
    --     indent_blankline = { enabled = true },
    --     lsp_trouble = true,
    --     mini = true,
    --     native_lsp = {
    --       enabled = true,
    --       underlines = {
    --         errors = { "undercurl" },
    --         hints = { "undercurl" },
    --         warnings = { "undercurl" },
    --         information = { "undercurl" },
    --       },
    --     },
    --     navic = { enabled = true },
    --     neotest = true,
    --     noice = true,
    --     notify = true,
    --     nvimtree = true,
    --     semantic_tokens = true,
    --     telescope = true,
    --     treesitter = true,
    --     which_key = true,
    --   },
    -- },
  },
  -- ----------------------------------------------------------------------- }}}
}
