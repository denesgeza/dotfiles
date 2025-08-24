if Enabled 'typst' then
  return {
    {
      'chomosuke/typst-preview.nvim',
      enabled = Enabled 'typst',
      ft = 'typst',
      version = '1.*',
      opts = {
        invert_colors = 'auto', ---@type 'never' | 'auto' | 'always'
        follow_cursor = true,
        dependencies_bin = {
          ['tinymist'] = 'tinymist',
        },
      },
      config = function(_, opts)
        require('lspconfig')['tinymist'].setup { -- Alternatively, can be used `vim.lsp.config["tinymist"]`
          -- root_dir = function()
          --   return vim.fs.root(0, { { 'main.typ' }, '.git' })
          -- end,
          single_file_support = true,
          root_dir = require('lspconfig.util').root_pattern('.git', 'main.typ', 'typst.toml'),
          --- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/editors/neovim/Configuration.md) for references.
          settings = {
            --- You could set the formatter mode to use lsp-enhanced formatters.
            formatterMode = 'typstyle',
            exportPdf = 'never', ---@type 'onSave' | 'onType' | 'never'
            sematicTokens = 'enable', ---@type "enable" | "disable"
            formatterPrintWidth = 100, ---@type number
            formatterIndentSize = 4, ---@type number
            projectResolution = 'singleFile', ---@type 'lockDatabase' | 'singleFile'
            completion = {
              triggerOnSnippetPlaceholders = true,
              symbol = 'step', ---@type 'step' | 'stepless
            },
          },
          -- single_file_support = true,
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>tp', function()
              client:exec_cmd({
                title = 'pin',
                command = 'tinymist.pinMain',
                arguments = { vim.api.nvim_buf_get_name(0) },
              }, { bufnr = bufnr })
            end, { desc = '[T]inymist [P]in', noremap = true })

            vim.keymap.set('n', '<leader>tu', function()
              client:exec_cmd({
                title = 'unpin',
                command = 'tinymist.pinMain',
                arguments = { vim.v.null },
              }, { bufnr = bufnr })
            end, { desc = '[T]inymist [U]npin', noremap = true })
          end,
        }

        require('typst-preview').setup(opts)
      end,
      -- keys = {
      --   { '<localleader>p', '<cmd>TypstPreview<cr>', desc = 'Preview' },
      --   { '<localleader>c', '<cmd>TypstPreviewFollowCursorToggle<cr>', desc = 'Toggle Cursor' },
      --   { '<localleader>r', '<cmd>TypstPreviewReload<cr>', desc = 'Reload' },
      --   { '<localleader>t', '<cmd>TypstPreviewToggle<cr>', desc = 'Toggle' },
      --   { '<localleader>x', '<cmd>TypstPreviewClose<cr>', desc = 'Close' },
      --   { '<localleader>e', '<cmd>TypstExportPDF<cr>', desc = 'Create PDF' },
      --   { '<localleader>o', '<cmd>OpenPdf<cr>', desc = 'Open PDF' },
      -- },
    },
    {
      -- TODO: To test out
      -- Typst preview in Neovim's floating window
      'al-kot/typst-preview.nvim',
      name = 'typst-preview',
      enabled = true,
      opts = {
        -- your config here
      },
    },
  }
else
  return {}
end
