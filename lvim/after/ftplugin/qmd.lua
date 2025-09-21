-- Highlights
-- see :h nvim_set_hl for the values of opts
-- I would recommend using the `link` option to link the values to colors from your color scheme
vim.api.nvim_set_hl(0, "MoltenOutputBorder", { link = "@lsp.type.method" })
-- luacheck: no max line length
vim.keymap.set(
  "n",
  "<localleader>R",
  ":MoltenEvaluateOperator<CR>",
  { silent = true, noremap = true, desc = "run operator selection" }
)
vim.keymap.set(
  "n",
  "<localleader>rl",
  ":MoltenEvaluateLine<CR>",
  { silent = true, noremap = true, desc = "evaluate line" }
)
vim.keymap.set(
  "n",
  "<localleader>rc",
  ":MoltenReevaluateCell<CR>",
  { silent = true, noremap = true, desc = "re-evaluate cell" }
)
vim.keymap.set(
  "v",
  "<localleader>r",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, noremap = true, desc = "evaluate visual selection" }
)
vim.keymap.set(
  "n",
  "<localleader>rd",
  ":MoltenDelete<CR>",
  { silent = true, noremap = true, desc = "molten delete cell" }
)
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, noremap = true, desc = "hide output" })
vim.keymap.set(
  "n",
  "<localleader>os",
  ":noautocmd MoltenEnterOutput<CR>",
  { silent = true, noremap = true, desc = "show/enter output" }
)
