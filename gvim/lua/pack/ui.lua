vim.pack.add {
  { src = 'https://github.com/akinsho/bufferline.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
}

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
