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
      vim.g.db_ui_show_help = 1
      vim.g.db_ui_win_position = "left"
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
  -- {{{ refactoring.nvim
  {
    "ThePrimeagen/refactoring.nvim",
    enabled = Is_Enabled("refactoring"),
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    keys = {
      {
        mode = { "x" },
        "<leader>re",
        function()
          require("refactoring").refactor("Extract Function")
        end,
        desc = "Extract function",
      },
      {
        mode = { "x" },
        "<leader>rf",
        function()
          require("refactoring").refactor("Extract Function To File")
        end,
        desc = "Extract Function To File",
      },
      -- Extract function supports only visual mode
      {
        mode = { "x" },
        "<leader>rv",
        function()
          require("refactoring").refactor("Extract Variable")
        end,
        desc = "Extract Varialble",
      },
      {
        mode = { "n" },
        "<leader>rI",
        function()
          require("refactoring").refactor("Inline Function")
        end,
        desc = "Inline Function",
      },
      {
        mode = { "n", "x" },
        "<leader>ri",
        function()
          require("refactoring").refactor("Inline Variable")
        end,
        desc = "Inline Variable",
      },
      {
        mode = { "n" },
        "<leader>rb",
        function()
          require("refactoring").refactor("Inline Block")
        end,
        desc = "Inline Block",
      },
      {
        mode = { "n" },
        "<leader>rbf",
        function()
          require("refactoring").refactor("Inline Block To File")
        end,
        desc = "Inline Block To File",
      },
      {
        mode = { "n", "x" },
        "<leader>rr",
        function()
          require("refactoring").select_refactor()
        end,
        desc = "Select Refactor",
      },
    },
  },
  -- }}}
  -- {{{ mini.clue
  {
    "echasnovski/mini.clue",
    enabled = Is_Enabled("mini.clue"),
    version = false,
    config = function(opts)
      require("mini.clue").setup(opts)
    end,
  },
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
  -- {{{ hardtime.nvim
  {
    "m4xshen/hardtime.nvim",
    enabled = Is_Enabled("hardtime"),
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  -- }}}
  -- {{{ puppeteer
  -- Add f"" to strings in python and similar to js/ts
  {
    "chrisgrieser/nvim-puppeteer",
    enabled = Is_Enabled("puppeteer"),
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
  },
  -- }}}
  -- {{{ leetcode.nvim
  {
    "kawre/leetcode.nvim",
    enabled = Is_Enabled("leetcode"),
    build = ":TSUpdate html",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-tree/nvim-web-devicons",

      -- recommended
      -- "rcarriga/nvim-notify",
    },
    opts = {
      -- configuration goes here
    },
    config = function(_, opts)
      vim.keymap.set("n", "<leader>lq", "<cmd>LcQuestionTabs<cr>")
      vim.keymap.set("n", "<leader>lm", "<cmd>LcMenu<cr>")
      vim.keymap.set("n", "<leader>lc", "<cmd>LcConsole<cr>")
      vim.keymap.set("n", "<leader>ll", "<cmd>LcLanguage<cr>")
      vim.keymap.set("n", "<leader>ld", "<cmd>LcDescriptionToggle<cr>")

      require("leetcode").setup(opts)
    end,
  },
  -- }}}
  -- {{{ molten-nvim
  {
    "benlubas/molten-nvim",
    enabled = Is_Enabled("molten"),
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
  },
  -- }}}
  -- {{{ image.nvim
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    enabled = Is_Enabled("molten"),
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
    },
  },
  -- }}}
  -- {{{ lsp-timeout.nvim
  {
    "hinell/lsp-timeout.nvim",
    enabled = Is_Enabled("lsp-timeout"),
    dependencies = { "neovim/nvim-lspconfig" },
    init = function()
      vim.g["lsp-timeout-config"] = {
        stopTimeout = 1000 * 60 * 2, -- 2 minutes, timeout before stopping lsp
        startTimeout = 1000 * 15, -- ms, timeout before restart
        silent = false, -- true to supress notifications
      }
    end,
  },
  -- }}}
}
