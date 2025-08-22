local Icons = require 'config.icons'
local borders = 'single' ---@type 'single' | 'double' | 'padded' | 'solid' | 'shadow' | 'none'

vim.pack.add {
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '*' },
}

require('luasnip').setup {}
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip').filetype_extend('html', { 'htmldjango' })
require('luasnip').filetype_extend('htmldjango', { 'html' })

require('blink.cmp').setup {
  -- fuzzy = { implementation = 'prefer_rust', prebuilt_binaries = { force_version = '1.6.0' } },
  appearance = {
    kind_icons = Icons.blink,
    nerd_font_variant = 'mono',
  },
  completion = {
    menu = {
      -- winhighlight                                                   =  "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      border = borders,
      -- Don't show the menu on cmdline or search
      auto_show = function(ctx)
        return ctx.mode ~= 'cmdline' or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
      end,
      draw = {
        components = {
          kind_icon = {
            ellipsis = true,
            -- added
            -- text                                                     =  function(ctx)
            -- local kind_icon, _, _                                    =  require("mini.icons").get("lsp", ctx.kind)
            -- return kind_icon
            -- end,
            -- end added
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
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
        -- winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        border = borders,
      },
    },
    ghost_text = { enabled = false },
    accept = {
      -- create_undo_points                                             =  true,
      auto_brackets = {
        enabled = true,
        default_brackets = { '(', ')' },
        override_brackets_for_filetypes = {
          tex = { '{', '}' },
        },
      },
    },
    list = {
      selection = {
        preselect = true, -- if preset is 'enter' this should be false
        -- preselect = function(ctx) -- preset is 'super-tab'
        --   return not require("blink.cmp").snippet_active({ direction =  1 })
        -- end,
      },
    },
    trigger = { show_in_snippet = false },
  },
  signature = { enabled = true, window = { border = borders } },
  -- snippets =  { preset=  "luasnip" },
  sources = {
    providers = {
      lsp = { score_offset = 1000 },
      buffer = { score_offset = 800 },
      path = { score_offset = 700 },
      -- omni =  { score_offset = 1000, name = "Omni", module = "blink.cmp.sources.omni" },
      snippets = { score_offset = 1000, min_keyword_length = 2 },
    },
  },
  keymap = {
    preset = 'super-tab', ---@type 'enter' | 'default' | 'super-tab' | 'none'
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_next()
        end
      end,
      -- "select_next",
      'snippet_forward',
      'fallback',
    },
    ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    -- enter = { accept = "<CR>", select = "<C-n>" },
  },
}

vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  callback = function()
    local blink = require 'blink.cmp'
    if blink then
      blink.show()
    end
  end,
  desc = 'Start blink.cmp on insert mode',
})
