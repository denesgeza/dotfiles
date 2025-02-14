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
  c.hint_fg = get_color("DiagnosticHint", "fg")
  c.info_fg = get_color("DiagnosticInfo", "fg")
  c.warn_fg = get_color("DiagnosticWarn", "fg")
  c.error_fg = get_color("ErrorMsg", "fg")
  c.statusline_bg = get_color("StatusLine", "bg")
  c.comment_fg = get_color("Comment", "fg")
  c.comment_bg = get_color("Comment", "bg")
  c.cursoline_bg = get_color("CursorLine", "bg")
  c.boolean_fg = get_color("Boolean", "fg")
  c.pmenusel_bg = get_color("PmenuSel", "bg")

  local highlights = {
    Normal = {
      transparent = {
        light = { bg = c.normal_bg, fg = c.normal_fg },
        -- dark = { fg = c.normal_fg, bg = "NONE", blend = 0 },
        dark = { fg = c.normal_fg, bg = "NONE" },
      },
      opaque = {
        light = { bg = c.normal_bg, fg = c.normal_fg },
        dark = { bg = c.normal_bg, fg = c.normal_fg },
      },
    },
    NormalFloat = { link = "Normal" },
    StatusLine = {
      transparent = { bg = "NONE" },
      opaque = { link = "Normal" },
    },
    -- FloatBorder = { link = "Normal" },
    Comment = {
      transparent = {
        light = { fg = c.comment_fg, bg = c.normal_bg, blend = 95 },
        dark = { fg = c.comment_fg, bg = "NONE", blend = 5, italic = true },
      },
      opaque = { fg = c.comment_fg, bg = c.normal_bg, italic = true },
    },
    StatusLineNC = { link = "Comment" },
    FlashLabel = { fg = "Red" },
    WinSeparator = { link = "Comment" },
    CursorLine = { transparent = { dark = { bg = c.cursoline_bg, blend = 50 } } },
    Pmenu = {
      transparent = { light = { link = "Normal" }, dark = { fg = c.normal_fg, bg = "NONE", blend = 0 } },
      opaque = { link = "Normal" },
    },
    PmenuSel = {
      transparent = { dark = { fg = c.normal_fg, bg = c.cursoline_bg, blend = 0, reverse = true } },
      opaque = { fg = c.normal_fg, bg = c.pmenusel_bg, reverse = true },
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
          if hl == "Normal" then
            print(vim.inspect(prop.opaque))
          end
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
