Manager = require("core.manager")
Is_enabled = require("core.functions").is_enabled
Defaults = require("core.functions").use_plugin_defaults

if Manager.cmp == "native" then
  return {}
else
  return {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      }
    },
    build = "make install_jsregexp",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = function()
      return {}
    end,
  }
end
