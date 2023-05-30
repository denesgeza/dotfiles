Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ nvim-lightbulb
  {
    "kosayoda/nvim-lightbulb",
    enabled = Is_Enabled("nvim-lightbulb"),
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ virtual types
  {
    "jubnzv/virtual-types.nvim",
    enabled = Is_Enabled("virtual-types"),
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ virtual types
  {
    "sudormrfbin/cheatsheet.nvim",
    enabled = Is_Enabled("cheatsheet"),
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-be-good
  {
    "ThePrimeagen/vim-be-good",
    enabled = Is_Enabled("vim-be-good"),
  },
  -- ----------------------
  -- {{{ Neorg
  {
    "nvim-neorg/neorg",
    enabled = Is_Enabled("neorg"),
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  ------------------------------------------------- }}}
}
