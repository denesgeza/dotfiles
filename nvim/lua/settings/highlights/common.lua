-- Highlights groups for all colorschemes

local get_color = require("config.functions").get_color

local H = {}
local c = {}

function H.set_highlights()
  if vim.g.colors_name == "default" then
    require("settings.highlights.default").default_colorscheme()
  end

  c.normal_bg = get_color("Normal", "bg")
  c.normal_fg = get_color("Normal", "fg")
  c.statusline_bg = get_color("StatusLine", "bg")
  c.comment_fg = get_color("Comment", "fg")
  c.comment_bg = get_color("Comment", "bg")
  c.cursoline_bg = get_color("CursorLine", "bg")
  c.boolean_fg = get_color("Boolean", "fg")
  c.pmenusel_bg = get_color("PmenuSel", "bg")
  c.pmenusel_fg = get_color("PmenuSel", "fg")
  c.nontext_fg = get_color("NonText", "fg")
  c.border_fg = get_color("FloatBorder", "fg")

  local highlights = {
    Normal = {
      transparent = {
        dark = { fg = c.normal_fg, bg = "NONE" },
      },
    },
    NormalFloat = {
      transparent = {
        light = { bg = c.normal_bg, fg = c.normal_fg },
        dark = { fg = c.normal_fg, bg = "NONE" },
      },
      opaque = {
        light = { bg = c.normal_bg, fg = c.normal_fg },
        dark = { bg = c.normal_bg, fg = c.normal_fg },
      },
    },
    StatusLine = {
      transparent = { bg = "NONE" },
      opaque = { bg = "NONE" },
    },
    StatusLineNC = {
      transparent = { dark = { bg = c.cursoline_bg, blend = 50, fg = c.nontext_fg } },
      opaque = { bg = c.normal_bg },
    },
    FloatBorder = {
      transparent = {
        dark = { fg = c.border_fg, bg = "NONE" },
      },
    },
    FloatTitle = {
      transparent = {
        dark = { bg = "NONE" },
      },
    },
    Comment = {
      transparent = {
        light = { fg = c.comment_fg, bg = c.normal_bg, italic = true, blend = 95 },
        dark = { fg = c.comment_fg, bg = "NONE", italic = true },
      },
      opaque = { fg = c.comment_fg, bg = c.normal_bg, italic = true },
    },
    WinSeparator = { link = "Comment" },
    CursorLine = { transparent = { dark = { bg = c.cursoline_bg, blend = 50 } } },
    Pmenu = {
      transparent = { light = { link = "Normal" }, dark = { fg = c.normal_fg, bg = "NONE", blend = 0 } },
      -- opaque = { link = "Normal" },
    },
    PmenuSel = {
      transparent = { dark = { fg = c.normal_fg, bg = c.cursoline_bg, blend = 0, reverse = true } },
      -- opaque = { fg = c.pmenusel_fg, bg = c.pmenusel_bg, reverse = true, blend = 0 },
    },
    PmenuMatchSel = {
      transparent = { dark = { fg = c.normal_fg, bg = "#908caa", blend = 0, reverse = true } },
      opaque = { fg = "Red", bg = c.pmenusel_bg, reverse = true, blend = 0 },
    },
    Folded = {
      transparent = { dark = { fg = c.comment_fg, bg = "NONE", blend = 0 } },
      opaque = { link = "Comment" },
    },
    -- WhichKey
    WhichKey = { transparent = { fg = "#b4637a", bg = "NONE" }, opaque = { fg = "#b4637a" } },
    WhichKeyDesc = { link = "Constant" },
    WhichKeyValue = { fg = "#ebbcba" },
    WhichKeySeparator = { fg = "#908caa" },
    WhichKeyFloat = { transparent = { bg = "NONE" } },
    WhichKeyGroup = { link = "String" },
    WhichKeyIconGrey = { link = "Comment" },
    WhichKeyTitle = { link = "Normal" },
    WhichKeyBorder = { transparent = { bg = "NONE" } },
    -- Snacks
    SnacksNotifierBorderInfo = { transparent = { bg = "NONE" } },
    SnacksNotifierBorderWarn = { transparent = { bg = "NONE" } },
    SnacksNotifierBorderError = { transparent = { bg = "NONE" } }, -- Bufferline
    SnacksNotifierBorderDebug = { transparent = { bg = "NONE" } },
    SnacksNotifierBorderTrace = { transparent = { bg = "NONE" } },
    SnacksDashboardDir = { transparent = { bg = "NONE" } },

    BufferlineSeparatorVisible = { fg = "NvimLightGrey1" },
    BufferlineSeparatorSelected = { fg = "NvimLightGrey2" },

    MiniFilesTitle = {
      transparent = {
        dark = { fg = c.normal_fg, bg = "NONE" },
      },
    },
    MiniFilesTitleFocused = {
      transparent = {
        dark = { fg = c.boolean_fg, bg = "NONE" },
      },
    },
    MiniFilesTitleFocusedInactive = {
      transparent = {
        dark = { fg = c.boolean_fg, bg = "NONE" },
      },
    },
    RenderMarkdownCode = {
      transparent = { bg = "NONE" },
    },
  }

  local background = vim.o.background

  for hl, prop in pairs(highlights) do
    if Settings.transparency == true then
      -- Transparent
      if prop.transparent then
        if prop.transparent.light and background == "light" then
          vim.api.nvim_set_hl(0, hl, prop.transparent.light)
        elseif prop.transparent.dark then
          vim.api.nvim_set_hl(0, hl, prop.transparent.dark)
        else
          vim.api.nvim_set_hl(0, hl, prop.transparent)
        end
      end
    else
      -- Opaque
      if prop.opaque then
        if prop.opaque.light and background == "light" then
          vim.api.nvim_set_hl(0, hl, prop.opaque.light)
        elseif prop.opaque.dark then
          vim.api.nvim_set_hl(0, hl, prop.opaque.dark)
        else
          vim.api.nvim_set_hl(0, hl, prop.opaque)
        end
        -- If no light or dark no opacity
      else
        if prop.transparent ~= nil then
          -- Skip this
        else
          vim.api.nvim_set_hl(0, hl, prop)
        end
      end
    end
  end
end

return H
