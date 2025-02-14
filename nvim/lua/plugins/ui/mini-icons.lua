return {
  "echasnovski/mini.icons",
  enabled = Is_Enabled("mini.icons"),
  ---@class MiniIcons.config
  opts = {
    style = "glyph", ---@type 'glyph' | 'ascii'
    -- Customize per category. See `:h MiniIcons.config` for details.
    default = {},
    directory = {
      apps = { glyph = "󰀻", hl = "MiniIconsBlue" },
      config = { glyph = "", hl = "MiniIconsGreen" },
      tools = { glyph = "", hl = "MiniIconsOrange" },
      database = { glyph = "", hl = "MiniIconsOrange" },
      users = { glyph = "󰉌", hl = "MiniIconsRed" },
      automation = { glyph = "", hl = "MiniIconsGreen" },
      static = { glyph = "", hl = "MiniIconsYellow" },
      templates = { glyph = "", hl = "MiniIconsGreen" },
    },
    extension = {
      ts = { glyph = "", hl = "MiniIconsAzure" },
      js = { glyph = "", hl = "MiniIconsGreen" },
      norg = { glyph = "", hl = "MiniIconsAzure" },
      lock = { glyph = "", hl = "MiniIconsRed" },
    },
    file = {},
    filetype = {
      typescript = { glyph = "", hl = "MiniIconsAzure" },
      javascript = { glyph = "", hl = "MiniIconsGreen" },
      norg = { glyph = "", hl = "MiniIconsAzure" },
      lock = { glyph = "", hl = "MiniIconsRed" },
    },
    lsp = {},
    os = {},
  },
  lazy = true,
  specs = {
    { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      -- needed since it will be false when loading and mini will fail
      package.loaded["nvim-web-devicons"] = {}
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
