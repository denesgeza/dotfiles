Constants = require("config.constants")
local functions = require("config.functions")
local icons = require("lazyvim.config").icons
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  -- {{{ Alpha-nvim
  {
    "goolord/alpha-nvim",
    enabled = Is_Enabled("alpha"),
    event = "VimEnter",
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = Is_Enabled("neo-tree"),
  },
  -- ----------------------------------------------------------------------- }}}
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
        winblend = 0,
        file_ignore_patterns = {
          "^venv/",
          "/venv/",
          "^vendor/",
          "/vendor/",
        },
      },
      pickers = {
        colorscheme = { enable_preview = true },
      },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        cmd = "Telescope",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Mini files
  {
    "echasnovski/mini.files",
    enabled = Is_Enabled("mini.files"),
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = Is_Enabled("bufferline"),
    opts = {
      options = {
        separator_style = "slanted",
        close_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        right_mouse_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        --@type diagnostics = "nvim_lsp | coc",
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
  -- {{{ noice
  {
    "folke/noice.nvim",
    enabled = Is_Enabled("noice.nvim"),
    event = "VeryLazy",
    opts = function(_, opts)
      if Use_Defaults("noice.nvim") then
        opts = opts
      else
        opts.presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        }
        opts.views = {
          cmdline_popup = {
            position = { row = 15, col = "50%" },
            size = { height = "auto", width = 60 },
          },
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
  -- -- ----------------------------------------------------------------------- }}}
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
        opts.timeout = 3000
        opts.top_down = true
      end
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ whichkey
  {
    "folke/which-key.nvim",
    enabled = Is_Enabled("which-key"),
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.      },
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "Surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "Tabs" },
        ["<leader>b"] = { name = "Buffer(s)" },
        ["<leader>c"] = { name = "Code" },
        ["<leader>d"] = { name = "Debug" },
        ["<leader>da"] = { name = "Adapters" },
        ["<leader>f"] = { name = "Find" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "Quit/session" },
        ["<leader>o"] = { name = "Options" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>t"] = { name = "Terminal" },
        ["<leader>n"] = { name = "Neorg" },
        ["<leader>m"] = { name = "Copilot" },
        ["<leader>r"] = { name = "Reload" },
        ["<leader>u"] = { name = "UI" },
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
    opts = {
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- component_separators = { left = " ", right = " " },
        -- section_separators = { left = " ", right = " " },
      },
      sections = {
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
        },
        lualine_y = {},
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-cmp
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
      {
        "Jezda1337/cmp_bootstrap",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        -- "tzachar/cmp-ai",
      },
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
      local lspkind = require("lspkind")
      local source_mapping = {
        buffer = "[Buffer]",
        bootstrap = "[BS]",
        luasnip = "[LSnip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        cmp_tabnine = "[TN]",
        path = "[Path]",
        copilot = "[GC]",
      }
      local compare = require("cmp.config.compare")

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        -- { name = "bootstrap" },
        { name = "luasnip" },
        -- { name = "cmp_tabnine" },
        -- { name = "cmp_ai" },
      }))
      opts.window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:MyPMenu,FloatBorder:MyPMenu,Cursorline:MyPMenuSel,Search:None",
        }),
        experimental = {
          ghost_text = true,
          native_menu = false,
        },
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:MyPMenu,Cursorline:PMenuSel,Search:None",
        }),
      }
      opts.formatting = {
        format = function(entry, vim_item)
          -- if you have lspkind installed, you can use it like
          -- in the following line:
          vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
          vim_item.menu = source_mapping[entry.source.name]
          if entry.source.name == "copilot" then
            local detail = (entry.completion_item.labelDetails or {}).detail
            vim_item.kind = ""
            if detail and detail:find(".*%%.*") then
              vim_item.kind = vim_item.kind .. " " .. detail
            end

            if (entry.completion_item.data or {}).multiline then
              vim_item.kind = vim_item.kind .. " " .. "[ML]"
            end
          end
          local maxwidth = 80
          vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
          return vim_item
        end,
      }
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          -- require("cmp_tabnine.compare"),
          compare.order,
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.kind,
          compare.sort_text,
          compare.length,
        },
      }
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
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
    },
  },
  ----------------------------------------------------------- }}}
  -- {{{ null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = Is_Enabled("null-ls"),
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
          -- nls.builtins.formatting.djlint,
          -- DIAGNOSTICS
          -- nls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "100" } }),
          -- nls.builtins.diagnostics.ruff,
          -- nls.builtins.diagnostics.tsc, -- typescript
          -- nls.builtins.diagnostics.djlint, -- djangohtml, html
          -- CODE ACTIONS
          nls.builtins.code_actions.eslint_d,
          nls.builtins.code_actions.proselint,
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
  -- {{{ LSP Config
  {
    "neovim/nvim-lspconfig",
    enabled = Is_Enabled("lspconfig"),
    dependencies = {
      "b0o/SchemaStore.nvim",
      version = false,
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
      },
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = Constants.lsp.setup,
    },
  },
  -- -- ----------------------------------------------------------------------- }}}
  -- {{{ DAP
  {
    "mfussenegger/nvim-dap",
    enabled = Is_Enabled("dap"),
    dependencies = {
      -- fancy UI for the debugger
      {
        "rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
        opts = {},
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },

      -- which key integration
      {
        "folke/which-key.nvim",
        optional = true,
        opts = {
          defaults = {
            ["<leader>d"] = { name = "Debug" },
            ["<leader>da"] = { name = "Adapters" },
          },
        },
      },

      -- mason.nvim integration
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
    },

  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

    config = function()
      local Config = require("lazyvim.config")
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ mini.hipatterns
  { "echasnovski/mini.hipatterns", version = false, enabled = Is_Enabled("mini.hipatterns") },
  -- ----------------------------------------------------------------------- }}}
}
