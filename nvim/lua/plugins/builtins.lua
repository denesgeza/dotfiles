-- Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults
local icons = require("config.icons")
local Util = require("lazyvim.util")

return {
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
        position = "left", ---@type "left" | "right" | "top" | "bottom" | "float" | "current"
        mappings = {
          ["e"] = "noop",
        },
      },
      -- source_selector = {
      --   statusline = false,
      --   winbar = true,
      --   content_layout = "center",
      -- },
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
        if ok and stats ~= nil and stats.size > max_filesize then
          return true
        end
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
      ensure_installed = {
        "black",
        "emmet-language-server",
        "debugpy",
        "isort",
        "jq",
        "json-lsp",
        "lua-language-server",
        "basedpyright",
        -- "pyright",
        "prettier",
        "prettierd",
        "rust-analyzer",
        "ruff-lsp",
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
          prefix = "icons", ---@type "icons" |""
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
      inlay_hints = { enabled = true },
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
            ["ui-select"] = {
              require("telescope.themes").get_dropdown(),
            },
          },
        },
      })
      -- Enable telescope extensions, if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
    end,
    keys = {
      { "<leader><space>", false },
      {
        mode = { "n" },
        "<leader>sb",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>",
        desc = "Buffer",
      },
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
        ["<leader>f"] = { name = "Find" },
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
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
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
              enabled = false,
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
            command_palette = false, -- position the cmdline and popupmenu together if false
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
      local theme_colors = require("config.colors")
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
  -- {{{ nvim-cmp
  {
    "L3MON4D3/LuaSnip",
    enabled = Is_Enabled("luasnip"),
    keys = function()
      return {}
    end,
    init = function()
      -- My Snippets
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init({
          symbol_map = { Copilot = " " },
        })
      end,
    },
    -- opts = {
    --   performance = { max_view_entries = 7 },
    --   window = {
    --     completion = {
    --       winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PMenuSel,Search:None",
    --       col_offset = -3,
    --       side_padding = 0,
    --       border = "none", ---@type "single" | "double" | "shadow" | "none"
    --       scrollbar = false,
    --     },
    --     documentation = {
    --       winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --       border = "single", ---@type "single" | "double" | "shadow" | "none"
    --       scrollbar = false,
    --     },
    --   },
    --   formatting = {
    --     fields = { "kind", "abbr", "menu" },
    --     format = function(entry, vim_item)
    --       local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 20, ellipsis_char = "..." })(
    --         entry,
    --         vim_item
    --       )
    --       local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --
    --       if strings[1] == "Copilot" then
    --         strings[1] = icons["Copilot"]
    --       else
    --       end
    --       kind.kind = " " .. (strings[1] or "") .. " "
    --       return kind
    --     end,
    --     expandable_indicator = true,
    --   },
    -- },
    ---@class opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      luasnip.filetype_extend("quarto", { "markdown" })
      luasnip.filetype_extend("typescript", { "javascript" })

      if Use_Defaults("nvim-cmp") then
        opts = opts
      else
        opts.performance = { max_view_entries = 10 }
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-space>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
        })
        opts.window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PMenuSel,Search:None",
            col_offset = -3,
            side_padding = 0,
            border = "none", ---@type "single" | "double" | "shadow" | "none"
            scrollbar = false,
          },
          documentation = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            border = "single", ---@type "single" | "double" | "shadow" | "none"
            scrollbar = false,
          },
        }
        opts.formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 20, ellipsis_char = "..." })(
              entry,
              vim_item
            )
            -- local source = entry.source.name
            local strings = vim.split(kind.kind, "%s", { trimempty = true })

            -- kind.menu  --> This shows the text at the end of the snippet
            -- kind.menu = (icons[source] or " ")
            if strings[1] == "Copilot" then
              strings[1] = icons["Copilot"]
              -- kind.menu = (icons["Copilot"] or " ") .. "    (" .. "Sugg..." .. ")"
              -- kind.menu = (icons["Copilot"] or " ")
            else
              -- kind.menu = (icons[source] or " ") .. "    (" .. (strings[2] or "") .. ")"
              -- kind.menu = (icons[source] or " ")
            end

            -- kind.kind --> This shows the icon before the snippet
            kind.kind = " " .. (strings[1] or "") .. " "

            return kind
          end,
          expandable_indicator = true,
        }
        opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
          { name = "nvim_lsp_signature_help" },
        }))
        if Is_Enabled("neorg") then
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
            { name = "neorg" },
          }))
        end
        if Is_Enabled("dadbod") then
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
            { name = "vim-dadbod-completion" },
          }))
        end
        if Is_Enabled("quarto") then
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
            { name = "otter" },
          }))
        end
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
      scope = {
        enabled = true,
        show_start = true,
      },
    },
  },
  -- }}}
  -- {{{ conform.nvim
  {
    "stevearc/conform.nvim",
    enabled = Is_Enabled("conform"),
    opts = {
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
        markdown = { "prettierd" },
        sh = { "shfmt" },
        toml = { "taplo" },
        yaml = { "yamlfmt" },
        zsh = { "beautysh" },
        rust = { "rustfmt" },
        python = { "isort", "black" },
      },
    },
    keys = {
      { mode = { "n" }, "<leader>ci", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
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
      linters = {
        -- TODO: Test this
        -- python = {
        --   -- Example of overriding a linter's options
        --   ruff = {
        --     condition = function(ctx)
        --       return vim.fn.findfile("pyproject.toml", ctx.cwd) ~= ""
        --     end,
        --     args = { "--config", vim.fn.expand(vim.fn.findfile("pyproject.toml")) },
        --   },
        -- },
        -- -- Example of using selene only when a selene.toml file is present
        -- selene = {
        --   -- `condition` is another LazyVim extension that allows you to
        --   -- dynamically enable/disable linters based on the context.
        --   condition = function(ctx)
        --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
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
        enabled = true, -- set to true to show ghost text and disable in cmp
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
        -- html = false,
        -- htmldjango = false,
        ["."] = false,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
      server_opts_overrides = {},
    },
    -- config = function(_, opts)
    --   local cmp = require("cmp")
    --   local copilot = require("copilot.suggestion")
    --   -- local luasnip = require("luasnip")
    --
    --   require("copilot").setup(opts)
    --
    --   ---@param trigger boolean
    --   local function set_trigger(trigger)
    --     if not trigger and copilot.is_visible() then
    --       copilot.dismiss()
    --     end
    --     vim.b.copilot_suggestion_auto_trigger = trigger
    --     vim.b.copilot_suggestion_hidden = not trigger
    --   end
    --
    --   -- Hide suggestions when the completion menu is open.
    --   cmp.event:on("menu_opened", function()
    --     set_trigger(false)
    --   end)
    -- cmp.event:on("menu_closed", function()
    --   set_trigger(not luasnip.expand_or_locally_jumpable())
    -- end)
    --
    -- vim.api.nvim_create_autocmd("User", {
    --   desc = "Disable Copilot inside snippets",
    --   pattern = { "LuasnipInsertNodeEnter", "LuasnipInsertNodeLeave" },
    --   callback = function()
    --     set_trigger(not luasnip.expand_or_locally_jumpable())
    --   end,
    -- })
    -- end,
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = Is_Enabled("Copilot-cmp"),
    opts = {},
  },
  -- }}}
  -- {{{ vim-repeat
  { "tpope/vim-repeat", event = "VeryLazy" },
  -- }}}
  -- {{{ bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    enabled = Is_Enabled("bufferline"),
    opts = {
      options = {
        themable = false, ---@type boolean
        diagnostics = "nvim_lsp", ---@type "nvim_lsp" | "coc" | boolean
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin", ---@type "slant" | "slope" | "thick" | "thin"
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon", ---@type "icon" | "underline" | "none"
        },
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
        override_vim_notify = true,
        window = {
          normal_hl = "Normal",
          border = "none",
          winblend = 0,
        },
      },
    },
    init = function()
      vim.notify = require("fidget").notify

      if Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("fidget").notify
        end)
      end
    end,
  },
  -- }}}
  -- {{{ gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    enabled = Is_Enabled("gitsigns.nvim"),
    opts = {
      _extmark_signs = true,
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

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buf, desc = desc })
        end

        -- stylua: ignore start
        -- map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", "Branches" )
        map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", "Status")
        map("n", "<leader>gD", "<cmd>Gitsigns toggle_deleted<cr>", "Toggle Deleted")
        map("n", "<leader>gl", "<cmd>Gitsigns toggle_linehl<cr>", "Toggle LineHL")
      end,
    },
  },
  -- }}}
  -- {{{ mini apps
  { "echasnovski/mini.surround", version = false, enabled = Is_Enabled("mini.surround") },
  { "echasnovski/mini.comment", version = false, enabled = Is_Enabled("mini.comment") },
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
}
