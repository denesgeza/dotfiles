Is_enabled = require("core.functions").is_enabled
local icons = require("core.icons")

if not Is_enabled("cmp-native-snippets") then
  return {}
end

return {
  "hrsh7th/nvim-cmp",
  enabled = Is_enabled("cmp-native-snippets"),
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init({
        mode = "symbol", ---@type 'symbol' | 'text' | 'symbol_text'| 'text_symbol'
        preset = "codicons", ---@type 'default' | 'codicons'
        symbol_map = icons.lsp,
      })
    end,
  },
  ---@class opts cmp.ConfigSchema
  opts = function()
    local cmp = require("cmp")
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    return {
      auto_brackets = { "python" },
      performance = { max_view_entries = 12 },
      view = { entries = { follow_cursor = true } },
      completion = { completeopt = "menu,menuone,noinsert" },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      window = {
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
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
        { name = "copilot", group_index = 1, priority = 100 },
      }),
      experimental = {
        ghost_text = { hl_group = "CmpGhostText" },
      },
      sorting = require("cmp.config.default")().sorting,
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 20,
            ellipsis_char = "...",
            symbol_map = { Copilot = " " },
          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })

          if strings[1] == "Copilot" then
            strings[1] = icons.cmp["Copilot"]
          end
          kind.kind = " " .. (strings[1] or "") .. " "
          return kind
        end,
        expandable_indicator = true,
      },
    }
  end,
  ---@param opts cmp.ConfigSchema | {auto_brackets?: string[]}
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    local cmp = require("cmp")
    local Kind = cmp.lsp.CompletionItemKind
    cmp.setup(opts)
    cmp.event:on("confirm_done", function(event)
      if not vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
        return
      end
      local entry = event.entry
      local item = entry:get_completion_item()
      if vim.tbl_contains({ Kind.Function, Kind.Method }, item.kind) then
        local keys = vim.api.nvim_replace_termcodes("()<left>", false, false, true)
        vim.api.nvim_feedkeys(keys, "i", true)
      end
    end)
  end,
}
