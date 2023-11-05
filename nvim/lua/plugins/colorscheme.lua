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
          lotus = {
            ["@type.rust"] = { fg = "#a09cac" },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          -- Pmenu = { bg = "#22252A", fg = "#C5CDD9" },
          -- PMenuSel = { bg = "#aaafff", fg = "#000000", italic = true, bold = true },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          FloatShadow = { bg = "none" },
          FloatShadowThrough = { bg = "none" },
          TelescopeBorder = { bg = "none" },
          DjangoVarBlock = { fg = "#7FB4CA" },
          DjangoTagBlock = { fg = "#7FB4CA" },
          ["@keyword.operator"] = { fg = theme.syn.operator, italic = true },
          ["@string.documentation.python"] = { link = "Comment" },
          ["@tag.attribute"] = { italic = true },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          IlluminatedWordRead = { fg = theme.syn.statement, italic = true, underline = true },
          IlluminatedWordWrite = { fg = theme.syn.statement, italic = true, underline = true },
          IlluminatedWordText = { fg = theme.syn.statement, italic = true, underline = true },
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
        local u = require("catppuccin.utils.colors")
        -- Highlight applied to all flavors
        return {
          Pmenu = { bg = "#22252A", fg = "#C5CDD9" },
          PMenuSel = { bg = "#aaafff", fg = "#000000", style = { "bold", "italic" } },
          FlashMatch = { bg = colors.overlay1 },
          LineNr = { fg = colors.overlay1 },
          Comment = { fg = colors.overlay2, style = { "italic" } },
          DiagnosticInfo = { link = "@lsp.type.method" },
          CursorLineNr = { fg = colors.peach, style = { "bold" } },
          CursorLine = {
            bg = u.vary_color(
              { latte = u.lighten(colors.mantle, 0.70, colors.base) },
              u.darken(colors.surface0, 0.64, colors.base)
            ),
          },
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
            CursorLine = { bg = latte.bg_m3, fg = latte.fg_dim },
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
        neotree = true,
        noice = true,
        notify = true,
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
      local palettes = {}
      local specs = {
        all = {
          syntax = {
            keyword = "#d73a49",
            conditional = "magenta.bright",
            number = "orange",
          },
          git = {
            changed = "#ffa261",
          },
        },
        github_dark = {
          syntax = {
            operator = "orange",
          },
        },
      }
      local groups = {
        all = {
          Pmenu = { bg = "#22252A", fg = "#C5CDD9" },
          PMenuSel = { bg = "#aaafff", fg = "#000000", italic = true, bold = true },
          djangoVarBlock = { fg = "#7FB4CA" },
          djangoTagBlock = { fg = "#7FB4CA", italic = true },
          Type = { fg = "#E6C384", italic = true },
          ["@keyword.operator"] = { fg = "#E82424", italic = true },
          ["@string.documentation.python"] = { link = "Comment" },
          ["@tag.attribute"] = { italic = true },
        },
        github_light = {
          Pmenu = { bg = "#ffffff", fg = "#000000" },
          PMenuSel = { bg = "#e5e5e5", fg = "#000000", italic = true, bold = true },
          DjangoVarBlock = { fg = "#7FB4CA" },
          DjangoTagBlock = { fg = "#7FB4CA", italic = true },
          DjangoStatement = { fg = "#7FB4CA", italic = true },
          ["@tag.attribute"] = { italic = true },
        },
      }
      require("github-theme").setup({
        options = {
          transparent = Customize.transparency,
          styles = {
            comments = "italic",
            keywords = "italic,bold",
            functions = "italic",
            variables = "",
          },
        },
        palettes = palettes,
        specs = specs,
        groups = groups,
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ tokyonight
  {
    "folke/tokyonight.nvim",
    enabled = Is_Enabled("tokyonight"),
    priority = 1000,
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
  -- {{{ nvim-base16
  {
    "RRethy/nvim-base16",
    enabled = Is_Enabled("base16"),
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
    end,
  },
  ----------------------------------------------------------------------- }}}
  -- {{{ Default colorscheme
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = Customize.colorscheme },
  },
  -- ----------------------------------------------------------------------- }}}
}
