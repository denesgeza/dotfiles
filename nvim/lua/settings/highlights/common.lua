-- Highlights groups for all colorschemes

local get_color = require("config.functions").get_color

local H = {}
local c = {}

function H.set_highlights()
  c.normal_bg = get_color("Normal", "bg")
  c.normal_fg = get_color("Normal", "fg")
  c.hint_fg = get_color("DiagnosticHint", "fg")
  c.info_fg = get_color("DiagnosticInfo", "fg")
  c.warn_fg = get_color("DiagnosticWarn", "fg")
  c.error_fg = get_color("ErrorMsg", "fg")
  c.lazy_special_fg = get_color("Special", "fg")
  c.statusline_bg = get_color("StatusLine", "bg")
  c.comment_fg = get_color("Comment", "fg")
  c.comment_bg = get_color("Comment", "bg")
  c.cursoline_bg = get_color("CursorLine", "bg")
  c.cursoline_fg = get_color("CursorLine", "fg")
  c.boolean_fg = get_color("Boolean", "fg")
  c.pmenu_bg = get_color("Pmenu", "bg")

  if vim.g.colors_name == "default" then
    require("settings.highlights.default")
  end

  local highlights = {
    StatusLine = {
      transparent = { bg = "NONE" },
      opaque = { link = "Normal" },
    },
    FloatBorder = {
      transparent = { link = "Normal" },
      opaque = { fg = c.pmenu_bg, bg = c.normal_bg },
    },
    Comment = {
      transparent = {
        light = { fg = c.comment_fg, bg = c.normal_bg, blend = 95 },
        dark = { fg = c.comment_fg, bg = "NONE", blend = 5, italic = true },
      },
      opaque = { fg = c.comment_fg, bg = c.normal_bg, italic = true },
    },
    StatusLineNC = { link = "Comment" },
    FlashLabel = { fg = "Red" },
    Normal = {
      transparent = {
        light = { bg = c.normal_bg, fg = c.normal_fg },
        dark = { fg = c.normal_fg, bg = "NONE", blend = 0 },
      },
    },
    NormalFloat = { link = "Normal" },
    WinSeparator = { link = "Comment" },
    Pmenu = {
      transparent = { light = { link = "Normal" }, dark = { fg = c.normal_fg, bg = "NONE", blend = 0 } },
      opaque = { link = "Normal" },
    },
    PmenuSel = {
      transparent = { dark = { fg = c.normal_fg, bg = c.cursoline_bg, blend = 0, reverse = true } },
      opaque = { fg = c.normal_fg, bg = c.cursoline_bg, reverse = true },
    },
    PmenuMatchSel = {
      transparent = { dark = { fg = c.normal_fg, bg = "#908caa", blend = 0, reverse = true } },
      opaque = { fg = c.normal_fg, bg = "#908caa", reverse = true },
    },
    -- WhichKey
    WhichKey = { fg = "#b4637a" },
    WhichKeyDesc = { link = "Constant" },
    WhichKeyValue = { fg = "#ebbcba" },
    WhichKeySeparator = { fg = "#908caa" },
    WhichKeyFloat = { link = "NormalFloat" },
    WhichKeyGroup = { link = "String" },
    -- Snacks
    SnacksBackdrop = { bg = "NONE" },
    SnacksDashboardIcon = { fg = "NvimLightYellow" },
    SnacksDashboardDesc = { fg = "NvimLightGrey2" },
    SnacksDashboardKey = { fg = "NvimLightRed" },
    SnacksNotifierBorderInfo = { transparent = { bg = "NONE" } },
    SnacksNotifierBorderWarn = { transparent = { bg = "NONE" } },
    SnacksNotifierBorderError = { transparent = { bg = "NONE" } }, -- Bufferline
    SnacksNotifierBorderDebug = { transparent = { bg = "NONE" } },
    SnacksNotifierBorderTrace = { transparent = { bg = "NONE" } },

    BufferlineSeparatorVisible = { fg = "NvimLightGrey1" },
    BufferlineSeparatorSelected = { fg = "NvimLightGrey2" },

    CursorLine = { transparent = { dark = { bg = c.cursoline_bg, blend = 50 } } },
    MiniFilesTitle = { transparent = { dark = { fg = c.normal_fg, bg = "NONE", blend = 50 } } },
    MiniFilesTitleFocused = { transparent = { dark = { fg = c.boolean_fg, bg = "NONE", blend = 50 } } },
    MiniFilesTitleFocusedInactive = { transparent = { dark = { fg = c.boolean_fg, bg = "NONE", blend = 50 } } },
  }

  local background = vim.o.background
  for hl, prop in pairs(highlights) do
    if Settings.transparency == true then
      -- Transparent
      vim.cmd("set winblend=80")
      vim.cmd("set pumblend=80")
      if prop.transparent ~= nil then
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
      if prop.opaque ~= nil then
        if prop.opaque.light and background == "light" then
          vim.api.nvim_set_hl(0, hl, prop.opaque.light)
        elseif prop.opaque.dark then
          vim.api.nvim_set_hl(0, hl, prop.opaque.dark)
        else
          vim.api.nvim_set_hl(0, hl, prop.opaque)
        end
        -- If no light or dark no opacity
      else
        if prop.transparent == nil then
          vim.api.nvim_set_hl(0, hl, prop)
        else
          -- Skip this
        end
      end
    end
  end
end

return H
