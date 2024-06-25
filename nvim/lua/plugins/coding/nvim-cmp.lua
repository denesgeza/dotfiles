Manager = require("config.manager")
Is_enabled = require("config.functions").is_enabled
local icons = require("settings.icons")

return {
  "hrsh7th/nvim-cmp",
  enabled = Is_enabled("nvim-cmp"),
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init({
          mode = "symbol", ---@type 'symbol' | 'text' | 'symbol_text'| 'text_symbol'
          preset = "codicons", ---@type 'default' | 'codicons'
          symbol_map = icons.lsp,
        })
      end,
    },
  },
  ---@class opts cmp.ConfigSchema
  opts = function()
    local cmp = require("cmp")
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    -- New
    if Manager.cmp == "native" then
      return {
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- Accept currently selected item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
      }
    else
      local luasnip = require("luasnip")
      return {
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
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
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      }
    end
  end,
  config = function(_, opts)
    -- Common config
    local cmp = require("cmp")
    opts.performance = { max_view_entries = 12 }
    opts.view = { entries = { follow_cursor = true } }
    opts.completion = { completeopt = "menu,menuone,noinsert" }
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
    }, {
      { name = "buffer" },
      { name = "copilot", group_index = 1, priority = 100 },
    })
    if Manager.cmp == "luasnip" then
      table.insert(opts.sources, 1, { name = "luasnip", option = { show_autosnippets = true } })
    else
      table.insert(opts.sources, 1, { name = "snippets" })
    end
    opts.experimental = { ghost_text = { hl_group = "CmpGhostText" } }
    opts.sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.score,
        cmp.config.compare.order,
        cmp.config.compare.exact,
        require("copilot_cmp.comparators").prioritize,
        cmp.config.compare.offset,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
      },
    }
    opts.window = {
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PMenuSel,Search:None",
        col_offset = -3,
        side_padding = 0,
        ---@type "single" | "double" | "shadow" | "none" | {}
        border = "single",
        -- border = {
        --   { "󱐋", "LazyCommitType" },
        --   { "─", "Comment" },
        --   { "╮", "Comment" },
        --   { "│", "Comment" },
        --   { "╯", "Comment" },
        --   { "─", "Comment" },
        --   { "╰", "Comment" },
        --   { "│", "Comment" },
        -- },
        scrollbar = true,
      },
      documentation = {
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
        ---@type "single" | "double" | "shadow" | "none" | {}
        border = "single",
        -- border = {
        --   { "", "LazyCommit" },
        --   { "─", "Comment" },
        --   { "╮", "Comment" },
        --   { "│", "Comment" },
        --   { "╯", "Comment" },
        --   { "─", "Comment" },
        --   { "╰", "Comment" },
        --   { "│", "Comment" },
        -- },
        scrollbar = false,
      },
    }
    opts.formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
        local kind = require("lspkind").cmp_format({
          mode = "symbol", ---@type 'symbol' | 'symbol_text'
          maxwidth = 30,
          ellipsis_char = "...",
          symbol_map = { Copilot = " " },
          show_labelDetails = true,
        })(entry, item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        -- kind.menu = icons.cmp[entry.source.name] -- show the icon of the source
        local source_icon = icons.cmp[entry.source.name] -- show the icon of the source

        local fixed_width = 30

        -- Set 'fixed_width' to false if not provided.
        fixed_width = fixed_width or false

        -- Get the completion entry text shown in the completion window.
        local content = item.abbr

        -- Set the fixed completion window width.
        if fixed_width then vim.o.pumwidth = fixed_width end

        -- Get the width of the current window.
        local win_width = vim.api.nvim_win_get_width(0)

        -- Set the max content width based on either: 'fixed_width'
        -- or a percentage of the window width, in this case 20%.
        -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
        local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

        -- Truncate the completion entry text if it's longer than the
        -- max content width. We subtract 3 from the max content width
        -- to account for the "..." that will be appended to it.
        if #content > max_content_width then
          kind.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..." .. (source_icon or "")
        else
          kind.abbr = content .. (" "):rep(max_content_width - #content) .. (source_icon or "")
        end

        kind.kind = " " .. (strings[1] or "") .. " "
        return kind
      end,
      expandable_indicator = true,
    }
    -- End new
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    cmp.setup(opts)
  end,
}
