local Is_Enabled = require("config.functions").is_enabled
local Icons = require("settings.icons")

---@diagnostic disable: missing-fields
return {
  "saghen/blink.cmp",
  enabled = Settings.completion == "blink",
  opts_extend = { "sources.default" },

  -- version = "v0.*",
  dependencies = {
    { "rafamadriz/friendly-snippets", enabled = Settings.cmp_engine == "luasnip" },
    {
      "L3MON4D3/LuaSnip",
      enabled = Settings.cmp_engine == "luasnip",
      version = "v2.*",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
      end,
    },
    { "kristijanhusak/vim-dadbod-completion", enabled = Is_Enabled("dadbod") },
    { "fang2hou/blink-copilot", enabled = Is_Enabled("blink-copilot") },
  },
  opts = {},
  config = function(_, opts)
    ---@module 'blink.cmp'
    -- Disable for certain filetypes
    opts.enabled = function()
      return not vim.tbl_contains({ "typr" }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
    end
    -- opts.snippets = { preset = "luasnip" }
    opts.sources = {
      default = { "lsp", "path", "buffer", "omni" },
      cmdline = {},
      providers = {
        lsp = { score_offset = 1000 },
        buffer = { score_offset = 800 },
        path = { score_offset = 700 },
        omni = { score_offset = 1000, name = "Omni", module = "blink.cmp.sources.omni" },
        -- snippets = { score_offset = 900 },
      },
    }
    -- Extend sources.default if the plugin is enabled
    if Is_Enabled("dadbod") then
      table.insert(opts.sources.default, 1, "dadbod")
      opts.sources.providers.dadbod = {
        name = "Dadbod",
        module = "vim_dadbod_completion.blink",
        score_offset = 950,
      }
    end

    if Is_Enabled("blink-copilot") then
      table.insert(opts.sources.default, 1, "copilot")
      opts.sources.providers.copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 800,
        async = true,
        opts = {
          max_completions = 3,
          max_attempts = 4,
        },
      }
    end

    if Settings.cmp_engine == "luasnip" then
      table.insert(opts.sources.default, 1, "snippets")
      opts.snippets = { preset = "luasnip" }
      opts.sources.providers.snippets = {
        score_offset = 900,
      }
    end
    opts.appearance = {
      highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
      kind_icons = Icons.blink,
    }
    opts.keymap = {
      -- see https://cmp.saghen.dev/configuration/keymap.html
      preset = "enter", ---@type 'enter' | 'default' | 'super-tab'
      -- Disabled keys
      -- ["<Tab>"] = {},
    }
    opts.completion = {
      menu = {
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        border = "single", ---@type 'single' | 'double' | 'padded' | 'solid' | 'shadow' | 'none'
        -- Don't show the menu on cmdline or search
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
        end,
        draw = {
          -- columns = { { "label", "label_description", gap = 3 }, { "kind_icon", "kind" } },
          components = {
            kind_icon = {
              ellipsis = false,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          border = "single", ---@type 'single' | 'double' | 'padded' | 'solid' | 'shadow' | 'none'
        },
      },
      ghost_text = { enabled = false },
      accept = {
        -- create_undo_points = true,
        auto_brackets = {
          enabled = true,
          default_brackets = { "(", ")" },
          override_brackets_for_filetypes = {
            tex = { "{", "}" },
          },
        },
      },
    }
    opts.signature = { window = { border = "single" } }
    -- }
    require("blink.cmp").setup(opts)
  end,
}
