Manager = require("config.manager")

return {
  "L3MON4D3/LuaSnip",
  enabled = Manager.cmp == "luasnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      -- require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  build = "make install_jsregexp",
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  keys = function() return {} end,
}
