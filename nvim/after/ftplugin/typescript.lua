vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.b.disable_autoformat = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Keymaps
local map = vim.api.nvim_buf_set_keymap
-- stylua: ignore
map( 0, "n", "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", { noremap = true, silent = true, desc = "Organize imports" })
map(0, "n", "<leader>cR", "<cmd>TSToolsRenameFile<CR>", { noremap = true, silent = true, desc = "Rename file" })
map(0, "n", "<leader>cp", "<cmd>TSToolsFixAll<CR>", { noremap = true, silent = true, desc = "Fix All" })
map(
  0,
  "n",
  "<leader>cn",
  "<cmd>TSToolsAddMissingImports<CR>",
  { noremap = true, silent = true, desc = "Add Missing imports" }
)
map(0, "n", "<leader>ts", "<cmd>TSC<cr>", { noremap = true, silent = true, desc = "TSC" })
