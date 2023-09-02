Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    enabled = Is_Enabled("gruvbox"),
    lazy = false,
    priority = 1000,
    opts = {
      transparent_mode = Customize.transparency,
      ---@type "soft" | "hard" | ""
      contrast_dark = "hard", ---@type "soft" | "hard" | ""
      dim_inactive = false, ---@type boolean
      invert_signs = false, ---@type boolean
      invert_tabline = true, ---@type boolean
      overrides = {
        ["@string.documentation.python"] = { link = "Comment" },
        FloatShadow = { bg = "None", blend = 80 },
        FloatShadowThrough = { bg = "None", blend = 100 },
      },
    },
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
      functionStyle = { italic = true },
      typeStyle = { italic = true },
      dim_inactive = true,
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
          FloatShadow = { bg = "none" },
          FloatShadowThrough = { bg = "none" },
          TelescopeBorder = { bg = "none" },
          ["@string.documentation.python"] = { link = "Comment" },
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
    opts = {
      flavour = "mocha",
      transparent_background = Customize.transparency,
      term_colors = true,
      -- dim_inactive = {
      --   enabled = true,
      --   shade = "dark",
      --   percentage = 0.15,
      -- },
      styles = {
        comments = { "italic" },
        conditionals = { "bold", "italic" },
        loops = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        strings = {},
        variables = { "italic" },
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = { "bold" },
        operators = {},
      },
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          MyPMenu = { bg = colors.none },
          MyPMenuSel = { bg = "#aaafff", fg = "#000000", bold = true, italic = true },
        }
      end,
      highlight_overrides = {
        all = function(colors)
          return {}
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
            LineNr = { fg = mocha.overlay1 },
            Comment = { fg = mocha.overlay2, style = { "italic" } },
            ["@comment"] = { fg = mocha.overlay2, style = { "bold", "italic" } },
            ["@string.documentation.python"] = { fg = mocha.overlay2, style = { "italic" } },
            ["@variable.builtin.python"] = { fg = mocha.red },
            -- ["@attribute.python"] = { style = { "italic" } },
            ["@method.call.python"] = { fg = mocha.blue, style = { "bold", "italic" } },
          }
        end,
      },
      integrations = {
        alpha = true,
        aerial = false,
        barbar = false,
        cmp = true,
        dap = true,
        dashboard = true,
        headlines = true,
        symbols_outline = true,
        gitsigns = true,
        illuminate = { enabled = true, lsp = false },
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
          inlay_hints = { background = false },
        },
        navic = { enabled = true, custom_bg = "NONE" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        nvimtree = true,
        overseer = true,
        flash = true,
        semantic_tokens = true,
        telescope = {
          ---@type "classic" | "nvchad" | "none"
          style = "classic",
        },
        treesitter = true,
        which_key = true,
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ github
  {
    "projekt0n/github-nvim-theme",
    enabled = Is_Enabled("github"),
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({})
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
  -- {{{ Default colorscheme
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
  -- ----------------------------------------------------------------------- }}}
}
