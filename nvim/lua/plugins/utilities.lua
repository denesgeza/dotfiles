Is_Enabled = require("config.functions").is_enabled
Customize = require("config.customize")
Toggleterm = require("config.toggleterm")

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
      { "<leader>tf", "<cmd>lua Toggleterm.float()<cr>", desc = "Term | Float" },
      { "<leader>th", "<cmd>lua Toggleterm.horizontal()<cr>", desc = "Term | Horizontal" },
      { "<leader>tv", "<cmd>lua Toggleterm.vertical()<cr>", desc = "Term | Vertical" },
      { "<leader>tt", "<cmd>lua Toggleterm.tab()<cr>", desc = "Term | Tab" },
      -- { "<leader>tp", "<cmd>lua Toggleterm.python()<cr>", desc = "Python" },
      { "<leader>tn", "<cmd>lua Toggleterm.node()<cr>", desc = "Term | Node" },
      { "<leader>tb", "<cmd>lua Toggleterm.btop()<cr>", desc = "Term | BTop" },
      { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n" }, desc = "Toggleterm" },
      { "<esc>", [[<C-\><C-n>]], mode = { "t" } },
      -- QWERTY
      { "<C-h>", [[<Cmd>wincmd h<CR>]], mode = { "t" } },
      { "<C-j>", [[<Cmd>wincmd j<CR>]], mode = { "t" } },
      { "<C-k>", [[<Cmd>wincmd k<CR>]], mode = { "t" } },
      { "<C-l>", [[<Cmd>wincmd l<CR>]], mode = { "t" } },
      { "<C-w>", [[<C-\><C-n><C-w>]], mode = { "t" } },
      -- COLEMAK
      -- { "<C-i>", [[<Cmd>wincmd k<CR>]], mode = { "t" } },
      -- { "<C-o>", [[<Cmd>wincmd l<CR>]], mode = { "t" } },
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
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    lazy = true,
  },
  {
    "nvim-neorg/neorg",
    enabled = Is_Enabled("neorg"),
    lazy = true,
    event = "VeryLazy",
    dependencies = { "luarocks.nvim" },
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
              notes = "~/Projects/notes/",
            },
            default_workspace = "notes",
          },
        },
      },
    },
    keys = {
      { mode = { "n" }, "<leader>ni", "<cmd>Neorg index<cr>", desc = "Index" },
      { mode = { "n" }, "<leader>nj", "<cmd>Neorg journal<cr>", desc = "Journal" },
      { mode = { "n" }, "<leader>nt", "<cmd>Neorg toggle-concealer<cr>", desc = "Concealer" },
      { mode = { "n" }, "<leader>nr", "<cmd>Neorg<cr>", desc = "Neorg" },
      { mode = { "n" }, "<leader>nr", "<cmd>Neorg module<cr>", desc = "Module" },
      { mode = { "n" }, "<leader>nw", "<cmd>Neorg workspace<cr>", desc = "Workspace" },
      { mode = { "n" }, "<leader>nx", "<cmd>Neorg return<cr>", desc = "Return" },
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
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    enabled = Is_Enabled("typescript-tools"),
    event = { "BufReadPre", "BufNewFile" },
    ft = { "typescript", "typescriptreact", "javascript" },
    lazy = true,
    opts = {
      complete_function_calls = true,
      code_lens = "all", ---@type "all"|"off"|"implementations_only"|"references_only"
      disable_member_code_lens = false,
      settings = {
        tsserver_file_preferences = {
          quotePreference = "auto",
          includeCompletionsForModuleExports = true,
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
          importModuleSpecifierEnding = "auto",
          jsxAttributeCompletionStyle = "auto",
          allowTextChangesInNewFiles = true,
          providePrefixAndSuffixTextForRename = true,
          allowRenameOfImportPath = true,
          includeAutomaticOptionalChainCompletions = true,
          provideRefactorNotApplicableReason = true,
          generateReturnInDocTemplate = true,
          includeCompletionsForImportStatements = true,
          includeCompletionsWithSnippetText = true,
          includeCompletionsWithClassMemberSnippets = true,
          includeCompletionsWithObjectLiteralMethodSnippets = true,
          useLabelDetailsInCompletionEntries = true,
          displayPartsForJSDoc = true,
          disableLineTextInReferences = true,
        },
        tsserver_format_options = {
          allowIncompleteCompletions = false,
        },
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    enabled = Is_Enabled("typescript-tools"),
    config = function()
      require("ts-error-translator").setup()
    end,
    lazy = false,
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
        "<leader>cb",
        "<cmd>CompilerOpen<cr>",
        desc = "Compiler | Open",
      },
      {
        mode = { "n" },
        "<leader>ct",
        "<cmd>CompilerToggleResults<cr>",
        desc = "Compiler | Results",
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
  -- {{{ mini apps
  {
    "echasnovski/mini.pick",
    enabled = Is_Enabled("mini.pick"),
    version = false,
    lazy = false,
    opts = {},
  },
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
  },
  {
    "echasnovski/mini.clue",
    enabled = Is_Enabled("mini.clue"),
    version = false,
    lazy = false,
    opts = {},
    config = function()
      local miniclue = require("mini.clue")
      miniclue.setup({
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
    end,
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
  -- {{{ image.nvim
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    enabled = false,
    opts = {
      {
        backend = "kitty", -- whatever backend you would like to use
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
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
      },
    },
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
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-e>",
      }
    end,
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
    enabled = Is_Enabled("quarto"),
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
        rename = "<leader>cr",
        references = "gr",
      },
    },
    keys = {
      { mode = { "n" }, "<leader>cp", "<cmd>lua require('quarto').quartoPreview()<cr>", desc = "Quarto Preview" },
      { mode = { "n" }, "<leader>cR", "<cmd>lua require('quarto').quartoRender()<cr>", desc = "Quarto Render" },
    },
  },
  -- }}}
  -- {{{ nvim-surround
  {
    "kylechui/nvim-surround",
    enabled = Is_Enabled("nvim-surround"),
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
    -- Usage `NORMAL` mode
    --     Old text                    Command         New text
    -- --------------------------------------------------------------------------------
    --     surr*ound_words             ysiw)           (surround_words)
    --     *make strings               ys$"            "make strings"
    --     kdelete ar*ound me!k        ds]             delete around me!
    --     remove <b>HTML t*ags</b>    dst             remove HTML tags
    --     'change quot*es'            cs'"            "change quotes"
    --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    --     delete(functi*on calls)     dsf             function calls
    -- In `VISUAL` mode:
    -- Select words, press S, type the new surroundings. eg. S<p class="important">
    -- _NOTES_:
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
  -- {{{ visual surround
  {
    "NStefan002/visual-surround.nvim",
    enabled = Is_Enabled("visual-surround"),
    lazy = false,
    config = function()
      require("visual-surround").setup({
        -- your config
      })
    end,
    -- or if you don't want to change defaults
    -- config = true
  },
  -- }}}
  -- {{{ CopilotChat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
      language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
      hide_system_prompt = "no",
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
      prompts = {
        Explain = "Explain how this works.",
        Review = "Review the code and provide concise suggestions.",
        Tests = "Generate unit tests for this code.",
        Refactor = "Refactor this code to improve readability.",
        -- Add custom prompts
        -- { name = "prompt_name", prompt = "prompt text" }
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>mb", "<cmd>CopilotChatBuffer<cr>", desc = "Chat with current buffer" },
      { "<leader>me", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
      { "<leader>mt", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
      {
        "<leader>mT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "Toggle Vsplit", -- Toggle vertical split
      },
      {
        "<leader>mv",
        ":CopilotChatVisual ",
        mode = "x",
        desc = "Open in vertical split",
      },
      {
        "<leader>mx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "Run in-place code",
      },
      {
        "<leader>mf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "Fix diagnostic",
      },
      {
        "<leader>mr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "Reset chat history and clear buffer",
      },
      {
        "<leader>mh",
        function()
          require("CopilotChat.code_actions").show_help_actions()
        end,
        desc = "Help actions",
      },
      -- Show prompts actions with telescope
      {
        "<leader>mp",
        function()
          require("CopilotChat.code_actions").show_prompt_actions()
        end,
        desc = "Prompt",
      },
      {
        "<leader>mp",
        ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
        mode = "x",
        desc = "Prompt actions",
      },
    },
  },
  -- }}}
  -- {{{ Fleeting.nvim - Measures time spent in Neovim
  {
    "sammce/fleeting.nvim",
    lazy = false,
    -- Commands :Fleeting, :FleetingReset, :FleetingDelete
  },
  -- }}}
  -- {{{ Reactive.nvim - Measures time spent in Neovim
  {
    "rasulomaroff/reactive.nvim",
    lazy = false,
    enabled = false,
    opts = function()
      if vim.o.background == "light" then
        return {}
      else
        return {
          builtin = {
            cursorline = true,
            cursor = true,
            modemsg = true,
          },
        }
      end
    end,
  },
  -- }}}
  -- {{{ Nekifoch.nvim - Kitty font switcher
  {
    "RAprogramm/nekifoch",
    cmd = "Nekifoch", -- to add lazy loading
    opts = {
      kitty_conf_path = vim.fn.expand("~/.config/kitty/kitty.conf"), -- your kitty config path
      which_key = {
        enable = false, -- without which_key and nui
      },
    },
  },
  -- }}}
}
