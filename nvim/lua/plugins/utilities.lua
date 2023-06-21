Is_Enabled = require("config.functions").is_enabled
Constants = require("config.constants")
Customize = require("config.customize")

return {
  -- {{{ telescope File browser
  { "nvim-telescope/telescope-file-browser.nvim" },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Toggleterm
  {
    "akinsho/toggleterm.nvim",
    enabled = Is_Enabled("toggleterm.nvim"),
    version = "*",
    opts = {
      size = 13,
      hide_numbers = true,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shading_factor = 2,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Outline
  {
    "simrat39/symbols-outline.nvim",
    enabled = Is_Enabled("outline"),
    name = "symbols-outline",
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = "right",
      relative_width = true,
      width = 15,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = "Pmenu",
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { "", "" },
      wrap = false,
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "𝓒", hl = "@type" },
        Method = { icon = "ƒ", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "ℰ", hl = "@type" },
        Interface = { icon = "ﰮ", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "𝓐", hl = "@string" },
        Number = { icon = "#", hl = "@number" },
        Boolean = { icon = "⊨", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "🔐", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "𝓢", hl = "@type" },
        Event = { icon = "🗲", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "", hl = "@function" },
        Fragment = { icon = "", hl = "@constant" },
      },
    },
    config = function()
      require("symbols-outline").setup({})
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Multi cursor
  {
    "mg979/vim-visual-multi",
    enabled = Is_Enabled("multicursor"),
    branch = "master",
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("tmux-navigator"),
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    enabled = Is_Enabled("ufo"),
    event = "BufRead",
    dependencies = {
      { "kevinhwang91/promise-async" },
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            -- foldfunc = "builtin",
            -- setopt = true,
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },

    opts = {},
    config = function(_, opts)
      -- Fold options
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup(opts)
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Neorg
  {
    "nvim-neorg/neorg",
    enabled = Is_Enabled("neorg"),
    event = "VeryLazy",
    build = ":Neorg sync-parsers",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            -- config = { icons = { todo = { uncertain = { icon = " " } } } },
            config = { icon_preset = "basic" }, -- basic/diamond/varied
          }, -- Adds pretty icons to your documents
          ["core.integrations.telescope"] = {},
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/OneDrive - Gonvarri/Documents/Neorg/notes/",
                ideas = "~/OneDrive - Gonvarri/Documents/Neorg/ideas/",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
  ----------------------------------------------------- }}}
  -- {{{ Oil
  {
    "stevearc/oil.nvim",
    enabled = Is_Enabled("oil"),
    opts = {},
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "<leader>;", require("oil").open, { desc = "Open parent directory" })
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  ----------------------------------------------------- }}}
  -- {{{ Ranger
  {
    "kelly-lin/ranger.nvim",
    enabled = Is_Enabled("ranger"),
    config = function()
      require("ranger-nvim").setup({ replace_netrw = false })
      -- vim.api.nvim_set_keymap("n", "<leader>ef", "", {
      --   noremap = true,
      --   callback = function()
      --     require("ranger-nvim").open(true)
      --   end,
      -- })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    enabled = Is_Enabled("todo-comments.nvim"),
    opts = function(_, opts)
      opts.merge_keywords = true
      opts.keywords = Constants.icons.keywords
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ mini.jump2d - hop replacement
  {
    "echasnovski/mini.jump2d",
    enabled = Is_Enabled("mini.jump"),
    version = false,
    config = function()
      require("mini.jump2d").setup({
        labels = "asdfghjklm",
        view = {
          n_steps_ahead = 2,
          dim = true,
        },
        silent = true,
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ hardtime
  {
    "m4xshen/hardtime.nvim",
    enabled = Is_Enabled("hardtime"),
    opts = {},
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ dadbod  -- MySQL connection
  {
    "tpope/vim-dadbod",
    enabled = Is_Enabled("dadbod"),
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    enabled = Is_Enabled("dadbod"),
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ typescript-tools.nvim
  --  https://github.com/pmizio/typescript-tools.nvim
  {
    "pmizio/typescript-tools.nvim",
    enabled = Is_Enabled("typescript-tools"),
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ themery  --  https://github.com/zaldih/themery.nvim
  {
    "zaldih/themery.nvim",
    enabled = Is_Enabled("themery"),
    config = function()
      -- Set custom name to the list
      require("themery").setup({
        livePreview = true,
        themeConfigFile = "~/.config/nvim/lua/plugins/configs/theme.lua", -- Described below
        themes = {
          {
            name = "Day",
            colorscheme = "kanagawa-lotus",
          },
          {
            name = "Night",
            colorscheme = "kanagawa-dragon",
          },
          {
            name = "Transparent",
            colorscheme = "tokyonight",
          },
        },
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ better-escape
  {
    "max397574/better-escape.nvim",
    enabled = Is_Enabled("better-escape"),
    config = function()
      require("better_escape").setup()
    end,
  },
  -- ----------------------------------------------------------------------- }}}
}
