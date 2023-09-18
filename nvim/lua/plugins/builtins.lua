-- Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  -- {{{ Neodev.nvim
  {
    "folke/neodev.nvim",
    enabled = Is_Enabled("neodev.nvim"),
  },
  -- }}}
  -- {{{ Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = Is_Enabled("neo-tree"),
    opts = {
      source_selector = { winbar = true },
    },
  },
  --  }}}
  -- {{{ Telescope
  {
    "nvim-telescope/telescope.nvim",
    enabled = Is_Enabled("telescope"),
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
  -- }}}
  -- {{{ whichkey
  {
    "folke/which-key.nvim",
    enabled = Is_Enabled("which-key"),
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true,     -- shows a list of your marks on ' and `
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
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000,            -- positive value to position WhichKey above other floating windows.      },
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
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
        ["<leader>d"] = { name = "Debug" },
        ["<leader>da"] = { name = "Adapters" },
        ["<leader>f"] = { name = "Find" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>h"] = { name = "Harpoon" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "Quit/session" },
        ["<leader>o"] = { name = "Options" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>t"] = { name = "Terminal" },
        ["<leader>n"] = { name = "Neorg" },
        ["<leader>m"] = { name = "Copilot/MultiCursor" },
        ["<leader>r"] = { name = "Reload" },
        ["<leader>u"] = { name = "UI" },
        ["<leader>uf"] = { name = "+Format" },
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
        opts.signs = {
          -- add = { text = " " },
          -- change = { text = " " },
          -- delete = { text = " " },
          -- add = { text = " " },
          -- change = { text = " " },
          -- delete = { text = " " },
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "==" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        }
      end
    end,
  },
  -- }}}
  -- {{{ noice
  {
    "folke/noice.nvim",
    enabled = Is_Enabled("noice.nvim"),
    opts = {
      presets = {
        ---@type boolean
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
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
    },
  },
  -- }}}
  -- {{{ lualine
  {
    "nvim-lualine/lualine.nvim",
    -- event = "VeryLazy",
    event = { "VimEnter", "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("lualine"),
    opts = function(_, opts)
      if Use_Defaults("lualine") then
        opts = opts
      else
        local Util = require("lazyvim.util")
        -- Settings for multicursor hydra client {{{
        local function is_active()
          local ok, hydra = pcall(require, "hydra.statusline")
          return ok and hydra.is_active()
        end

        local function get_name()
          local ok, hydra = pcall(require, "hydra.statusline")
          if ok then
            return hydra.get_name()
          end
          return ""
        end -- }}}
        -- Settings for attached lsp clients {{{
        local function get_attached_clients()
          local buf_clients
          if vim.fn.has("nvim-0.10") then
            buf_clients = vim.lsp.get_clients({ bufnr = 0 }) -- get_active_clients if neovim < 0.10
          else
            buf_clients = vim.lsp.get_active_clients()
          end
          if #buf_clients == 0 then
            return "LSP Inactive"
          end

          local buf_ft = vim.bo.filetype
          local buf_client_names = {}

          -- add client
          for _, client in pairs(buf_clients) do
            if client.name ~= "copilot" and client.name ~= "null-ls" then
              table.insert(buf_client_names, client.name)
            end
          end
          -- Add sources (from null-ls)
          -- null-ls registers each source as a separate attached client, so we need to filter for unique names down below.
          local null_ls_s, null_ls = pcall(require, "null-ls")
          if null_ls_s then
            local sources = null_ls.get_sources()
            for _, source in ipairs(sources) do
              if source._validated then
                for ft_name, ft_active in pairs(source.filetypes) do
                  if ft_name == buf_ft and ft_active then
                    table.insert(buf_client_names, source.name)
                  end
                end
              end
            end
          end
          -- This needs to be a string only table so we can use concat below
          local unique_client_names = {}
          for _, client_name_target in ipairs(buf_client_names) do
            local is_duplicate = false
            for _, client_name_compare in ipairs(unique_client_names) do
              if client_name_target == client_name_compare then
                is_duplicate = true
              end
            end
            if not is_duplicate then
              table.insert(unique_client_names, client_name_target)
            end
          end

          local client_names_str = table.concat(unique_client_names, ", ")
          local language_servers = string.format("[%s]", client_names_str)

          return language_servers
        end -- }}}

        local attached_clients = { get_attached_clients }

        return {
          options = {
            theme = "auto",
            ---@type boolean
            globalstatus = false, --if false shown at each window
            component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = "" },
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
          },
          sections = {
            lualine_a = {
              {
                "mode",
                -- fmt = function(str)
                --   return str:sub(1, 1)
                -- end,
              },
            },
            lualine_b = { { get_name, cond = is_active } },
            lualine_c = {
              {
                "diagnostics",
                symbols = {
                  error = "E ",
                  warn = "W ",
                  info = "I ",
                  hint = "H ",
                },
              },
              { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
              { "filename" },
            },
            lualine_x = {
              attached_clients,
              -- stylua: ignore
              {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                color = Util.fg("Statement"),
              },
              -- stylua: ignore
              {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                color = Util.fg("Constant"),
              },
              -- stylua: ignore
              {
                function() return "  " .. require("dap").status() end,
                cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                color = Util.fg("Debug"),
              },
              { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
              "diff",
            },
            lualine_y = { "branch" },
            lualine_z = {
              function()
                return "" .. os.date("%R")
              end,
            },
          },
        }
      end
    end,
  },
  -- }}}
  -- {{{ nvim-cmp
  {
    "L3MON4D3/LuaSnip",
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

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- cmp.confirm({ select = true }) --VSCode style
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
        -- ["<C-e>"] = cmp.mapping.close(),
        -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "neorg" },
      }))
      opts.window = {
        completion = {
          -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
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
    end,
  },
  -- }}}
  -- {{{ null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = Is_Enabled("null-ls"),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- nls.builtins.formatting.stylua,
          -- nls.builtins.formatting.shfmt,
          -- nls.builtins.formatting.isort,
          -- nls.builtins.formatting.black,
          -- nls.builtins.formatting.prettierd,
          -- nls.builtins.diagnostics.ruff,
          -- nls.builtins.diagnostics.eslint_d,
          -- nls.builtins.diagnostics.rstcheck,
        },
      }
    end,
  },
  -- }}}
  -- {{{ indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    branch = "v2",
    enabled = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    branch = "v3",
    config = function()
      local hl_name_list = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterBlue",
        "RainbowDelimiterCyan",
        "RainbowDelimiterViolet",
      }
      require("ibl").setup({
        scope = {
          enabled = true,
          show_start = true,
          highlight = hl_name_list,
        },
      })
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
  -- }}}
}
