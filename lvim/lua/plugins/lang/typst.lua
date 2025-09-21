if Is_Enabled("typst") then
  return {
    {
      "chomosuke/typst-preview.nvim",
      ft = "typst",
      version = "1.*",
      opts = {
        invert_colors = "auto", ---@type 'never' | 'auto' | 'always'
        follow_cursor = true,
        dependencies_bin = {
          ["tinymist"] = "tinymist",
        },
      },
      config = function(_, opts)
        require("lspconfig")["tinymist"].setup({ -- Alternatively, can be used `vim.lsp.config["tinymist"]`
          root_dir = function()
            return vim.fn.getcwd()
          end,
          --- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/Configuration.md) for references.
          settings = {
            --- You could set the formatter mode to use lsp-enhanced formatters.
            formatterMode = "typstyle",
            exportPdf = "never", ---@type 'onSave' | 'onType' | 'never'
            sematicTokens = "enable", ---@type "enable" | "disable"
            formatterPrintWidth = 100, ---@type number
            formatterIndentSize = 4, ---@type number
            completion = {
              triggerOnSnippetPlaceholders = true,
              symbol = "step", ---@type 'step' | 'stepless
            },
          },
          single_file_support = true,
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>tp", function()
              client:exec_cmd({
                title = "pin",
                command = "tinymist.pinMain",
                arguments = { vim.api.nvim_buf_get_name(0) },
              }, { bufnr = bufnr })
            end, { desc = "[T]inymist [P]in", noremap = true })

            vim.keymap.set("n", "<leader>tu", function()
              client:exec_cmd({
                title = "unpin",
                command = "tinymist.pinMain",
                arguments = { vim.v.null },
              }, { bufnr = bufnr })
            end, { desc = "[T]inymist [U]npin", noremap = true })

            vim.api.nvim_create_user_command("TypstExportPDF", function()
              -- local input = vim.api.nvim_buf_get_name(0)
              local input = vim.fn.expand("%:t")
              -- Output file name
              local output = input:gsub("%.typ$", ".pdf")
              vim.cmd("!typst compile " .. input .. " " .. output)
            end, { nargs = "?", complete = "file" })

            vim.api.nvim_create_user_command("OpenPdf", function()
              local filepath = vim.api.nvim_buf_get_name(0)
              if filepath:match("%.typ$") then
                local pdf_path = filepath:gsub("%.typ$", ".pdf")
                vim.system({ "open", pdf_path })
              end
            end, {})
          end,
        })
        require("typst-preview").setup(opts)
      end,
      keys = {
        { "<localleader>p", "<cmd>TypstPreview<cr>", desc = "Preview" },
        { "<localleader>c", "<cmd>TypstPreviewFollowCursorToggle<cr>", desc = "Toggle Cursor" },
        { "<localleader>r", "<cmd>TypstPreviewReload<cr>", desc = "Reload" },
        { "<localleader>t", "<cmd>TypstPreviewToggle<cr>", desc = "Toggle" },
        { "<localleader>x", "<cmd>TypstPreviewClose<cr>", desc = "Close" },
        { "<localleader>e", "<cmd>TypstExportPDF<cr>", desc = "Create PDF" },
        { "<localleader>o", "<cmd>OpenPdf<cr>", desc = "Open PDF" },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "typst" } },
    },
    {
      "mason-org/mason.nvim",
      opts = { ensure_installed = { "tinymist" } },
    },
    {
      "stevearc/conform.nvim",
      optional = true,
      opts = {
        formatters_by_ft = {
          typst = { "typstyle", lsp_format = "prefer" },
        },
      },
    },
  }
else
  return {}
end
