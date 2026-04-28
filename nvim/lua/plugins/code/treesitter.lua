return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    -- 'nvim-treesitter/nvim-treesitter-context',
  },
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local ts = require 'nvim-treesitter'

    -- Install core parsers at startup
    ts.install {
      'bash',
      'comment',
      'css',
      'cpp',
      'diff',
      'fish',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'html',
      'javascript',
      'json',
      'latex',
      'lua',
      'luadoc',
      'make',
      'markdown',
      'markdown_inline',
      'objc',
      'python',
      'query',
      'regex',
      'scss',
      'svelte',
      'swift',
      'toml',
      'tsx',
      'typescript',
      'typst',
      'vim',
      'vimdoc',
      'vue',
      'xml',
    }
    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

    local ignore_filetypes = {
      'blink-cmp-documentation',
      'blink-cmp-menu',
      'blink-cmp-signature',
      'checkhealth',
      'lazy',
      'mason',
      'fidget',
      'cmd',
      'dialog',
      'mason_backdrop',
      'msg',
      'pager',
      'snacks_dashboard',
      'snacks_input',
      'snacks_notif',
      'snacks_terminal',
      'snacks_win',
      'snacks_win_backdrop',
      'snacks_layout_box',
      'snacks_picker_input',
      'snacks_picker_preview',
      'snacks_picker_list',
      'sidekick_terminal',
      'trouble',
      'minifiles',
      'norg',
      'lazy_backdrop',
    }

    -- Auto-install parsers and enable highlighting on FileType
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      desc = 'Enable treesitter highlighting and indentation',
      callback = function(event)
        if vim.tbl_contains(ignore_filetypes, event.match) then
          return
        end

        local lang = vim.treesitter.language.get_lang(event.match) or event.match
        local buf = event.buf

        -- Start highlighting immediately (works if parser exists)
        pcall(vim.treesitter.start, buf, lang)

        -- Enable treesitter indentation
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- Install missing parsers (async, no-op if already installed)
        ts.install { lang }
      end,
    })
  end,
}
