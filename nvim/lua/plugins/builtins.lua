Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  -- {{{ Telescope
  {
    "nvim-telescope/telescope.nvim",
    enabled = Is_Enabled("telescope.nvim"),
    cmd = "Telescope",
    keys = false,
    opts = {
      defaults = {
        layout_config = { prompt_position = "bottom" },
        layout_strategy = "horizontal",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "descending",
        winblend = 3,
      },
      pickers = {
        colorscheme = { enable_preview = true },
      },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Telescope fzf native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = Is_Enabled("telescope-fzf-native.nvim"),
    cmd = "Telescope",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = Is_Enabled("bufferline"),
    opts = {
      options = {
        separator_style = "slope",
        close_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        right_mouse_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        -- diagnostics = "nvim_lsp",
        diagnostics = "",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ bufferline v2
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function()
      local Offset = require("bufferline.offset")
      if not Offset.edgy then
        local get = Offset.get
        Offset.get = function()
          if package.loaded.edgy then
            local layout = require("edgy.config").layout
            local ret = { left = "", left_size = 0, right = "", right_size = 0 }
            for _, pos in ipairs({ "left", "right" }) do
              local sb = layout[pos]
              if sb and #sb.wins > 0 then
                local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
                ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
                ret[pos .. "_size"] = sb.bounds.width
              end
            end
            ret.total_size = ret.left_size + ret.right_size
            if ret.total_size > 0 then
              return ret
            end
          end
          return get()
        end
        Offset.edgy = true
      end
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ edgy
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
    -- stylua: ignore
    { "<leader>ue", function() require("edgy").select() end, desc = "Edgy Select Window" },
    },
    opts = {
      bottom = {
        { ft = "toggleterm", size = { height = 0.4 } },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { ft = "spectre_panel", size = { height = 0.4 } },
      },
      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        {
          title = "Neo-Tree Git",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        {
          title = "Neo-Tree Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        {
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutline",
        },
        "neo-tree",
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = Is_Enabled("noice.nvim"),
    keys = false,
    opts = function(_, opts)
      if Use_Defaults("noice.nvim") then
        -- Use LazyVim default setup.
        opts = opts
      else
        -- Use my customizations.
        opts.presets = {
          bottom_search = false,
          lsp_doc_border = true,
        }

        opts.cmdline_popup = {
          views = { position = { row = "50%", col = "50%" } },
        }

        opts.lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        }

        opts.routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
            },
            opts = { skip = true },
          },

          {
            filter = {
              event = "msg_show",
              kind = "wmsg",
            },
            opts = { skip = true },
          },
        }
      end
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-notify
  {
    "rcarriga/nvim-notify",
    enabled = Is_Enabled("notify"),
    opts = function(_, opts)
      if Use_Defaults("notify") then
        -- Use LazyVim default setup.
        opts = opts
      else
        opts.background_colour = "#1a1b26"
        opts.timeout = 1500
        opts.top_down = false
      end
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "Surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "Tabs" },
        ["<leader>b"] = { name = "Buffer(s)" },
        ["<leader>c"] = { name = "Code" },
        ["<leader>f"] = { name = "Find" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "Quit/session" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>T"] = { name = "Terminal" },
        ["<leader>n"] = { name = "Neorg" },
        ["<leader>u"] = { name = "UI" },
        ["<leader>v"] = { name = "VIM/Select commands" },
        ["<leader>w"] = { name = "Windows" },
        ["<leader>x"] = { name = "Diagnostics/quickfix" },
        ["z"] = { name = "Folding" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    enabled = Is_Enabled("lualine"),
    opts = function(_, opts)
      if Use_Defaults("lualine") then
        -- Use LazyVim default setup.
        opts = opts
      else
        opts = opts
        opts.options.theme = "auto"
        opts.options.component_separators = { left = "", right = "" }
        opts.options.section_separators = { left = "", right = "" }
      end
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ <tab> LuaSnip/nvim-cmp
  -- -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
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

            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  ----------------------------------------------------------- }}}
  -- {{{ mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = Constants.mason,
    },
  },
  ----------------------------------------------------------- }}}
  -- {{{ null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- FORMATTING
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.black,
          nls.builtins.formatting.djhtml,
          nls.builtins.formatting.djlint,
          -- DIAGNOSTICS
          nls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "100" } }),
          nls.builtins.diagnostics.ruff,
          nls.builtins.diagnostics.tsc, -- typescript
          nls.builtins.diagnostics.djlint, -- djangohtml, html
          -- CODE ACTIONS
          nls.builtins.code_actions.eslint,
          nls.builtins.code_actions.eslint_d,
          nls.builtins.code_actions.proselint,
          nls.builtins.code_actions.refactoring,
        },
      }
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Git Signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = Is_Enabled("gitsigns"),
    opts = function(_, opts)
      if Use_Defaults("gitsigns") then
        -- Use LazyVim default setup.
        opts = opts
      else
        opts = opts
        opts.signs = Constants.icons.gitsigns
      end
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Flit
  { "ggandor/flit.nvim", enabled = Is_Enabled("flit.nvim") },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Leap
  { "ggandor/leap.nvim", enabled = Is_Enabled("leap.nvim") },
  -- ----------------------------------------------------------------------- }}}
  -- -- {{{ LSP Config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = Constants.lsp.diagnostics, -- add any global capabilities here
      capabilities = {},
      autoformat = true,
      format_notify = true,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        eslint = Constants.lsp.servers.eslint,
        jsonls = Constants.lsp.servers.jsonls,
        lua_ls = Constants.lsp.servers.lua_ls,
        tsserver = Constants.lsp.servers.tsserver,
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = Constants.lsp.setup,
    },
  },
  -- -- ----------------------------------------------------------------------- }}}
  -- {{{ DAP
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = function(_, opts)
      opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types
        or { "terminal", "Trouble", "qf", "Outline" }
      table.insert(opts.open_files_do_not_replace_types, "edgy")
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ python dap
  -- {
  --   "mfussenegeer/nvim-dap-python",
  --   ft = "python",
  --   config = function(_, opts)
  --     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  --     require("dap-python").setup(path)
  --   end,
  -- },
  -- ----------------------------------------------------------------------- }}}
}
