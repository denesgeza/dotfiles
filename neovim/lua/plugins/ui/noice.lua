return
{
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = Is_enabled('noice'),
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true,            -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
    win_options = {
      winhighlight = {
        Normal = "NormalFloat",
        FloatBorder = "FloatBorder"
      }
    },
    -- Make progress messages transparent
    views = {
      mini = {
        win_options = { winblend = 0 }
      }
    }
  },
  keys = {
    { mode = { "n" }, "<leader>ne", "<cmd>NoiceErrors<cr>",  desc = "Noice Errors" },
    { mode = { "n" }, "<leader>nh", "<cmd>NoiceHistory<cr>", desc = "Noice History" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
