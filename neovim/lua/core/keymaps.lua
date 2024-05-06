Keymap = vim.keymap.set -- for conciseness
Telescope = require("core.telescope")

Keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
Keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
Keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
Keymap("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
Keymap("n", "<leader>bd", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Colemak mappings
-- Navigation
Keymap({ "n", "x" }, "n", "j", { desc = "j -> n", noremap = true })
Keymap({ "n", "x" }, "e", "k", { desc = "k -> e", noremap = true })
Keymap({ "n" }, "i", "l", { desc = "l -> i", noremap = true })
Keymap({ "n", "x" }, "f", "e", { desc = "f -> e", noremap = true }) -- End of word
-- better up/down
Keymap({ "n", "x" }, "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Keymap({ "n", "x" }, "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
Keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- Enter insert mode
Keymap({ "n" }, "l", "i", { desc = "l -> i", noremap = true })
-- Window navigation
Keymap({ "n" }, "<S-i>", "<cmd>bp<cr>", { desc = "Next buffer" })
Keymap({ "n" }, "<S-h>", "<cmd>bn<cr>", { desc = "Previous buffer" })
Keymap({ "n" }, "<C-i>", "<C-w>l", { desc = "Right window" })
Keymap({ "n" }, "<C-h>", "<C-w>h", { desc = "Right window" })
Keymap({ "n" }, "<C-e>", "<C-w>k", { desc = "Top window" })
Keymap({ "n" }, "<C-n>", "<C-w>j", { desc = "Bottom window" })

-- save file
Keymap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- Focus search results
Keymap("n", "k", "nzz", { desc = "Next search result" })

-- quit
Keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
Keymap("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- Clear search
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search" })

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x', { desc = "Delete single character" })

-- Don't yank on put
vim.keymap.set("x", "p", '"_dP', { desc = "Don't yank on put" })
-- Line start/end
Keymap({ "n", "x", "o" }, "<D-h>", "^", { desc = "Line Start [non-blank]" })
Keymap({ "n", "x", "o" }, "<D-i>", "$", { desc = "End of Line [non-blank]" })

-- Move line up/down
Keymap("n", "<D-e>", "<cmd>m .-2<cr>==", { desc = "Move up" })
Keymap("n", "<D-n>", "<cmd>m .+1<cr>==", { desc = "Move down" })
Keymap("i", "<D-n>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
Keymap("i", "<D-e>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
Keymap("v", "<D-n>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
Keymap("v", "<D-e>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- {{{ c - code
Keymap("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
-- }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.
Keymap("n", "J", "mzJ`z", { desc = "Join" })
Keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join" })
-- }}}
-- {{{ o - Options
Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Check health" })
Keymap("n", "<leader>oH", "<cmd>silent vert bo help<cr>", { desc = "Help" })
Keymap("n", "<leader>ol", "<cmd>set list!<cr>", { desc = "Toogle [in]visible characters" })
Keymap("n", "<leader>oe", "<cmd>set foldmethod=expr<cr>", { desc = "Folding [expr]" })
Keymap("n", "<leader>om", "<cmd>set foldmethod=marker<cr>", { desc = "Folding [marker]" })
Keymap("n", "<leader>on", "<cmd>set foldmethod=manual<cr>", { desc = "Folding [manual]" })
Keymap("n", "<leader>oi", "<cmd>set foldmethod=indent<cr>", { desc = "Folding [indent]" })
Keymap("n", "<leader>os", "<cmd>set foldmethod=syntax<cr>", { desc = "Folding [syntax]" })
--  }}}
-- {{{ w - Window
Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
Keymap("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally
Keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only one window" })
Keymap("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
Keymap("n", "<leader>wm", "<C-w>|", { desc = "Max out width" })
--  }}}
-- {{{ u - UI
--  }}}
-- {{{ v - VIM/Select commands
Keymap("n", "vv", "^vg_", { desc = "Select current line" })
Keymap("n", "vaa", "ggvGg_", { desc = "Select All" })
--  }}}
-- {{{ z - Quit
Keymap("n", "<leader>z", ":bd<cr>", { desc = "Close buffer" })
Keymap("n", "z0", "<cmd>set foldlevel=0<cr>", { desc = "Foldlevel=0" })
Keymap("n", "z1", "<cmd>set foldlevel=1<cr>", { desc = "Foldlevel=1" })
Keymap("n", "z2", "<cmd>set foldlevel=2<cr>", { desc = "Foldlevel=2" })
--  }}}
-- {{{ <tab> - Tabs
Keymap("n", "<leader><tab><tab>", "<cmd>tab split<cr>", { desc = "Create Tab" })
--  }}}
