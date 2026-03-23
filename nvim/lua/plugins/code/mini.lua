-- {{{ Toggle mini.pairs
local function toggle_mini_pairs()
  if vim.g.minipairs_disable then
    vim.g.minipairs_disable = false
    vim.notify('Mini pairs enabled', vim.log.levels.INFO, { title = 'Mini Pairs' })
  else
    vim.g.minipairs_disable = true
    vim.notify('Mini pairs disabled', vim.log.levels.INFO, { title = 'Mini Pairs' })
  end
end
-- }}}
return { -- Collection of various small independent plugins/modules
  'nvim-mini/mini.nvim',
  lazy = false,
  config = function()
    require('mini.basics').setup {
      -- Options. Set field to `false` to disable.
      options = {
        -- Basic options ('number', 'ignorecase', and many more)
        basic = true,
        -- Extra UI features ('winblend', 'listchars', 'pumheight', ...)
        extra_ui = false,
        -- Presets for window borders ('single', 'double', ...)
        -- Default 'auto' infers from 'winborder' option
        win_borders = 'auto',
      },

      -- Mappings. Set field to `false` to disable.
      mappings = {
        -- Basic mappings (better 'jk', save with Ctrl+S, ...)
        basic = true,
        -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
        -- Supply empty string to not create these mappings.
        option_toggle_prefix = [[\]],
        -- Window navigation with <C-hjkl>, resize with <C-arrow>
        windows = true,
        -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
        move_with_alt = true,
      },

      -- Autocommands. Set field to `false` to disable
      autocommands = {
        -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
        basic = true,
        -- Set 'relativenumber' only in linewise and blockwise Visual mode
        relnum_in_visual_mode = true,
      },

      -- Whether to disable showing non-error feedback
      silent = false,
    }
    if not vim.g.vscode then
      -- require('mini.starter').setup()
      -- Git integration for more straightforward Git actions based on Neovim's state.
      -- It is not meant as a fully featured Git client, only to provide helpers that
      -- integrate better with Neovim. Example usage:
      -- - `<Leader>gs` - show information at cursor
      -- - `<Leader>gd` - show unstaged changes as a patch in separate tabpage
      -- - `<Leader>gL` - show Git log of current file
      -- - `:Git help git` - show output of `git help git` inside Neovim
      --
      -- See also:
      -- - `:h MiniGit-examples` - examples of common setups
      -- - `:h :Git` - more details about `:Git` user command
      -- - `:h MiniGit.show_at_cursor()` - what information at cursor is shown
      require('mini.git').setup()
      -- Better Around/Inside textobjects
      require('mini.ai').setup()
      require('mini.files').setup()
      require('mini.hipatterns').setup()
      if not Enabled 'nvim-surround' then
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup {
          mappings = {
            add = 'ys',
            delete = 'ds',
            find = '',
            find_left = '',
            highlight = '',
            replace = 'cs',

            -- Add this only if you don't want to use extended mappings
            suffix_last = '',
            suffix_next = '',
          },
          search_method = 'cover_or_next',
        }
      end
      -- require('mini.sessions').setup()
      require('mini.pairs').setup()
      require('mini.icons').setup {
        style = 'glyph', ---@type 'glyph' | 'ascii'
        -- Customize per category. See `:h MiniIcons.config` for details.
        default = {},
        directory = {
          apps = { glyph = ' ', hl = 'MiniIconsBlue' },
          config = { glyph = ' ', hl = 'MiniIconsGreen' },
          settings = { glyph = ' ', hl = 'MiniIconsGreen' },
          tools = { glyph = ' ', hl = 'MiniIconsOrange' },
          database = { glyph = ' ', hl = 'MiniIconsOrange' },
          users = { glyph = '󰉌 ', hl = 'MiniIconsRed' },
          automation = { glyph = ' ', hl = 'MiniIconsGreen' },
          static = { glyph = ' ', hl = 'MiniIconsYellow' },
          templates = { glyph = ' ', hl = 'MiniIconsRed' },
          css = { glyph = ' ', hl = 'MiniIconsRed' },
          js = { glyph = ' ', hl = 'MiniIconsRed' },
          img = { glyph = ' ', hl = 'MiniIconsRed' },
          vendor = { glyph = '󰛆 ', hl = 'MiniIconsRed' },
          layouts = { glyph = ' ', hl = 'MiniIconsAzure' },
          includes = { glyph = ' ', hl = 'MiniIconsAzure' },
          partials = { glyph = '󰆞 ', hl = 'MiniIconsAzure' },
        },
        extension = {
          ts = { glyph = ' ', hl = 'MiniIconsAzure' },
          js = { glyph = ' ', hl = 'MiniIconsGreen' },
          norg = { glyph = ' ', hl = 'MiniIconsAzure' },
          lock = { glyph = ' ', hl = 'MiniIconsRed' },
          html = { glyph = ' ', hl = 'MiniIconsYellow' },
          css = { glyph = ' ', hl = 'MiniIconsGreen' },
          htmldjango = { glyph = '', hl = 'MiniIconsRed' },
        },
        file = {},
        filetype = {
          python = { glyph = ' ', hl = 'MiniIconsAzure' },
          lua = { glyph = ' ', hl = 'MiniIconsAzure' },
          typescript = { glyph = ' ', hl = 'MiniIconsYellow' },
          javascript = { glyph = ' ', hl = 'MiniIconsGreen' },
          ['copilot-chat'] = { glyph = '󰱸 ', hl = 'MiniIconsGreen' },
          codecompanion = { glyph = '󰱸 ', hl = 'MiniIconsGreen' },
          html = { glyph = ' ', hl = 'MiniIconsYellow' },
          htmldjango = { glyph = '', hl = 'MiniIconsRed' },
          norg = { glyph = '', hl = 'MiniIconsAzure' },
          lock = { glyph = ' ', hl = 'MiniIconsRed' },
          snacks_picker_input = { glyph = ' ', hl = 'MiniIconsRed' },
          markdown = { glyph = ' ', hl = 'MiniIconsRed' },
          css = { glyph = ' ', hl = 'MiniIconsGreen' },
          conf = { glyph = ' ', hl = 'MiniIconsGreen' },
        },
        lsp = {},
        os = {},
      }
    end
  end,
  specs = {
    { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
  },
  init = function()
    package.preload['nvim-web-devicons'] = function()
      -- needed since it will be false when loading and mini will fail
      package.loaded['nvim-web-devicons'] = {}
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
  -- stylua: ignore start
  keys = {
    { '<leader>fm', '<cmd>lua MiniFiles.open()<cr>', desc = 'Mini Files' },
    { '<leader>up', function() toggle_mini_pairs() end, desc = 'Toggle Mini Pairs'},
  },
  -- stylua: ignore end
}

-- vim:tw=120:ts=2:sw=2:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:fen:
