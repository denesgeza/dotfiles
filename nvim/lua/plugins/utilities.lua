Is_Enabled = require("config.functions").is_enabled
Customize = require("config.customize")

return {
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
    keys = {
      {
        mode = { "n" },
        "<C-h>",
        "<cmd>TmuxNavigateLeft<cr>",
        desc = "TmuxNavigateLeft",
      },
      {
        mode = { "n" },
        "<C-j>",
        "<cmd>TmuxNavigateDown<cr>",
        desc = "TmuxNavigateDown",
      },
      {
        mode = { "n" },
        "<C-k>",
        "<cmd>TmuxNavigateUp<cr>",
        desc = "TmuxNavigateUp",
      },
      {
        mode = { "n" },
        "<C-l>",
        "<cmd>TmuxNavigateRight<cr>",
        desc = "TmuxNavigateRight",
      },
    },
  },
  -- }}}
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
          -- require("plugins.configs.ufo")
        end,
      },
    },
    opts = {},
    keys = {
      { mode = "n", "zR", "<cmd>lua require('ufo').open_all_folds()<cr>", desc = "Open all folds" },
      { mode = "n", "zM", "<cmd>lua require('ufo').close_all_folds()<cr>", desc = "Close all folds" },
    },
    config = function(_, opts)
      -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.fillchars = [[eob: ,fold:•,foldopen:-,foldsep: ,foldclose:+]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
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
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = { icon_preset = "basic" }, -- basic/diamond/varied
          }, -- Adds pretty icons to your documents
          ["core.qol.todo_items"] = {
            config = {
              create_todo_items = true,
              create_todo_parents = true,
            },
          },
          ["core.ui"] = {},
          ["core.ui.calendar"] = {}, -- Adds a calendar sidebar
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
    "kristijanhusak/vim-dadbod-ui",
    enabled = Is_Enabled("dadbod"),
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g["db_ui_save_location"] = "~/.config/nvim/temp/db"
    end,
  },
  --  }}}
  -- {{{ typescript-tools.nvim
  {
    "pmizio/typescript-tools.nvim",
    enabled = Is_Enabled("typescript-tools"),
    event = { "BufReadPre", "BufNewFile" },
    ft = { "typescript", "typescriptreact" },
    opts = {
      complete_function_calls = true,
      settings = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  -- }}}
  -- {{{ compiler.nvim
  {
    "Zeioth/compiler.nvim",
    enabled = Is_Enabled("compiler.nvim"),
    cmd = { "CompilerOpen", "CompilerToggleResults" },
    dependencies = { "stevearc/overseer.nvim" },
    keys = {
      {
        mode = { "n" },
        "<leader>cc",
        "<cmd>CompilerOpen<cr>",
        desc = "Compiler Open",
      },
      {
        mode = { "n" },
        "<leader>ct",
        "<cmd>CompilerToggleResults<cr>",
        desc = "Compiler Toggle Results",
      },
    },
    config = function(_, opts)
      require("compiler").setup(opts)
    end,
  },
  { -- The framework we use to run tasks
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
  -- {{{ Bigfile.nvim
  {
    "LunarVim/bigfile.nvim",
    enabled = Is_Enabled("bigfile"),
    init = function()
      -- default config
      require("bigfile").setup({
        filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        pattern = { "*" }, -- autocmd pattern
        features = { -- features to disable
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
  -- }}}
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
    enabled = Is_Enabled("zen-mode"),
    opts = {},
  },
  -- }}}
  -- {{{ Harpoon
  {
    "ThePrimeagen/harpoon",
    enabled = Is_Enabled("harpoon"),
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
          enter_on_sendcmd = false,
          tmux_autoclose_windows = false,
          excluded_filetypes = { "harpoon" },
        },
        projects = {
          ["~/.config/nvim/temp/harpoon"] = {
            term = {
              cmds = {
                "./env && npx ts-node src/index.ts",
              },
            },
          },
        },
      })
      require("telescope").load_extension("harpoon")
    end,
  },
  -- }}}
  -- {{{ mini.nvim
  {
    "echasnovski/mini.nvim",
    enabled = false,
    version = false,
    opts = function()
      if Is_Enabled("mini.clue") then
        local miniclue = require("mini.clue")
        require("mini.clue").setup({
          triggers = {
            -- Leader triggers
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },

            -- Built-in completion
            { mode = "i", keys = "<C-x>" },

            -- `g` key
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },

            -- Marks
            { mode = "n", keys = "'" },
            { mode = "n", keys = "`" },
            { mode = "x", keys = "'" },
            { mode = "x", keys = "`" },

            -- Registers
            { mode = "n", keys = '"' },
            { mode = "x", keys = '"' },
            { mode = "i", keys = "<C-r>" },
            { mode = "c", keys = "<C-r>" },

            -- Window commands
            { mode = "n", keys = "<C-w>" },

            -- `z` key
            { mode = "n", keys = "z" },
            { mode = "x", keys = "z" },
          },

          clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
          },
        })
      end
    end,
  },
  -- }}}
  -- {{{ nvim-lint
  {
    "mfussenegger/nvim-lint",
    enabled = Is_Enabled("nvim-lint"),
    opts = {},
    config = function(opts)
      require("lint").linters_by_ft = {
        typescript = { "eslint_d" },
        rust = { "rstcheck" },
      }
      require("lint").setup(opts)
    end,
  },
  { "rshkarin/mason-nvim-lint", enabled = Is_Enabled("nvim-lint"), opts = {} },

  -- }}}
  -- {{{ neoscroll
  {
    "karb94/neoscroll.nvim",
    enabled = Is_Enabled("neoscroll"),
    opts = {},
  },
  -- }}}
  -- {{{ Nerdy
  {
    "2kabhishek/nerdy.nvim",
    enabled = Is_Enabled("nerdy"),
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        mode = { "n" },
        "<leader>uN",
        "<cmd>Nerdy<cr>",
        desc = "Nerdy",
      },
    },
    cmd = "Nerdy",
  },
  -- }}}
  -- {{{ Testing
  -- Add f"" to strings in python and similar to js/ts
  {
    "chrisgrieser/nvim-puppeteer",
    enabled = Is_Enabled("puppeteer"),
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
  },
  -- show function usage count
  {
    "Wansmer/symbol-usage.nvim",
    enabled = Is_Enabled("symbol-usage"),
    event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require("symbol-usage").setup()
    end,
  },
  -- }}}
}
