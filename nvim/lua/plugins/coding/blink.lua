local Icons = require("settings.icons")

---@diagnostic disable: missing-fields
return {
  "saghen/blink.cmp",
  enabled = Settings.completion == "blink",
  opts_extend = { "sources.default" },
  version = "v0.*",
  dependencies = {
    { "rafamadriz/friendly-snippets", enabled = Settings.cmp_engine == "luasnip" },
    {
      "L3MON4D3/LuaSnip",
      enabled = Settings.cmp_engine == "luasnip",
      build = (not LazyVim.is_win())
          and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
        or nil,
      version = "v2.*",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
      end,
    },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "typr" }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
    end,
    appearance = {
      kind_icons = Icons.blink,
    },
    completion = {
      menu = {
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        border = "single", ---@type 'single' | 'double' | 'padded' | 'solid' | 'shadow' | 'none'
        -- Don't show the menu on cmdline or search
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
        end,
        draw = {
          components = {
            kind_icon = {
              ellipsis = true,
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
    },
    signature = {
      enabled = true,
      window = { border = "single" },
    },
    -- snippets = { preset = "luasnip" },
    sources = {
      providers = {
        lsp = { score_offset = 1000 },
        buffer = { score_offset = 800 },
        path = { score_offset = 700 },
        -- omni = { score_offset = 1000, name = "Omni", module = "blink.cmp.sources.omni" },
        snippets = { score_offset = 1000, min_keyword_length = 3 },
      },
    },
    keymap = {
      preset = "enter", ---@type 'enter' | 'default' | 'super-tab'
    },
  },
}
