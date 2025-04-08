Is_Enabled = require("config.functions").is_enabled

return {
  "lewis6991/gitsigns.nvim",
  enabled = Is_Enabled("gitsigns"),
  opts = {
    _threaded_diff = true,
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    current_line_blame = false,
    trouble = true,
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
  },
}
