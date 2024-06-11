Is_Enabled = require("config.functions").is_enabled

return {
  "akinsho/toggleterm.nvim",
  enabled = Is_Enabled("toggleterm"),
  version = "*",
  opts = {
    size = 13,
    hide_numbers = true,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shading_factor = 2,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  keys = {
    { "<leader>tf", "<cmd>lua Toggleterm.float()<cr>", desc = "Term | Float" },
    { "<leader>th", "<cmd>lua Toggleterm.horizontal()<cr>", desc = "Term | Horizontal" },
    { "<leader>tv", "<cmd>lua Toggleterm.vertical()<cr>", desc = "Term | Vertical" },
    { "<leader>tt", "<cmd>lua Toggleterm.tab()<cr>", desc = "Term | Tab" },
    { "<leader>tn", "<cmd>lua Toggleterm.node()<cr>", desc = "Term | Node" },
    { "<leader>tb", "<cmd>lua Toggleterm.btop()<cr>", desc = "Term | BTop" },
    { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n" }, desc = "Toggleterm" },
    { "<esc>", [[<C-\><C-n>]], mode = { "t" } },
    -- QWERTY
    { "<C-h>", [[<Cmd>wincmd h<CR>]], mode = { "t" } },
    { "<C-j>", [[<Cmd>wincmd j<CR>]], mode = { "t" } },
    { "<C-k>", [[<Cmd>wincmd k<CR>]], mode = { "t" } },
    { "<C-l>", [[<Cmd>wincmd l<CR>]], mode = { "t" } },
    { "<C-w>", [[<C-\><C-n><C-w>]], mode = { "t" } },
  },
}
