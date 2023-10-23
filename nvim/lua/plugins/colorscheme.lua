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
      undercurl = true, ---@type boolean
      underline = true, ---@type boolean
      bold = true, ---@type boolean
      italic = {
        strings = false, ---@type boolean
        comments = true, ---@type boolean
        operators = false, ---@type boolean
        folds = true, ---@type boolean
        functions = true, ---@type boolean
        keywords = true, ---@type boolean
        variables = true, ---@type boolean
      },
      strikethrough = true, ---@type boolean
      inverse = true, ---@type boolean -- invert bg for search, diffs, statuslines & errors
      invert_selection = false, ---@type boolean
      contrast_dark = "hard", ---@type "soft" | "hard" | ""
      dim_inactive = false, ---@type boolean
      invert_signs = true, ---@type boolean
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
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
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
        local theme = colors.theme
        return {
          -- LuaLine
          lualine_a_normal = { bg = "#658594" },
          MyPMenu = { bg = colors.none, blend = 100 },
          MyPMenuSel = { bg = "#aaafff", fg = "#000000", italic = true, bold = true },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          FloatShadow = { bg = "none" },
          FloatShadowThrough = { bg = "none" },
          TelescopeBorder = { bg = "none" },
          DjangoVarBlock = { fg = "#7FB4CA" },
          DjangoTagBlock = { fg = "#7FB4CA" },
          ["@string.documentation.python"] = { link = "Comment" },
          -- From the documentation
          -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          -- PmenuSbar = { bg = theme.ui.bg_m1 },
          -- PmenuThumb = { bg = theme.ui.bg_p2 },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          IlluminatedWordRead = { fg = "#FF9E3B", italic = true, underline = true },
          IlluminatedWordWrite = { fg = "#FF9E3B", italic = true, underline = true },
          IlluminatedWordText = { fg = "#FF9E3B", italic = true, underline = true },
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
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = { "bold", "italic" },
        operators = {},
      },
      color_overrides = {},
      custom_highlights = function(colors)
        -- Highlight applied to all flavors
        return {
          MyPMenu = { bg = colors.none },
          MyPMenuSel = { bg = "#aaafff", fg = "#000000", style = { "bold", "italic" } },
          FlashMatch = { bg = colors.overlay1 },
          LineNr = { fg = colors.overlay1 },
          Comment = { fg = colors.overlay2, style = { "italic" } },
          DiagnosticInfo = { link = "@lsp.type.method" },
          CursorLineNr = { fg = colors.peach, style = { "bold" } },
          ["@comment"] = { fg = colors.overlay2, style = { "italic" } },
          ["@parameter"] = { style = { "italic" } },
          ["@string.documentation.python"] = { fg = colors.overlay2, style = { "italic" } },
          ["@variable.builtin.python"] = { fg = colors.red, style = { "italic" } },
          ["@variable.htmldjango"] = { fg = colors.red },
          ["@punctuation.bracket.htmldjango"] = { fg = colors.yellow },
          ["@property.typescript"] = { style = { "italic" } },
          ["@function.htmldjango"] = { style = { "italic" } },
          DjangoVarBlock = { fg = colors.sky },
          DjangoTagBlock = { fg = colors.sky },
          DjangoStatement = { fg = colors.pink },
          -- ["@attribute.python"] = { style = { "italic" } },
          ["@method.call.python"] = { fg = colors.blue, style = { "italic" } },
          IlluminatedWordRead = { fg = "#FF9E3B", style = { "bold", "underline" } },
          IlluminatedWordWrite = { fg = "#FF9E3B", style = { "bold", "underline" } },
          IlluminatedWordText = { fg = "#FF9E3B", style = { "bold", "underline" } },
        }
      end,
      highlight_overrides = {
        -- Highlight per specific flavor
        latte = function(latte)
          return {
            Normal = { fg = latte.base },
            ["@variable"] = { fg = latte.text },
            ["@property"] = { fg = latte.text, style = { "bold" } },
            ["@keyword.function"] = { fg = latte.red },
            String = { fg = "#033d8b" },
            IlluminatedWordRead = { fg = latte.mauve, style = { "bold", "underline" } },
            IlluminatedWordWrite = { fg = latte.mauve, style = { "bold", "underline" } },
            IlluminatedWordText = { fg = latte.mauve, style = { "bold", "underline" } },
          }
        end,
        frappe = function(frappe)
          return {
            ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
          }
        end,
        macchiato = function(macchiato)
          return {
            ["@comment"] = { fg = macchiato.surface2, style = { "italic" } },
          }
        end,
        mocha = function(mocha)
          return {
            ["@comment"] = { fg = mocha.overlay2, style = { "italic" } },
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
        illuminate = { enabled = false, lsp = false },
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = true,
        },
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
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
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
  { "LazyVim/LazyVim", opts = { colorscheme = Customize.colorscheme } },
  -- ----------------------------------------------------------------------- }}}
}
