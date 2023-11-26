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
    keys = {
      { "<leader>tf", "<cmd>lua Customize.toggleterm.float()<cr>", desc = "Float" },
      { "<leader>th", "<cmd>lua Customize.toggleterm.horizontal()<cr>", desc = "Horizontal" },
      { "<leader>tv", "<cmd>lua Customize.toggleterm.vertical()<cr>", desc = "Vertical" },
      { "<leader>tp", "<cmd>lua Customize.toggleterm.python()<cr>", desc = "Python" },
      { "<leader>tn", "<cmd>lua Customize.toggleterm.node()<cr>", desc = "Node" },
      { "<leader>tb", "<cmd>lua Customize.toggleterm.btop()<cr>", desc = "BTop" },
      { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n" } },
      { "<esc>", [[<C-\><C-n>]], mode = { "t" } },
      { "<C-h>", [[<Cmd>wincmd h<CR>]], mode = { "t" } },
      { "<C-j>", [[<Cmd>wincmd j<CR>]], mode = { "t" } },
      { "<C-k>", [[<Cmd>wincmd k<CR>]], mode = { "t" } },
      { "<C-l>", [[<Cmd>wincmd l<CR>]], mode = { "t" } },
      { "<C-w>", [[<C-\><C-n><C-w>]], mode = { "t" } },
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
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "basic", ---@type "basic"|"diamond"|"varied"
          },
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
    },
    keys = {
      { mode = { "n" }, "<leader>ni", "<cmd>Neorg index<cr>", desc = "Index" },
      { mode = { "n" }, "<leader>nj", "<cmd>Neorg journal<cr>", desc = "Journal" },
      { mode = { "n" }, "<leader>nt", "<cmd>Neorg toggle-concealer<>", desc = "Concealer" },
      { mode = { "n" }, "<leader>nr", "<cmd>Neorg <cr>", desc = "Neorg" },
      { mode = { "n" }, "<leader>nr", "<cmd>Neorg module <cr>", desc = "Module" },
      { mode = { "n" }, "<leader>nw", "<cmd>Neorg workspace <cr>", desc = "Workspace" },
      { mode = { "n" }, "<leader>nx", "<cmd>Neorg return <cr>", desc = "Return" },
    },
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
    keys = {
      { mode = { "n" }, "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "DB Toggle UI" },
      { mode = { "n" }, "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "DB Find buffer" },
      { mode = { "n" }, "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "DB Rename buffer" },
      { mode = { "n" }, "<leader>Dl", "<cmd>DBUILastQueryInfo<cr>", desc = "DB Last Query Info" },
    },
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
    enabled = Is_Enabled("compiler.nvim"),
    -- commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- Recommended to to avoid breaking changes
    cmd = { "CompilerOpen", "CompilerToggleResults" },
    opts = {
      -- Tasks are disposed 5 minutes after running to free resources.
      -- If you need to close a task inmediatelly:
      -- press ENTER in the menu you see after compiling on the task you want to close.
      strategy = "toggleterm",
      dap = false,
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
    keys = {
      { mode = { "n" }, "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add mark" },
      { mode = { "n" }, "<leader>hh", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon marks" },
      { mode = { "n" }, "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Manage Marks" },
      { mode = { "n" }, "<leader>hj", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Goto Mark 1" },
      { mode = { "n" }, "<leader>hk", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Goto Mark 2" },
      { mode = { "n" }, "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Previous Mark" },
      { mode = { "n" }, "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next Mark" },
    },
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
  -- {{{ mini apps
  {
    "echasnovski/mini.clue",
    enabled = Is_Enabled("mini.clue"),
    version = false,
    opts = {
      delay = 300,
    },
  },
  {
    "echasnovski/mini.pick",
    enabled = Is_Enabled("mini.pick"),
    version = false,
    lazy = false,
    opts = {},
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
    lazy = false,
    enabled = Is_Enabled("hardtime"),
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      max_count = 5,
      disable_mouse = true,
    },
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
  -- {{{ image.nvim
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    enabled = false,
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
    lazy = false,
    init = function()
      vim.g.lspTimeoutConfig = {
        stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
        startTimeout = 1000 * 10, -- ms, timeout before restart
        silent = false, -- true to suppress notifications
        filetypes = {
          ignore = {}, -- filetypes to ignore; empty by default lsp-timeout is disabled completely
        },
      }
    end,
  },
  -- }}}
  -- {{{ cmp-bootstrap
  {
    "Jezda1337/nvim-html-css",
    enabled = Is_Enabled("cmp-bootstrap"),
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("html-css"):setup()
    end,
  },
  -- }}}
  -- {{{ StatusLine to test
  -- lazy
  {
    "sontungexpt/sttusline",
    enabled = Is_Enabled("sttusline"),
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufEnter" },
    config = function(_, opts)
      require("sttusline").setup({
        -- statusline_color = "#000000",
        statusline_color = "StatusLine",

        -- | 1 | 2 | 3
        -- recommended: 3
        laststatus = 3,
        disabled = {
          filetypes = {
            -- "NvimTree",
            -- "lazy",
          },
          buftypes = {
            -- "terminal",
          },
        },
        components = {
          "mode",
          "git-branch",
          "git-diff",
          "filename",
          "%=",
          "diagnostics",
          -- "lsps-formatters",
          "copilot",
          "indent",
          "encoding",
          "pos-cursor",
          "pos-cursor-progress",
          -- "datetime"
        },
      })
    end,
  },
  -- }}}
  -- {{{ Rustacean.nvim
  {
    "mrcjkb/rustaceanvim",
    enabled = Is_Enabled("rustacean"),
    version = "^3", -- Recommended
    ft = { "rust" },
  },
  -- }}}
  -- {{{ Octo.nvim
  {
    "pwntester/octo.nvim",
    enabled = Is_Enabled("octo"),
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        enable_builtin = true,
        use_local_fs = true,
      })
      vim.cmd([[hi OctoEditable guibg=none]])
      vim.treesitter.language.register("markdown", "octo")
    end,
    keys = {
      { "<leader>gO", "<cmd>Octo<cr>", desc = "Octo" },
      -- { "<leader>Op", "<cmd>Octo pr list<cr>", desc = "Octo pr list" },
    },
  },
  -- }}}
  -- {{{ vim-visual-multi
  {
    "mg979/vim-visual-multi",
    enabled = Is_Enabled("vim-visual-multi"),
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
      }
    end,
  },
  -- }}}
  -- {{{ orgmode
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
      { "akinsho/org-bullets.nvim", opts = {} },
    },
    event = "VeryLazy",
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      -- Setup treesitter
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = { "org" },
      })

      -- Setup orgmode
      -- local Menu = require("org-modern.menu")
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        -- ui = {
        --   menu = {
        --     handler = function(data)
        --       Menu:new({
        --         window = {
        --           margin = { 1, 0, 1, 0 },
        --           padding = { 0, 1, 0, 1 },
        --           title_pos = "center",
        --           border = "single",
        --           zindex = 1000,
        --         },
        --         icons = {
        --           separator = "➜",
        --         },
        --       }):open(data)
        --     end,
        --   },
        -- },
      })
    end,
  },
  -- }}}
}
