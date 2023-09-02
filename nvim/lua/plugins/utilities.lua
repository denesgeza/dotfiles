Is_Enabled = require("config.functions").is_enabled
Customize = require("config.customize")

return {
  -- {{{ lsp-zero
  {
    "VonHeikemen/lsp-zero.nvim",
    enabled = Is_Enabled("lsp-zero"),
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    },
  },
  -- }}}
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
  -- }}}
  -- {{{ Multi cursor
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    enabled = Is_Enabled("multicursors-lua"),
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<leader>mc",
        "<cmd>MCstart<cr>",
        desc = "Multicursor selection",
      },
      -- {
      --   mode = { "v", "n" },
      --   "<C-n>",
      --   "<cmd>MCstart<cr>",
      --   desc = "Multicursor selection",
      -- },
      -- {
      --   mode = { "v", "n" },
      --   "<C-k>",
      --   "<cmd>MCunderCursor<cr>",
      --   desc = "Multicursor start",
      -- },
      {
        mode = { "v", "n" },
        "<leader>md",
        "<cmd>MCunderCursor<cr>",
        desc = "Multicursor start",
      },
    },
  },
  -- }}}
  -- {{{ vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("tmux-navigator"),
  },
  --  }}}
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
              { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
              { text = { "%s" },                  click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
          -- require("plugins.configs.ufo")
        end,
      },
    },
    opts = {},
    keys = {
      { mode = "n", "zR", "<cmd>lua require('ufo').open_all_folds()<cr>",  desc = "Open all folds" },
      { mode = "n", "zM", "<cmd>lua require('ufo').close_all_folds()<cr>", desc = "Close all folds" },
    },
    config = function(_, opts)
      -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.fillchars = [[eob: ,fold:•,foldopen:-,foldsep: ,foldclose:+]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup({
          capabilities = capabilities,
        })
      end

      require("ufo").setup(opts)
    end,
  },
  -- }}}
  -- {{{ Neorg
  {
    "nvim-neorg/neorg",
    enabled = Is_Enabled("neorg"),
    event = "VeryLazy",
    build = ":Neorg sync-parsers",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},               -- Loads default behaviour
          ["core.concealer"] = {
            config = { icon_preset = "basic" }, -- basic/diamond/varied
          },                                    -- Adds pretty icons to your documents
          ["core.qol.todo_items"] = {
            config = {
              create_todo_items = true,
              create_todo_parents = true,
            },
          },
          -- NOTE: Requires neovim 0.10
          -- ["core.ui"] = {},
          -- ["core.ui.calendar"] = {}, -- Adds a calendar sidebar
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/OneDrive - Gonvarri/Documents/Neorg/notes/",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
  -- }}}
  -- {{{ dadbod  -- MySQL connection
  {
    "tpope/vim-dadbod",
    enabled = Is_Enabled("dadbod"),
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    enabled = Is_Enabled("dadbod"),
  },
  --  }}}
  -- {{{ typescript-tools.nvim
  {
    "pmizio/typescript-tools.nvim",
    enabled = Is_Enabled("typescript-tools"),
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  -- }}}
  -- {{{ compiler.nvim
  {
    "Zeioth/compiler.nvim",
    enabled = Is_Enabled("compiler.nvim"),
    cmd = { "CompilerOpen", "CompilerToggleResults" },
    dependencies = { "stevearc/overseer.nvim" },
    config = function(_, opts)
      require("compiler").setup(opts)
    end,
  },
  {                                                      -- The framework we use to run tasks
    "stevearc/overseer.nvim",
    commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- Recommended to to avoid breaking changes
    cmd = { "CompilerOpen", "CompilerToggleResults" },
    opts = {
      -- Tasks are disposed 5 minutes after running to free resources.
      -- If you need to close a task inmediatelly:
      -- press ENTER in the menu you see after compiling on the task you want to close.
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = {
          ["q"] = function()
            vim.cmd("OverseerClose")
          end,
        },
      },
    },
  },
  --  }}}
  -- {{{ Buffer tabs
  {
    "tomiis4/BufferTabs.nvim",
    enabled = Is_Enabled("BufferTabs"),
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
    lazy = false,
    config = function()
      require("buffertabs").setup({
        ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
        border = "rounded",

        ---@type boolean
        icons = true,

        ---@type string
        hl_group = "Keyword",

        ---@type string
        hl_group_inactive = "Comment",

        ---@type table[]
        exclude = {},

        ---@type boolean
        show_all = false,

        ---@type 'row'|'column'
        display = "row",

        ---@type 'left'|'right'|'center'
        horizontal = "center",

        ---@type 'top'|'bottom'|'center'
        vertical = "bottom",
      })
    end,
  },
  --  }}}
  -- {{{ Mini-clue
  {
    "echasnovski/mini.clue",
    enabled = Is_Enabled("mini.clue"),
    version = false,
    config = function()
      require("mini.clue").setup()
      require("plugins.settings.miniclue")
    end,
  },
  --  }}}
  -- {{{ Bigfile.nvim
  {
    "LunarVim/bigfile.nvim",
    enabled = Is_Enabled("bigfile"),
    init = function()
      -- default config
      require("bigfile").setup({
        filesize = 1,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
        pattern = { "*" }, -- autocmd pattern
        features = {       -- features to disable
          "indent_blankline",
          "illuminate",
          "lsp",
          "treesitter",
          "syntax",
          "matchparen",
          "vimopts",
          "filetype",
        },
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Codeium
  {
    "Exafunction/codeium.vim",
    enabled = Is_Enabled("Codeium"),
  },
  -- }}}
  -- {{{ Tabnine
  {
    "tzachar/cmp-tabnine",
    enabled = Is_Enabled("TabNine"),
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
  },
  -- }}}
  -- {{{ ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    enabled = Is_Enabled("ChatGPT"),
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "pass show openai",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- }}}
  -- {{{ Copilot
  {
    "zbirenbaum/copilot.lua",
    enabled = Is_Enabled("Copilot"),
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<C-;>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            ---@type 'top'|'bottom'|'left'|'right'
            position = "right",
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          debounce = 75,
          auto_trigger = true,
          keymap = {
            accept = "<C-;>",
            next = "<C-]>", -- Option + ]
            prev = "<C-[>",
            dismiss = "<C-'>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  -- }}}
  -- {{{ EFM config
  {
    "creativenull/efmls-configs-nvim",
    enabled = Is_Enabled("efm"),
    version = "v1.x.x", -- version is optional, but recommended
    dependencies = { "neovim/nvim-lspconfig" },
  },
  --  }}}
  -- {{{ Speedtyper
  {
    "NStefan002/speedtyper.nvim",
    enabled = Is_Enabled("speedtyper"),
    branch = "main",
    cmd = "Speedtyper",
    opts = {
      -- your config
    },
  },
  -- }}}
  -- {{{ Zen mode
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
  -- }}}
}
