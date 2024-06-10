-- Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults
local Util = require("lazyvim.util")
local icons = require("settings.icons")

return {
  -- {{{ LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true, -- lazyvim.config.keymaps
        -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
        -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
      },
      news = {
        lazyvim = true,
        neovim = true,
      },
      icons = {
        diagnostics = {
          Error = "E",
          Warn = "W",
          Info = "I",
          Hint = "H",
        },
      },
    },
  },
  -- }}}
  -- {{{ NeoTree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = Is_Enabled("neo-tree"),
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim",
    },
    opts = {
      window = {
        mappings = {
          ["e"] = "noop",
        },
      },
    },
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
      {
        "<leader>e",
        function() require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() }) end,
        desc = "NeoTree",
      },
    },
  },
  -- }}}
  -- {{{ Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "bash",
          "html",
          "htmldjango",
          "javascript",
          "json",
          "ninja",
          "python",
          "rst",
          "rust",
          "sql",
          "toml",
          "typescript",
          "regex",
          "lua",
          "markdown",
          "norg",
          "norg_meta",
          "vim",
        })
      end
      opts.auto_install = true
      opts.highlight = { enable = true }
      opts.indent = { enable = true }
      opts.disable = function(_, buf)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats ~= nil and stats.size > max_filesize then return true end
      end
      opts.additional_vim_regex_highlighting = true
      vim.treesitter.language.register("htmldjango", "html")
    end,
  },
  -- }}}
  -- {{{ Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        width = 120,
        height = 40,
        border = "single", ---@type "rounded" | "single" | "double" | "shadow" | "none"
        position = "top", ---@type "center" | "top" | "bottom"
        winblend = 90,
        icons = {
          package_installed = "",
          package_uninstalled = "",
          package_pending = "➜",
        },
      },
      ensure_installed = {
        "emmet-language-server",
        "debugpy",
        "jq",
        "json-lsp",
        "lua-language-server",
        "basedpyright",
        "prettier",
        "prettierd",
        "rust-analyzer",
        "ruff",
        "stylua",
        "shfmt",
        "taplo",
        "yamlfmt",
      },
    },
  },
  -- }}}
  -- {{{ LSPconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          spacing = 2,
          source = "if_many",
          prefix = "", ---@type "icons" |""
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
          },
        },
      },
      inlay_hints = { enabled = false },
      codelens = { enabled = false },
    },
  },
  -- }}}
  -- {{{ Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "^venv/",
            "/venv/",
            "^vendor/",
            "/vendor/",
          },
          extensions = {
            ["ui-select"] = { require("telescope.themes").get_dropdown() },
          },
        },
      })
      -- Enable telescope extensions, if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-e>"] = actions.move_selection_previous,
              ["<C-s>"] = actions.cycle_previewers_next,
              ["<C-a>"] = actions.cycle_previewers_prev,
            },
            n = {
              ["<esc>"] = actions.close,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-e>"] = actions.move_selection_previous,
            },
          },
        },
      })
    end,
    keys = {
      { "<leader><space>", false },
      { "<leader>fb", false },
      { "<leader>fc", false },
      { "<leader>ff", false },
      { "<leader>fF", false },
      { "<leader>fg", false },
      { "<leader>fr", false },
      { "<leader>fR", false },
      { "<leader>fp", false },
      { "<leader>st", false },
      {
        mode = { "n" },
        "<leader>sb",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>",
        desc = "Buffer",
      },
      { "<leader>sf", "<cmd>Telescope find_files sort_mru=true sort_lastused=true<cr>", desc = "Find files" },
      { "<leader>si", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { "<leader>se", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
    },
  },
  -- }}}
  -- {{{ Flash
  {
    "folke/flash.nvim",
    enabled = true,
    keys = {
      { "S", mode = { "n", "x", "o" }, false },
    },
  },
  -- }}}
  -- {{{ whichkey
  {
    "folke/which-key.nvim",
    enabled = Is_Enabled("which-key"),
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = false,
          suggestions = 20,
        },
      },
      key_labels = {
        ["<tab>"] = "TAB",
        ["<Tab>"] = "TAB",
        ["<cr>"] = "ENTER",
        ["<space>"] = "SPACE",
      },
      window = {
        border = "single", ---@type "single" | "double" | "shadow" | "none"
        position = "bottom", ---@type "bottom" | "top"
        margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 0, 2, 0, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.      },
      },
      layout = {
        height = { min = 4, max = 6 }, -- min and max height of the columns
        width = { min = 20, max = 40 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", ---@type "left" | "center" | "right"
      },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "Surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "Tabs" },
        ["<leader>b"] = { name = "Buffer(s)" },
        ["<leader>c"] = { name = "Code" },
        ["<leader>cc"] = { name = "CopilotChat" },
        ["<leader>d"] = { name = "Debug" },
        ["<leader>D"] = { name = "Database" },
        -- ["<leader>f"] = { name = "Find" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>h"] = { name = "Harpoon" },
        ["<leader>q"] = { name = "Quit | Session" },
        ["<leader>o"] = { name = "Options" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>t"] = { name = "Term | Tests" },
        ["<leader>n"] = { name = "Neorg | Noice" },
        ["<leader>m"] = { name = "Copilot Chat" },
        ["<leader>u"] = { name = "UI" },
        ["<leader>w"] = { name = "Windows" },
        ["<leader>x"] = { name = "Diagnostics" },
        ["z"] = { name = "Folding" },
      },
    },
  },
  -- }}}
  -- {{{ notify
  {
    "rcarriga/nvim-notify",
    enabled = Is_Enabled("nvim-notify"),
    opts = {
      background_colour = "#1A1B26",
      timeout = 5000,
      top_down = true,
      level = 2,
      minimum_width = 50,
      render = "compact", ---@type "default" | "minimal" | "compact" | "simple" | "wrapped-compact"
      stages = "fade_in_slide_out",
    },
    keys = {
      {
        mode = { "n" },
        "<leader>fN",
        "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
        desc = "Notifications",
      },
    },
  },
  -- }}}
  -- {{{ noice
  {
    "folke/noice.nvim",
    enabled = Is_Enabled("noice.nvim"),
    opts = function()
      if Use_Defaults("noice.nvim") then
        return {}
      else
        return {
          lsp = {
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
            progress = { enabled = true }, -- handled by fidget
            signature = {
              enabled = true,
              auto_open = true,
              trigger = true,
              luasnip = true,
              throttle = 50,
            },
          },
          notify = { enabled = true }, --  fidget needs do be activated if false to hanle it
          messages = { enabled = true },
          presets = {
            ---@type boolean
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together if false
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
          },
          cmdline = {
            enabled = true,
            view = "cmdline_popup", ---@type "cmdline" | "cmdline_popup"
            format = {
              cmdline = { pattern = "^:", icon = "", lang = "vim" },
              search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
              search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
              filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
              lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
              help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
              input = {}, -- Used by input()
            },
          },
          popupmenu = {
            enabled = true,
            backend = "nui", ---@type "nui" | "cmp"
          },
        }
      end
    end,
    keys = {
      { mode = { "n" }, "<leader>ne", "<cmd>NoiceErrors<cr>", desc = "Noice Errors" },
      { mode = { "n" }, "<leader>nh", "<cmd>NoiceHistory<cr>", desc = "Noice History" },
    },
  },
  -- }}}
  -- {{{ lualine
  {
    "nvim-lualine/lualine.nvim",
    event = { "VimEnter", "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("lualine"),
    opts = function(_, opts)
      local theme_colors = require("settings.theme")
      vim.cmd("hi StatusLine cterm=reverse guifg=NvimDarkGrey3 guibg=NvimLightGrey4")

      if Use_Defaults("lualine") then
        opts = opts
      else
        opts = opts
        opts.options = {
          -- theme = "auto", ---@type table | "auto" -- auto will use the theme that the colorscheme is using
          theme = theme_colors, ---@type table | "auto" -- auto will use the theme that the colorscheme is using
          globalstatus = true, ---@type boolean -- show statusline in all windows or only in the active window
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        }
        opts.sections.lualine_b = { { "branch", icon = "" }, functions.modified }
        opts.sections.lualine_y = {
          -- { functions.get_name, cond = functions.is_active }, -- multicursor plugin
          functions.search_result,
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 1, right = 1 } },
          functions.format_enabled,
        }
      end
    end,
  },
  -- }}}
  -- {{{ indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    --   main = "ibl",
    enabled = Is_Enabled("indent-blankline"),
    opts = {
      indent = {
        char = "┊",
        tab_char = "┊",
      },
      scope = {
        enabled = true,
        show_start = false,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "dashboard",
        },
      },
    },
  },
  -- }}}
  -- {{{ conform.nvim
  {
    "stevearc/conform.nvim",
    enabled = Is_Enabled("conform"),
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        ["*"] = { "trim_whitespace", "trim_newlines" },
        css = { "prettierd" },
        lua = { "stylua" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        htmldjango = { { "prettierd", "prettier" } },
        json = { "jq" },
        markdown = { { "prettierd", "prettier" }, "markdownlint", "markdown-toc" },
        sh = { "shfmt" },
        yaml = { "yamlfmt" },
        zsh = { "beautysh" },
        rust = { "rustfmt" },
        toml = { "taplo" },
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            -- return { "isort", "ruff_format" }
            return { "ruff_organize_imports", "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
      },
    },
    keys = {
      { mode = { "n" }, "<leader>ci", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
      {
        mode = { "n", "v" },
        "<leader>cf",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end,
        desc = "Format",
      },
      { mode = { "n" }, "<leader>uf", "<cmd>FormatToggle<cr>", desc = "Toggle autoformat-on-save" },
    },
  },
  -- }}}
  -- {{{ nvim-lint
  {
    "mfussenegger/nvim-lint",
    enabled = Is_Enabled("nvim-lint"),
    opts = {
      linters_by_ft = {
        fish = { "fish" },
        -- python = { "ruff" },
        typescript = { "eslint" },
        javascript = { "eslint" },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string,table>
      linters = {},
    },
  },
  -- }}}
  -- {{{ Copilot
  {
    "zbirenbaum/copilot.lua",
    enabled = Is_Enabled("Copilot"),
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<C-;>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "right", ---@type 'top'|'bottom'|'left'|'right'
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = false, -- set to true to show ghost text and disable in cmp
        debounce = 75,
        auto_trigger = true,
        keymap = {
          accept = "<C-;>",
          next = "<C-.>", -- Option + ]
          prev = "<C-,>",
          dismiss = "/",
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
        html = false,
        htmldjango = false,
        norg = false,
        ["."] = false,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
      server_opts_overrides = {},
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = Is_Enabled("Copilot-cmp"),
    opts = {
      fix_pairs = true,
    },
  },
  -- }}}
  -- {{{ bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    enabled = Is_Enabled("bufferline"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers", ---@type "buffers" | "tabs"
        themable = true, ---@type boolean
        -- diagnostics = "nvim_lsp", ---@type "nvim_lsp" | "coc" | boolean
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin", ---@type "slant" | "slope" | "thick" | "thin"
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon", ---@type "icon" | "underline" | "none"
        },
        buffer_close_icon = "󰅖",
        color_icons = true,
      },
    },
  },
  -- }}}
  -- {{{ fidget.nvim
  {
    "j-hui/fidget.nvim",
    enabled = Is_Enabled("fidget.nvim"),
    event = "VeryLazy",
    opts = {
      progress = {
        display = {
          done_icon = "󰄭 ",
          done_ttl = 5,
        },
      },
      notification = {
        filter = vim.log.levels.INFO,
        override_vim_notify = true,
        window = {
          normal_hl = "Normal",
          border = "none",
          winblend = 0,
        },
      },
      integration = {
        ["nvim-tree"] = { enable = true },
      },
    },
    init = function()
      vim.notify = require("fidget").notify

      if Util.has("noice.nvim") then Util.on_very_lazy(function() vim.notify = require("fidget").notify end) end
    end,
    keys = {
      { mode = { "n" }, "<leader>un", "<cmd>Fidget history<cr>", desc = "Notifications" },
    },
  },
  -- }}}
  -- {{{ gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    enabled = Is_Enabled("gitsigns.nvim"),
    opts = {
      _threaded_diff = true,
      _signs_staged_enable = true,
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      current_line_blame = false,
      trouble = true,
      on_attach = function(buf)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = buf, desc = desc }) end

        -- stylua: ignore start
        -- map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", "Branches")
        map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", "Status")
        map("n", "<leader>gD", "<cmd>Gitsigns toggle_deleted<cr>", "Toggle Deleted")
        map("n", "<leader>gl", "<cmd>Gitsigns toggle_linehl<cr>", "Toggle LineHL")
        map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
        map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
      end,
    },
  },
  -- }}}
  -- {{{ mini apps
  { "echasnovski/mini.surround", version = false, enabled = Is_Enabled("mini.surround") },
  { "echasnovski/mini.comment", version = false, enabled = false },
  {
    "echasnovski/mini.files",
    enabled = Is_Enabled("mini.files"),
    version = false,
    lazy = false,
    opts = {
      mappings = {
        go_in = "i",
        go_in_plus = "I",
      },
    },
    keys = {
      { "<leader>fm", false },
      { "<leader>fM", false },
      {
        "<leader>f",
        function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end,
        desc = "Mini Files",
      },
    },
  },
  -- }}}
  -- {{{ spectre
  { "nvim-pack/nvim-spectre", enabled = Is_Enabled("spectre") },
  -- }}}
  -- {{{ dashboard.nvim
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    enabled = Is_Enabled("dashboard"),
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  -- }}}
  -- {{{ neotest
  {
    "nvim-neotest/neotest",
    enabled = Is_Enabled("neotest"),
    -- dependencies = {
    --   "nvim-lua/plenary.nvim",
    --   "antoinemadec/FixCursorHold.nvim",
    --   "nvim-treesitter/nvim-treesitter",
    --   "nvim-neotest/neotest-python",
    --   "folke/neodev.nvim",
    -- },
    -- config = function()
    --   require("neotest").setup({
    --     adapters = {
    --       require("neotest-python")({
    --         -- dap = { justMyCode = false },
    --         runner = "pytest",
    --         args = { "--log-level", "DEBUG", "--color", "yes", "-vv", "-s" },
    --         python = "venv/bin/python",
    --         pytest_discover_instances = true,
    --       }),
    --     },
    --   })
    -- end,
    keys = {
      -- {
      --   mode = { "n" },
      --   "<leader>tr",
      --   function()
      --     require("neotest").run.run()
      --   end,
      --   desc = "Tests | Run all tests",
      -- },
      -- {
      --   mode = { "n" },
      --   "<leader>tc",
      --   function()
      --     require("neotest").run.run(vim.fn.expand("%"))
      --   end,
      --   desc = "Tests | Run current file",
      -- },
      {
        mode = { "n" },
        "<leader>tp",
        "<cmd>lua require('neotest').output_panel.toggle()<cr>",
        desc = "Tests | Panel",
      },
      { mode = { "n" }, "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Tests | Summary" },
    },
  },
  -- }}}
  -- {{{ nvim-dap
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensured_installed = opts.ensured_installed or {}
          table.insert(opts.ensured_installed, "js-debug-adapter")
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["pwa-node"] then
        require("dap").adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = {
              require("mason-registry").get_package("js-debug-adapter"):get_install_path()
                .. "/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
            {
              type = "chrome",
              request = "launch",
              name = "Launch Chrome against localhost",
              url = "http://localhost:8000",
              webRoot = "${workspaceFolder}",
            },
          }
        end
      end
    end,
  },
  -- }}}
  -- {{{ LazyGit

  {
    "kdheepak/lazygit.nvim",
    enabled = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
      require("telescope").load_extension("lazygit")
      vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
      vim.g.lazygit_floating_window_scaling_factor = 0.98 -- scaling factor for floating window
      -- vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
      vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
      vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

      vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
      vim.g.lazygit_config_file_path = "" -- custom config file path
      -- OR
      vim.g.lazygit_config_file_path = {} -- table of custom config file paths
    end,
  },
  -- }}}
}
