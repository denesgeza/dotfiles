vim.pack.add {
  { src = 'https://github.com/akinsho/bufferline.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/folke/which-key.nvim' },
}

-- Bufferline {{{
require('bufferline').setup {
  options = {
    offsets = { { filetype = 'snacks_layout_box' } },
    -- mode = 'buffers',
    themable = true, ---@type boolean
    -- diagnostics = "nvim_lsp", ---@type "nvim_lsp" | "coc" | boolean
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = 'thin', ---@type "slant" | "slope" | "thick" | "thin"
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon', ---@type "icon" | "underline" | "none"
    },
    buffer_close_icon = '󰅖',
    color_icons = true,
  },
}
-- }}}
-- GitSigns {{{
require('gitsigns').setup {
  _threaded_diff = true,
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  on_attach = function(buf)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buf, desc = desc })
    end

        -- stylua: ignore start
        -- map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        map("n", "<leader>gD", "<cmd>Gitsigns toggle_deleted<cr>", "Toggle Deleted")
        map("n", "<leader>gl", "<cmd>Gitsigns toggle_linehl<cr>", "Toggle LineHL")
        map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
        map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
  end,
}
-- }}}
-- WhichKey {{{
require('which-key').setup {
  spec = {
    { '<leader>b', group = 'Buffers', icon = { icon = ' ', hl = 'Special', color = 'azure' } },
    { '<leader>c', group = 'Code', icon = { icon = ' ', hl = 'Special', color = 'azure' } },
    { '<leader>D', group = 'Database', icon = { icon = ' ', hl = 'Special', color = 'azure' } },
    { '<leader>e', group = 'Explorer', icon = { icon = ' ', hl = 'Special', color = 'azure' } },
    { '<leader>g', group = 'Git', icon = { icon = ' ', hl = 'Special', color = 'azure' } },
    { '<leader>f', group = 'Config', icon = { icon = ' ', hl = 'Special', color = 'azure' } },
    { '<leader>o', group = 'Obsidian', icon = { icon = '󱘒 ', hl = 'Special', color = 'blue' } },
    { '<leader>s', group = 'Search', icon = { icon = ' ', hl = 'Special', color = 'blue' } },
    { '<leader>t', group = 'Typst', icon = { icon = '', hl = 'Special', color = 'blue' } },
    { '<leader>u', group = 'Toggle', icon = { icon = ' ', hl = 'Special', color = 'blue' } },
    { '<leader>w', group = 'Windows', icon = { icon = ' ', hl = 'Special', color = 'blue' } },
    { '<leader>q', group = 'Quit', icon = { icon = '󰈆 ', hl = 'Special', color = 'blue' } },
    { '<leader>x', group = 'Diagnostics', icon = { icon = ' ', hl = 'Special', color = 'red' } },
  },
  preset = 'helix', ---@type false | "classic" | "modern" | "helix"
  -- Delay before showing the popup. Can be a number or a function that returns a number.
  ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
  notify = true,
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  triggers = { '<auto>', mode = 'n' }, -- mode = "nxsot"
  win = {
    -- don't allow the popup to overlap with the cursor
    no_overlap = true,
    -- width = 1,
    -- height = { min = 4, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = vim.o.winborder or "none",
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = 'center',
    zindex = 5000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    width = { min = 20 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  keys = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  sort = { 'icase', 'local', 'order', 'group', 'alphanum', 'mod', 'lower' },
  expand = 1, -- expand groups when <= n mappings
  ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
  replace = {
    key = {
      function(key)
        return require('which-key.view').format(key)
      end,
    },
    desc = {
      { '<Plug>%((.*)%)', '%1' },
      { '^%+', '' },
      { '<[cC]md>', '' },
      { '<[cC][rR]>', '' },
      { '<[sS]ilent>', '' },
      { '^lua%s+', '' },
      { '^call%s+', '' },
      { '^:%s*', '' },
    },
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
    ellipsis = '…',
    --- See `lua/which-key/icons.lua` for more details
    --- Set to `false` to disable keymap icons
    ---@type wk.IconRule[]|false
    rules = {},
    -- use the highlights from mini.icons
    -- When `false`, it will use `WhichKeyIcon` instead
    colors = true,
    -- used by key format
    keys = {
      Up = ' ',
      Down = ' ',
      Left = ' ',
      Right = ' ',
      C = '󰘴 ',
      M = '󰘵 ',
      S = '󰘶 ',
      CR = '󰌑 ',
      Esc = '󱊷 ',
      ScrollWheelDown = '󱕐 ',
      ScrollWheelUp = '󱕑 ',
      NL = '󰌑 ',
      BS = '⌫',
      Space = '󱁐 ',
      Tab = '󰌒 ',
    },
  },
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  -- Which-key automatically sets up triggers for your mappings.
  -- But you can disable this and setup the triggers yourself.
  -- Be aware, that triggers are not needed for visual and operator pending mode.
  -- triggers = {}, -- automatically setup triggers
  disable = {
    -- disable WhichKey for certain buf types and file types.
    ft = {},
    bt = {},
  },
}
-- }}}
