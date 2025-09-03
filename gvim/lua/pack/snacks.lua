vim.pack.add {
  { src = 'https://github.com/folke/persistence.nvim' },
  { src = 'https://github.com/folke/snacks.nvim' },
}

require('persistence').setup()
require('snacks').setup {
  explorer = {
    enabled = Settings.snacks.explorer,
    replace_netrw = true,
  },
  scratch = {
    name = 'Scratch',
    ft = function()
      if vim.bo.buftype == '' and vim.bo.filetype ~= '' then
        return vim.bo.filetype
      end
      return 'python'
    end,
  },
  picker = {},
  input = {
    enabled = Settings.snacks.input,
    -- use snacks input for all input prompts
    use_snacks_input = true,
    -- use snacks input for all command line prompts
    use_snacks_cmdline = true,
  },
  bigfile = { enabled = true },
  indent = {
    indent = {
      priority = 1,
      enabled = Settings.snacks.indent, -- enable indent guides
      char = '┆',
      only_scope = true, -- only show indent guides of the scope
      only_current = true, -- only show indent guides in the current window
      hl = 'Comment', ---@type string|string[] hl groups for indent guides
      -- can be a list of hl groups to cycle through
      -- hl = {
      --   "SnacksIndent1",
      --   "SnacksIndent2",
      --   "SnacksIndent3",
      --   "SnacksIndent4",
      --   "SnacksIndent5",
      --   "SnacksIndent6",
      --   "SnacksIndent7",
      --   "SnacksIndent8",
      -- },
    },
    scope = {
      enabled = true,
      priority = 200,
      char = '│',
      underline = false, -- underline the start of the scope
      only_current = false, -- only show scope in the current window
      hl = 'SnacksIndentScope', ---@type string|string[] hl group for scopes
    },
    chunk = {
      -- when enabled, scopes will be rendered as chunks, except for the
      -- top-level scope which will be rendered as a scope.
      enabled = true,
      -- only show chunk scopes in the current window
      only_current = false,
      priority = 300,
      hl = '@comment.warning', ---@type string|string[] hl group for chunk scopes
      char = {
        corner_top = '┌',
        corner_bottom = '└',
        -- corner_top = "╭",
        -- corner_bottom = "╰",
        horizontal = '─',
        vertical = '│',
        arrow = '>',
      },
    },
  },
  rename = { enabled = Settings.snacks.rename },
  bufdelete = { enabled = Settings.snacks.bufdelete },
  scroll = { enabled = Settings.snacks.scroll },
  ---@type.snacks.statuscolumn.Config
  statuscolumn = {
    enabled = Settings.snacks.statuscolumn,
    left = { 'mark', 'sign' }, -- priority of signs on the left (high to low)
    right = { 'fold', 'git' }, -- priority of signs on the right (high to low)
    folds = {
      open = true, -- show open fold icons
      git_hl = true, -- use Git Signs hl for fold icons
    },
    git = {
      -- patterns to match Git signs
      patterns = { 'GitSign', 'MiniDiffSign' },
    },
    refresh = 50, -- refresh at most every 50ms
  },
  quickfile = { enabled = Settings.snacks.quickfile },
  ---@type snacks.terminal.Config
  terminal = {
    enabled = Settings.snacks.terminal,
    win = {
      position = 'float',
      border = 'single',
    },
  },
  ---@type snacks.words.Config
  words = {
    enabled = Settings.snacks.words,
    debounce = 200,
    notify_jump = false,
    notify_end = true,
    foldopen = true,
    jumplist = true,
    modes = { 'n' },
  },
  ---@type snacks.notifier.Config
  notifier = { enabled = Settings.notifications == 'snacks', timeout = 5000 },
  notify = {},
  lazygit = {
    -- automatically configure lazygit to use the current colorscheme
    -- and integrate edit with the current neovim instance
    configure = true,
    -- extra configuration for lazygit that will be merged with the default
    -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
    -- you need to double quote it: `"\"test\""`
    config = {
      os = { editPreset = 'nvim-remote' },
      gui = { nerdFontsVersion = '3' },
    },
    theme_path = vim.fs.normalize(vim.fn.stdpath 'cache' .. '/lazygit-theme.yml'),
    -- Theme for lazygit
    theme = {
      [241] = { fg = 'Special' },
      activeBorderColor = { fg = 'DiagnosticError', bold = true },
      cherryPickedCommitBgColor = { fg = 'Identifier' },
      cherryPickedCommitFgColor = { fg = 'Function' },
      defaultFgColor = { fg = 'Normal' },
      inactiveBorderColor = { fg = 'FloatBorder' },
      optionsTextColor = { fg = 'Function' },
      searchingActiveBorderColor = { fg = 'DiagnosticError', bold = true },
      selectedLineBgColor = { bg = 'Visual' }, -- set to `default` to have no background colour
      unstagedChangesColor = { fg = 'DiagnosticError' },
    },
    win = {
      style = 'lazygit',
    },
  },
}

-- stylua: ignore start
vim.keymap.set('n', '<leader><leader>', function() Snacks.picker.files() end, { desc = "Files"})
vim.keymap.set('n', '<leader>fc', function() Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config')}) end, { desc = "Config"})
vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = "Explorer"})
vim.keymap.set("n", "<leader>e", function() local buf = vim.api.nvim_buf_get_name(0) local dir = buf ~= "" and vim.fs.dirname(buf) or vim.uv.cwd() Snacks.explorer({ cwd = dir}) end, {desc = "Explorer"} )
vim.keymap.set('n', "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers"})
vim.keymap.set('n', "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit"})
vim.keymap.set('n', "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep"})
vim.keymap.set('n', "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons"})
vim.keymap.set('n', "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps"})
vim.keymap.set('n', "<leader>z", function() Snacks.bufdelete() end, { desc = "Close buffer"})
vim.keymap.set('n', "<c-/>", function() Snacks.terminal() end, { desc = "Terminal"})
vim.keymap.set('n', "<leader>sr", function () Snacks.picker.resume() end, { desc = "Resume"})
vim.keymap.set('n', "<leader>uC", function () Snacks.picker.colorschemes() end, { desc = "Colorschemes"})
vim.keymap.set('n', "<leader>sp", function () Snacks.picker.projects() end, { desc = "Projects"})
vim.keymap.set('n', "<leader>qs", function() require("persistence").load() end, { desc = "Restore Session" })

Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
Snacks.toggle.diagnostics():map '<leader>ud'
Snacks.toggle.line_number():map '<leader>ul'
Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
Snacks.toggle.treesitter():map '<leader>uT'
Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
Snacks.toggle.inlay_hints():map '<leader>uh'
-- stylua: ignore end
