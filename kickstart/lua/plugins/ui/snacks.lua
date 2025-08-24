---@diagnostic disable: missing-fields
return {
  ---@class snacks.statuscolumn.Config
  ---@class snacks.dashboard.Config
  {
    'folke/snacks.nvim',
    enabled = Enabled 'snacks',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      ---@type snacks.explorer.Config
      explorer = {
        enabled = Settings.snacks.explorer,
        replace_netrw = true,
      },
      ---@type snacks.scratch.Config
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
      ---@type snacks.dashboard.Config
      dashboard = {
        enabled = Settings.snacks.dashboard,
        sections = {
          -- { section = 'header' },
          -- {
          --   pane = 2,
          --   section = "terminal",
          --   cmd = "colorscript -e square",
          --   height = 5,
          --   padding = 1,
          -- },
          { section = 'keys', gap = 1, padding = 1 },
          { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          -- {
          --   pane = 2,
          --   icon = ' ',
          --   title = 'Git Status',
          --   section = 'terminal',
          --   enabled = vim.fn.isdirectory '.git' == 1,
          --   cmd = 'hub status --short --branch --renames',
          --   height = 5,
          --   padding = 1,
          --   ttl = 5 * 60,
          --   indent = 3,
          -- },
          { section = 'startup' },
        },
      },
      ---@type snacks.indent.Config
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
      ---@type snacks.image.Config
      image = {
        enabled = Settings.snacks.image,
        math = {
          enabled = false,
          latex = { font_size = 'normalsize' },
          typst = {
            tpl = [[
        #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
        #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
        #set text(size: 10pt, fill: rgb("${color}"))
        ${header}
        ${content}]],
          },
        },
      },
    },
    keys = {
      -- stylua: ignore start
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>un", function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>cr", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      -- buffers
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>.", function() Snacks.picker.command_history() end, desc = "Command History" },
      -- { "<leader><space>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>z", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      -- find
      { "<leader>fc", function() Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')}) end, desc = "Find Config File" },
      -- { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      -- { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      -- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Files (git-files)" },
      -- { "<leader>fr", LazyVim.pick("oldfiles"), desc = "Recent" },
      -- { "<leader>fR", LazyVim.pick("oldfiles", { filter = { cwd = true }}), desc = "Recent (cwd)" },
      -- explorer
      {
        "<leader>e",
        function()
          local buf = vim.api.nvim_buf_get_name(0)
          local dir = buf ~= "" and vim.fs.dirname(buf) or vim.uv.cwd()
          Snacks.explorer({ cwd = dir})
        end,
        desc = "Explorer"
      },
      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git branches" },
      { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (hunks)" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gL", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      -- Grep
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      -- { "<leader>sg", LazyVim.pick("live_grep", { root = true }), desc = "Grep (Root Dir)" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (Root Dir)" },
      -- { "<leader>sG", LazyVim.pick("live_grep", { root = true, show_untracked = false }), desc = "Grep (cwd)" },
      -- { "<leader>sw", LazyVim.pick("grep_word"), desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
      -- { "<leader>sW", LazyVim.pick("grep_word", { root = false }), desc = "Visual selection or word (cwd)", mode = { "n", "x" } },
      -- search
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undotree" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      { "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },
      -- stylua: ignore end
    },
    init = function()
      -- Additional keys
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
          -- Snacks.toggle.diagnostics():map '<leader>ud'
          Snacks.toggle.line_number():map '<leader>ul'
          Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
          Snacks.toggle.treesitter():map '<leader>uT'
          Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
          Snacks.toggle.inlay_hints():map '<leader>uh'
        end,
      })
    end,
  },
}
