Is_Enabled = require("config.functions").is_enabled
Constants = require("config.constants")
Customize = require("config.customize")

return {
  -- {{{ Telescope File browser
  { "nvim-telescope/telescope-file-browser.nvim", enabled = Is_Enabled("telescope-file-browser") },
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
    cmd = "SymbolsOutline",
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
    enabled = Is_Enabled("vim-visual-multi"),
    branch = "master",
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Multi cursor - lua version
  {
    "smoka7/multicursors.nvim",
    enabled = Is_Enabled("multicursors-lua"),
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for word under the cursor",
      },
    },
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
          -- require("plugins.configs.ufo")
        end,
      },
    },
    opts = {},
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
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Neorg
  {
    "nvim-neorg/neorg",
    enabled = Is_Enabled("neorg"),
    event = "VeryLazy",
    build = ":Neorg sync-parsers",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- { "nvim-neorg/neorg-telescope" }
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            -- config = { icons = { todo = { uncertain = { icon = " " } } } },
            config = { icon_preset = "basic" }, -- basic/diamond/varied
          }, -- Adds pretty icons to your documents
          -- ["core.integrations.telescope"] = {},
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/OneDrive - Gonvarri/Documents/Neorg/notes/",
                -- ideas = "~/OneDrive - Gonvarri/Documents/Neorg/ideas/",
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
      vim.keymap.set("n", "<leader>;", require("oil").open, { desc = "Oil" })
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  ----------------------------------------------------- }}}
  -- {{{ ToDo-comments.nvim
  {
    "folke/todo-comments.nvim",
    enabled = Is_Enabled("todo-comments.nvim"),
    opts = {
      merge_keywords = true,
      keywords = {
        Youtube = { icon = " ", color = "#ff0000" },
        TODO = { icon = " ", color = "#ff0000" },
        FIXME = { icon = " ", color = "#ff0000" },
        URL = { icon = "", color = "#7711FF", alt = { "Url", "url" } },
      },
    },
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
  {
    "pmizio/typescript-tools.nvim",
    enabled = Is_Enabled("typescript-tools"),
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
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
  -- {{{ pretty-fold
  {
    "anuvyklack/pretty-fold.nvim",
    enabled = Is_Enabled("pretty-fold"),
    config = function()
      require("pretty-fold").setup({
        keep_indentation = false,
        fill_char = "•",
        sections = {
          left = {
            "━ ",
            function()
              return string.rep("*", vim.v.foldlevel)
            end,
            " ━┫",
            "content",
            "•",
          },
          right = {
            "•",
            "number_of_folded_lines",
            ": ",
            "percentage",
            " ┣━━",
          },
        },
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Markdown and neorg file highlighter
  {
    "lukas-reineke/headlines.nvim",
    enabled = Is_Enabled("headlines"),
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ cmp-bootstrap --> Moved to nvim-cmp dependencies
  {
    "Jezda1337/cmp_bootstrap",
    enabled = Is_Enabled("cmp_bootstrap"),
    opts = {
      file_types = {
        "html",
        "htmldjango",
      },
      url = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Tabnine
  {
    "tzachar/cmp-tabnine",
    enabled = Is_Enabled("TabNine"),
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ lspkind
  { "onsails/lspkind.nvim" },
  -- ----------------------------------------------------------------------- }}}
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
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Codeium
  {
    "Exafunction/codeium.vim",
    enabled = Is_Enabled("Codeium"),
  },
  -- ----------------------------------------------------------------------- }}}
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
  -- ----------------------------------------------------------------------- }}}
  -- {{{ LSP lines
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    enabled = Is_Enabled("lsp_lines"),
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      require("lsp_lines").setup()
    end,
  },
  -- ----------------------------------------------------------------------- }}}
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
  -- ----------------------------------------------------------------------- }}}
  -- {{{ fzf-lua
  {
    "ibhagwan/fzf-lua",
    enabled = Is_Enabled("fzf-lua"),
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Mini-clue
  {
    "echasnovski/mini.clue",
    enabled = Is_Enabled("mini.clue"),
    version = false,
    config = function()
      require("mini.clue").setup()
      require("plugins.configs.miniclue")
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Drop.nvim
  {
    "folke/drop.nvim",
    enabled = Is_Enabled("drop"),
    event = "VimEnter",
    opts = {
      theme = "summer",
      max = 40,
      interval = 150,
      screensaver = 1000 * 60 * 5, --5 minute
      filetypes = { "dashboard", "alpha", "starter" },
    },
    config = function(_, opts)
      require("drop").setup(opts)
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Bigfile.nvim
  {
    "LunarVim/bigfile.nvim",
    init = function()
      -- default config
      require("bigfile").setup({
        filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
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
  -- {{{ Mini-statusline
  {
    "echasnovski/mini.statusline",
    enabled = Is_Enabled("mini.statusline"),
    version = false,
    config = function()
      require("mini.statusline").setup()
    end,
  },
  -- ----------------------------------------------------------------------- }}}
}
