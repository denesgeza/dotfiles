Is_Enabled = require("config.functions").is_enabled

return {
  "catppuccin/nvim",
  enabled = Is_Enabled("catppuccin"),
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = Settings.transparency,
    term_colors = true,
    dim_inactive = {
      enabled = false,
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
      types = { "bold" },
      operators = { "bold" },
    },
    -- color_overrides = {},
    custom_highlights = function(colors)
      local u = require("catppuccin.utils.colors")
      --   -- Highlight applied to all flavors
      return {
        --     Pmenu = { bg = "#22252A", fg = "#C5CDD9" },
        --     PMenuSel = { bg = "#aaafff", fg = "#000000", style = { "bold", "italic" } },
        --     FlashMatch = { bg = colors.overlay1 },
        --     LineNr = { fg = colors.overlay1 },
        --     Comment = { fg = colors.overlay2, style = { "italic" } },
        --     DiagnosticInfo = { link = "@lsp.type.method" },
        --     CursorLineNr = { fg = colors.peach, style = { "bold" } },
        --     CursorLine = {
        --       bg = u.vary_color(
        --         { latte = u.lighten(colors.mantle, 0.70, colors.base) },
        --         u.darken(colors.surface0, 0.64, colors.base)
        --       ),
        --     },
        --     ["@comment"] = { fg = colors.overlay2, style = { "italic" } },
        ["@parameter"] = { style = { "italic" } },
        --     ["@string.documentation.python"] = { fg = colors.overlay2, style = { "italic" } },
        --     ["@variable.builtin.python"] = { fg = colors.red, style = { "italic" } },
        --     ["@variable.htmldjango"] = { fg = colors.red },
        --     ["@punctuation.bracket.htmldjango"] = { fg = colors.yellow },
        --     ["@property.typescript"] = { style = { "italic" } },
        --     ["@function.htmldjango"] = { style = { "italic" } },
        --     ["@function.builtin"] = { fg = "#fab388", bold = false },
        --     ["@lsp.type.method.python"] = { fg = "#FAB388", bold = false },
        --     DjangoVarBlock = { fg = colors.sky },
        --     DjangoTagBlock = { fg = colors.sky },
        --     DjangoStatement = { fg = colors.pink },
        --     Function = { fg = "#49b4fb", bold = false },
        --     -- ["@attribute.python"] = { style = { "italic" } },
        --     ["@method.call.python"] = { fg = colors.blue, style = { "italic" } },
        --     -- StatusLine = { bg = colors.none },
        --     FloatBorder = { bg = colors.none },
        --     FloatTitle = { bg = colors.none },
        --     FloatShadow = { bg = colors.none },
        --     FloatShadowThrough = { bg = colors.none },
      }
    end,
    -- highlight_overrides = {
    --   -- Highlight per specific flavor
    --   latte = function(latte)
    --     return {
    --       Normal = { fg = latte.base },
    --       ["@variable"] = { fg = latte.text },
    --       ["@property"] = { fg = latte.text, style = { "bold" } },
    --       ["@keyword.function"] = { fg = latte.red },
    --       CursorLine = { bg = latte.bg_m3, fg = latte.fg_dim },
    --       String = { fg = "#033d8b" },
    --       IlluminatedWordRead = { fg = latte.mauve, style = { "bold", "underline" } },
    --       IlluminatedWordWrite = { fg = latte.mauve, style = { "bold", "underline" } },
    --       IlluminatedWordText = { fg = latte.mauve, style = { "bold", "underline" } },
    --     }
    --   end,
    --   frappe = function(frappe)
    --     return {
    --       ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
    --     }
    --   end,
    --   macchiato = function(macchiato)
    --     return {
    --       ["@comment"] = { fg = macchiato.surface2, style = { "italic" } },
    --     }
    --   end,
    --   mocha = function(mocha)
    --     return {
    --       ["@comment"] = { fg = mocha.overlay2, style = { "italic" } },
    --     }
    --   end,
    -- },
    integrations = {
      blink_cmp = true,
      grug_far = true,
      mini = { enabled = true, indentscope_color = "" },
      neotree = true,
      treesitter = true,
      render_markdown = true,
      snacks = { enabled = true, indent_scope_color = "" },
      lsp_trouble = true,
      which_key = true,
    },
  },
}
