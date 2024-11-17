Manager = require("config.manager")

return {
  "L3MON4D3/LuaSnip",
  enabled = Manager.cmp == "luasnip" and Manager.completion == "cmp",
  dependencies = {
    -- { "saadparwaiz1/cmp_luasnip" },
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        -- This has to be loaded second, after the snippets have been loaded
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      end,
    },
  },
  -- build = "make install_jsregexp",
  keys = function()
    return {}
  end,
}
