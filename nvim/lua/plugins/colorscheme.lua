Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

return {
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
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = 10 }, -- add `blend = vim.o.pumblend` to enable transparency
          -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
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
          StatusLineNC = { bg = theme.ui.bg_p1, blend = 10 },
          StatusLine = { bg = "none" },
          WinSeparator = { link = "Comment" },
        }
      end,
    },
  },
  --  }}}
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
      dim_inactive = {
        enabled = true,
        shade = function()
          if vim.o.background == "dark" then
            return "dark"
          else
            return "light"
          end
        end,
        percentage = 1,
      },
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
          -- StatusLine = { bg = colors.none },
          FloatBorder = { bg = colors.none },
          FloatTitle = { bg = colors.none },
          FloatShadow = { bg = colors.none },
          FloatShadowThrough = { bg = colors.none },
          TelescopeBorder = { bg = colors.none },
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
        aerial = true,
        cmp = true,
        dap = true,
        dashboard = true,
        headlines = true,
        symbols_outline = true,
        gitsigns = true,
        fidget = true,
        illuminate = { enabled = true, lsp = true },
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
          style = "nvchad", ---@type "classic" | "nvchad" | "none"
          enabled = true,
        },
        treesitter = true,
        which_key = true,
      },
    },
  },
  --  }}}
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
            delimiter = "orange",
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
          StatusLineNC = { bg = "NONE" },
          Delimiter = { fg = "#ffa261" },
        },
        github_light = {
          Pmenu = { bg = "#ffffff", fg = "#000000" },
          PMenuSel = { bg = "#e5e5e5", fg = "#000000", italic = true, bold = true },
          DjangoVarBlock = { fg = "#7FB4CA" },
          DjangoTagBlock = { fg = "#7FB4CA", italic = true },
          DjangoStatement = { fg = "#7FB4CA", italic = true },
          ["@tag.attribute"] = { italic = true },
        },
        github_light_default = {
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
          dim_inactive = true,
          styles = {
            comments = "italic",
            keywords = "italic,bold",
            functions = "italic",
            variables = "",
            conditionals = "NONE",
            constants = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
          },
          inverse = {
            visual = false,
            match_paren = false,
            search = true,
          },
          darken = {
            floats = true,
            sidebars = { enabled = true },
          },
        },
        palettes = palettes,
        specs = specs,
        groups = groups,
      })
    end,
  },
  -- }}}
  -- {{{ tokyonight
  {
    "folke/tokyonight.nvim",
    enabled = Is_Enabled("tokyonight"),
    priority = 1000,
    lazy = false,
    opts = {
      style = "storm",
      light_style = "day",
      transparent = Customize.transparency,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true, italic = true },
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      day_brightness = 0.3,
      hide_inactive_statusline = true,
      dim_inactive = true,
      lualine_bold = true,
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end,
      on_highlights = function(highlights, colors) end,
    },
  },
  --  }}}
  -- {{{ rose-pine
  {
    "rose-pine/neovim",
    enabled = Is_Enabled("rose-pine"),
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "auto", ---@type "auto" | "moon" | "dawn" | "main"
      dark_variant = "moon", ---@type "moon" | "main"
      dim_inactive_windows = true,
      extend_background_behind_borders = true,

      styles = {
        bold = true,
        italic = true,
        transparency = Customize.transparency,
      },

      -- Change specific vim highlight groups
      -- https://github.com/rose-pine/neovim/wiki/Recipes
      highlight_groups = {
        ColorColumn = { bg = "rose" },

        -- Blend colours against the "base" background
        CursorLine = { bg = "foam", blend = 10 },

        -- By default each group adds to the existing config.
        -- If you only want to set what is written in this config exactly,
        -- you can set the inherit option:
        ["@keyword.return"] = { fg = "Red", bold = true, inherit = false },
        Constant = { fg = "error" },
        Search = { bg = "gold", inherit = false },
        Keyword = { bold = true, inherit = true },
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "base" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "base" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        StatusLine = { bg = "NONE" },
        StatusLineNC = { fg = "subtle", bg = "NONE", blend = 10 },
      },
    },
  },
  -- }}}
  -- {{{ nvim-tundra
  {
    "sam4llis/nvim-tundra",
    enabled = Is_Enabled("tundra"),
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-tundra").setup({
        transparent_background = Customize.transparency,
        dim_inactive_windows = {
          enabled = false,
          color = nil,
        },
        sidebars = {
          enabled = true,
          color = nil,
        },
        editor = {
          search = {},
          substitute = {},
        },
        syntax = {
          booleans = { bold = true, italic = true },
          comments = { bold = true, italic = true },
          conditionals = {},
          constants = { bold = true },
          fields = {},
          functions = {},
          keywords = {},
          loops = {},
          numbers = { bold = true },
          operators = { bold = true },
          punctuation = {},
          strings = {},
          types = { italic = true },
        },
        diagnostics = {
          errors = {},
          warnings = {},
          information = {},
          hints = {},
        },
        plugins = {
          lsp = true,
          semantic_tokens = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
          cmp = true,
          context = true,
          dbui = true,
          gitsigns = true,
          neogit = true,
          textfsm = true,
        },
        overwrite = {
          colors = {},
          highlights = {
            ["@namespace"] = { fg = "#ffcc00" },
          },
        },
      })
      vim.g.tundra_biome = "arctic" ---@type 'arctic' | 'jungle'
      vim.opt.background = "dark"
    end,
  },
  -- }}}
  -- {{{ Default colorscheme
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    enabled = Is_Enabled("cyberdream"),
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = Customize.transparency,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      })
    end,
  },
  -- }}}
  -- {{{ Default colorscheme
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = Customize.colorscheme },
  },
  -- }}}
}
