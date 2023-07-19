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
      require("base16-colorscheme").with_config({
        telescope = false,
        indentblankline = true,
        notify = true,
        ts_rainbow = true,
        cmp = true,
        illuminate = true,
      })
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
    opts = {
      transparent = Customize.transparency,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
              float = { bg = "none" },
            },
          },
        },
      },
      overrides = function(colors)
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
        }
      end,
    },
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
        transparent_background = Customize.transparency,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          functions = { "italic" },
          keywords = { "italic" },
          strings = {},
          variables = { "italic" },
          numbers = {},
          booleans = {},
          properties = {},
          types = { "bold" },
          operators = {},
        },
        color_overrides = {
          latte = {
            -- base = "#ffffff",
            -- lavender = "#000000",
          },
          frappe = {},
          macchiato = {},
          mocha = {},
        },
        highlight_overrides = {
          all = function(colors)
            return {
              CmpBorder = { fg = "#3e4145" },
            }
          end,
          latte = function(latte)
            return {
              Normal = { fg = latte.base },
            }
          end,
          frappe = function(frappe)
            return {
              ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
            }
          end,
          macchiato = function(macchiato)
            return {
              LineNr = { fg = macchiato.overlay1 },
            }
          end,
          mocha = function(mocha)
            return {
              -- Comment = { fg = mocha.flamingo, style = { "italic" } },
              -- ["@comment"] = { fg = mocha.surface2, style = { "italic" } },
            }
          end,
        },
        integrations = {
          alpha = true,
          cmp = true,
          dap = true,
          dashboard = true,
          headlines = true,
          symbols_outline = true,
          gitsigns = true,
          illuminate = true,
          indent_blankline = { enabled = true, colored_indent_levels = true },
          lsp_trouble = true,
          mini = true,
          mason = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
            inlay_hints = { background = true },
          },
          navic = { enabled = true, custom_bg = "NONE" },
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          nvimtree = true,
          flash = true,
          semantic_tokens = true,
          telescope = {
            style = "classic",
          },
          treesitter = true,
          which_key = true,
        },
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ github
  {
    "projekt0n/github-nvim-theme",
    enabled = Is_Enabled("github"),
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      vim.cmd("colorscheme github_dark")
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ tokyonight
  {
    "folke/tokyonight.nvim",
    enabled = Is_Enabled("tokyonight"),
    opts = {
      style = "storm",
      light_style = "day",
      transparent = Customize.transparency,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { italic = true },
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ transparent
  {
    "xiyaowong/transparent.nvim",
    enabled = Is_Enabled("transparent"),
    lazy = false,
    priority = 1000,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ rose-pine
  {
    "rose-pine/neovim",
    enabled = Is_Enabled("rose-pine"),
    lazy = false,
    priority = 1000,
    name = "rose-pine",
  },
  -- ----------------------------------------------------------------------- }}}
}
