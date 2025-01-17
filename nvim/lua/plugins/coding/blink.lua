local Is_Enabled = require("config.functions").is_enabled

---@diagnostic disable: missing-fields
return {
  "saghen/blink.cmp",
  enabled = Settings.completion == "blink",
  opts_extend = { "sources.default" },
  -- version = "v0.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    -- "giuxtaposition/blink-cmp-copilot",
    "L3MON4D3/LuaSnip",
    {
      "kristijanhusak/vim-dadbod-completion",
      enabled = Is_Enabled("dadbod"),
    },
  },
  config = function()
    ---@module 'blink.cmp'
    local opts = {
      sources = {
        -- min_keyword_length = 2,
        cmdline = {},
        providers = {
          snippets = { score_offset = 1000 },
          lsp = { score_offset = 900 },
          buffer = { score_offset = 800 },
          path = { score_offset = 700 },
        },
      },
      -- sources = {
      --   min_keyword_length = 2,
      --   -- default = { "snippets", "luasnip" },
      --   -- default = { "lsp", "path", "snippets", "buffer", "copilot", "luasnip", "dadbod" },
      --   default = { "lsp", "path", "buffer", "copilot", "luasnip", "dadbod" },
      --   providers = {
      --     lsp = {
      --       name = "lsp",
      --       enabled = true,
      --       module = "blink.cmp.sources.lsp",
      --       score_offset = 1000,
      --     },
      --     -- luasnip = {
      --     --   name = "luasnip",
      --     --   enabled = true,
      --     --   module = "blink.cmp.sources.luasnip",
      --     --   score_offset = 950,
      --     -- },
      --     snippets = {
      --       name = "snippets",
      --       enabled = true,
      --       module = "blink.cmp.sources.snippets",
      --       score_offset = 900,
      --     },
      --     dadbod = {
      --       name = "Dadbod",
      --       enabled = true,
      --       module = "vim_dadbod_completion.blink",
      --       score_offset = 950,
      --     },
      --     copilot = {
      --       name = "copilot",
      --       enabled = true,
      --       module = "blink-cmp-copilot",
      --       score_offset = -100,
      --       async = true,
      --       transform_items = function(_, items)
      --         local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
      --         local kind_idx = #CompletionItemKind + 1
      --         CompletionItemKind[kind_idx] = "Copilot"
      --         for _, item in ipairs(items) do
      --           item.kind = kind_idx
      --         end
      --         return items
      --       end,
      --     },
      --     path = { enabled = true },
      --     buffer = { enabled = true },
      --   },
      -- },
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
        kind_icons = {
          Text = "󰉿",
          Method = "󰊕",
          Function = "󰊕",
          Constructor = "󰒓",

          Field = "󰜢",
          Variable = "󰆦",
          Property = "󰖷",

          Class = "󱡠",
          Interface = "󱡠",
          Struct = "󱡠",
          Module = "󰅩",

          Unit = "󰪚",
          Value = "󰦨",
          Enum = "󰦨",
          EnumMember = "󰦨",

          Keyword = "󰻾",
          Constant = "󰏿",

          Snippet = "󱄽",
          LSP = "󰄴 ",
          Color = "󰏘",
          File = "󰈔",
          Reference = "󰬲",
          Folder = "󰉋",
          Event = "󱐋",
          Operator = "󰪚",
          TypeParameter = "󰬛",
          Copilot = " ",
          Dadbod = "󰆼 ",
        },
      },
      snippets = { preset = "luasnip" },
      keymap = {
        -- see https://cmp.saghen.dev/configuration/keymap.html
        preset = "enter", ---@type 'enter' | 'default' | 'super-tab'
        -- Disabled keys
        -- ["<Tab>"] = {},
      },
      completion = {
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
                -- text = function(ctx)
                --   local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                --   return kind_icon
                -- end,
                -- Optionally, you may also use the highlights from mini.icons
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
          -- selection = "preselect", ---@type 'preselect' | 'manual' | 'auto_insert'
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
      },
      signature = { window = { border = "single" } },
    }
    require("blink.cmp").setup(opts)
  end,
}
