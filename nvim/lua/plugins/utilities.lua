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
      { "<leader>tt", "<cmd>lua Customize.toggleterm.tab()<cr>", desc = "Tab" },
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
    branch = "table_version",
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
            "NvimTree",
            "lazy",
          },
          buftypes = {
            -- "terminal",
          },
        },
        components = {
          "mode",
          "git-branch",
          "git-diff",
          "%=",
          "filename",
          -- "lsps-formatters",
          "%=",
          "diagnostics",
          "indent",
          "copilot",
          "encoding",
          "pos-cursor",
          "pos-cursor-progress",
          -- "datetime",
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
    enabled = Is_Enabled("orgmode"),
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
  -- {{{ tsc.nvim
  {
    "dmmulroy/tsc.nvim",
    enabled = Is_Enabled("tsc"),
    config = function()
      local utils = require("tsc.utils")
      require("tsc").setup({
        auto_open_qflist = true,
        auto_close_qflist = false,
        auto_focus_qflist = false,
        auto_start_watch_mode = false,
        bin_path = utils.find_tsc_bin(),
        enable_progress_notifications = true,
        flags = {
          noEmit = true,
          project = function()
            return utils.find_nearest_tsconfig()
          end,
          watch = false,
        },
        hide_progress_notifications_from_history = true,
        spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        pretty_errors = true,
      })
    end,
    keys = {
      { mode = { "n" }, "<leader>ts", "<cmd>TSC<cr>", desc = "TSC" },
    },
  },
  -- }}}
  -- {{{ molten.nvim
  {
    "benlubas/molten-nvim",
    enabled = Is_Enabled("molten.nvim"),
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    lazy = false,
    -- dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      -- vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
  },
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
    },
  },
  -- }}}
  -- {{{ quarto-nvim
  {
    "quarto-dev/quarto-nvim",
    enabled = true,
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        opts = {
          lsp = {
            hover = {
              border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
          },
          buffers = { set_filetype = true },
        },
      },
    },
    opts = {
      lspFeatures = {
        enabled = true,
        languages = { "r", "python", "julia", "bash", "lua", "html" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWrite" },
        },
        codeRunner = {
          enabled = false,
          default_method = "molten", -- 'molten' or 'slime'
          ft_runners = { python = "molten" }, -- filetype to runner, ie. `{ python = "molten" }`.
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        hover = "K",
        definition = "gd",
        rename = "<leader>lR",
        references = "gr",
      },
    },
    keys = {
      { mode = { "n" }, "<leader>lp", "<cmd>lua require('quarto').quartoPreview()<cr>", desc = "Quarto Preview" },
      { mode = { "n" }, "<leader>lr", "<cmd>lua require('quarto').quartoRender()<cr>", desc = "Quarto Render" },
    },
  },
  -- }}}
  -- {{{ nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
    -- Usage
    --     Old text                    Command         New text
    -- --------------------------------------------------------------------------------
    --     surr*ound_words             ysiw)           (surround_words)
    --     *make strings               ys$"            "make strings"
    --     [delete ar*ound me!]        ds]             delete around me!
    --     remove <b>HTML t*ags</b>    dst             remove HTML tags
    --     'change quot*es'            cs'"            "change quotes"
    --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    --     delete(functi*on calls)     dsf             function calls
    -- In VISUAL mode:
    -- Select words, press S, type the new surroundings. eg. S<p class="important">
    -- NOTES:
    -- When adding or changing surroundings:
    -- - Using the the left side of the key will add a space after the surroundings.
    -- - Using the right side of the key will not add a space.
  },
  -- }}}
  -- {{{ vim-doge
  {
    "kkoomen/vim-doge",
    enabled = Is_Enabled("vim-doge"),
    build = ":call doge#install()",
    lazy = false,
    config = function()
      vim.g.doge_mapping = "<leader>dg"
      vim.g.doge_doc_standard_python = "numpy" ---@type "numpy"|"google"|"sphinx"|"reST"|"doxygen"
      vim.g.doge_doc_standard_javascript = "jsdoc"
      vim.g.doge_doc_standard_rust = "rustdoc"
      vim.g.doge_doc_standard_lua = "luadoc"
      vim.g.doge_doc_standard_vim = "vimdoc"
      vim.g.doge_doc_standard_cpp = "doxygen"
      vim.g.doge_doc_standard_c = "doxygen"
      vim.g.doge_doc_standard_shell = "shell"
      vim.g.doge_doc_standard_fish = "fish"
      vim.g.doge_doc_standard_haskell = "haddock"
      vim.g.doge_doc_standard_nix = "nixdoc"
      vim.g.doge_doc_standard_ocaml = "ocamldoc"
      vim.g.doge_doc_standard_purescript = "purescript"
      vim.g.doge_doc_standard_reason = "reason"
      vim.g.doge_doc_standard_svelte = "sveltedoc"
      vim.g.doge_doc_standard_typescript = "tsdoc"
      vim.g.doge_doc_standard_vue = "vuedoc"
      vim.g.doge_doc_standard_yaml = "yamldoc"
      vim.g.doge_doc_standard_zig = "zigdoc"
      vim.g.doge_doc_standard_clojure = "clojuredoc"
      vim.g.doge_doc_standard_clojurescript = "clojuredoc"
      vim.g.doge_doc_standard_fennel = "fenneldoc"
    end,
    keys = {
      { mode = { "n" }, "<leader>dg", "<cmd>DogeGenerate<cr>", desc = "Generate Docstring" },
    },
  },
  -- }}}
}
