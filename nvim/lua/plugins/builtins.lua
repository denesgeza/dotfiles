-- Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  -- {{{ Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },
  -- }}}
  -- {{{ LSPconfig
  -- }}}
  -- {{{ Telescope
  {
    "nvim-telescope/telescope.nvim",
    -- keys = false,
    opts = {
      defaults = {
        file_ignore_patterns = {
          "^venv/",
          "/venv/",
          "^vendor/",
          "/vendor/",
        },
      },
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
          enabled = true,
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
        height = { min = 4, max = 4 }, -- min and max height of the columns
        width = { min = 20, max = 40 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", ---@type "left" | "center" | "right"
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
        ["<leader>d"] = { name = "Debug/Database" },
        ["<leader>f"] = { name = "Find" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>h"] = { name = "Harpoon" },
        ["<leader>q"] = { name = "Quit/session" },
        ["<leader>o"] = { name = "Options" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>t"] = { name = "Terminal" },
        ["<leader>n"] = { name = "Neorg" },
        ["<leader>m"] = { name = "Copilot/MultiCursor" },
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
  -- }}}
  -- {{{ notify
  {
    "rcarriga/nvim-notify",
    enabled = Is_Enabled("notify"),
    opts = {
      background_colour = "#1a1b26",
      timeout = 3000,
      top_down = true,
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
          },
          presets = {
            ---@type boolean
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
          },
          cmdline = {
            view = "cmdline",
            format = {
              search_down = {
                view = "cmdline",
              },
              search_up = {
                view = "cmdline",
              },
            },
          },
          popupmenu = {
            enabled = true,
            backend = "cmp", ---@type "nui" | "cmp"
          },
        }
      end
    end,
  },
  -- }}}
  -- {{{ lualine
  {
    "nvim-lualine/lualine.nvim",
    event = { "VimEnter", "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("lualine"),
    opts = function(_, opts)
      local theme = {
        normal = {
          a = { fg = "#f3f3f3", bg = "#2D4F67" },
          b = { fg = "#b8c0e0", bg = "#45475a" },
          c = { fg = "#f3f3f3", bg = "NONE" },
          x = { fg = "#f3f3f3", bg = "NONE" },
          y = { fg = "#f3f3f3", bg = "#383a42" },
          z = { fg = "#f3f3f3", bg = "#2D4F67" },
        },
        insert = {
          a = { fg = "#383a42", bg = "#91d7e3" },
          b = { fg = "#383a42", bg = "#91d7e3" },
          c = { fg = "#f3f3f3", bg = "#45475a" },
        },
        visual = {
          a = { fg = "#383a42", bg = "#f2cdcd" },
          b = { fg = "#383a42", bg = "#f2cdcd" },
          c = { fg = "#f3f3f3", bg = "#45475a" },
        },
        replace = {
          a = { fg = "#383a42", bg = "#E46876" },
          b = { fg = "#383a42", bg = "#E46876" },
          c = { fg = "#f3f3f3", bg = "#45475a" },
        },
        command = {
          a = { fg = "#383a42", bg = "#fab387" },
          b = { fg = "#383a42", bg = "#fab387" },
          c = { fg = "#f3f3f3", bg = "#45475a" },
        },
      }

      if Use_Defaults("lualine") then
        opts = opts
      else
        opts = opts
        opts.options = {
          theme = theme, ---@type table | "auto" -- auto will use the theme that the colorscheme is using
          globalstatus = false,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        }
        opts.sections.lualine_b = { { "branch", icon = "" }, functions.modified }
        opts.sections.lualine_y = {
          { functions.get_name, cond = functions.is_active },
          functions.search_result,
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
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind-nvim",
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

      if Use_Defaults("nvim-cmp") then
        opts = opts
      else
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
        opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
          { name = "neorg" },
          { name = "vim-dadbod-completion" },
        }))
        opts.window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:MyPMenuSel,Search:None",
            col_offset = -3,
            side_padding = 0,
            border = "none", ---@type "single" | "double" | "shadow" | "none"
            scrollbar = true,
          },
          documentation = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:MyPMenuSel,Search:None",
            col = { min = 0, max = 80 },
            border = "none", ---@type "single" | "double" | "shadow" | "none"
            offset = { 5, 1 },
            scrollbar = true,
          },
        }
        opts.formatting = {
          fields = { "kind", "abbr", "menu" },
          expandable_indicator = true,
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
          end,
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
      -- format_on_save = function(bufnr)
      --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      --     return
      --   end
      --   return { timeout_ms = 1000, lsp_fallback = true }
      -- end,
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
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
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
          enabled = true,
          debounce = 75,
          auto_trigger = true,
          keymap = {
            accept = "<C-;>",
            next = "<C-]>", -- Option + ]
            prev = "<C-[>",
            dismiss = "<C-'>",
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
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  { "zbirenbaum/copilot-cmp", enabled = false },
  -- }}}
  -- {{{ vim-repeat
  { "tpope/vim-repeat", event = "VeryLazy" },
  -- }}}
}
