Keymap = vim.keymap.set -- for conciseness
Telescope = require("core.settings.telescope")
Manager = require("core.manager")
Functions = require("core.functions")

-- Colemak mappings
if Manager.keyboard == "colemak" then
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
  -- Horizontal navigation
  Keymap({ "n" }, "j", "f", { desc = "f -> j", noremap = true })
  -- Window navigation
  Keymap({ "n" }, "<S-i>", "<cmd>bn<cr>", { desc = "Next buffer" })
  Keymap({ "n" }, "<S-h>", "<cmd>bp<cr>", { desc = "Previous buffer" })
  Keymap({ "n" }, "<C-i>", "<C-w>l", { desc = "Right window" })
  Keymap({ "n" }, "<C-h>", "<C-w>h", { desc = "Right window" })
  Keymap({ "n" }, "<C-e>", "<C-w>k", { desc = "Top window" })
  Keymap({ "n" }, "<C-n>", "<C-w>j", { desc = "Bottom window" })
  -- Move line up/down
  Keymap("n", "<D-e>", "<cmd>m .-2<cr>==", { desc = "Move up" })
  Keymap("n", "<D-n>", "<cmd>m .+1<cr>==", { desc = "Move down" })
  Keymap("i", "<D-n>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
  Keymap("i", "<D-e>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
  Keymap("v", "<D-n>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
  Keymap("v", "<D-e>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
end

Keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Keywordprg
Keymap("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
-- save file
Keymap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- Focus search results
Keymap("n", "k", "nzz", { desc = "Next search result" })

-- Clear search
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search" })

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x', { desc = "Delete single character" })

-- Don't yank on put
Keymap("x", "p", '"_dP', { desc = "Don't yank on put" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
Keymap("n", "k", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
Keymap("x", "k", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search REsult" })
Keymap("o", "k", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
Keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
Keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
Keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
-- better indenting
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")
-- {{{ b - buffer
Keymap("n", "<leader>bd", function()
  Functions.bufremove()
end, { desc = "Delete buffer" })
Keymap("n", "<leader>z", function()
  Functions.bufremove()
end, { desc = "Delete buffer" })
-- }}}
-- {{{ c - code
Keymap("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
-- }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.
Keymap("n", "J", "mzJ`z", { desc = "Join" })
Keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join" })
-- }}}
-- {{{ l - Lazy
Keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
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
-- {{{ q - Quit
Keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
--  }}}
-- {{{ w - Window
Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })    -- split window vertically
Keymap("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" })  -- split window horizontally
Keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only one window" })
Keymap("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
Keymap("n", "<leader>wm", "<C-w>|", { desc = "Max out width" })
--  }}}
-- {{{ u - UI
-- stylua: ignore start
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
  Keymap("n", "<leader>uh", function() Functions.inlay_hints() end, { desc = "Toggle inlay hints" })
end
Keymap("n", "<leader>ub", function() Functions("background", false, { "light", "dark" }) end,
  { desc = "Toggle Background" })
-- highlights under cursor
Keymap("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
Keymap("n", "<leader>ud", function() Functions.diagnostics() end, { desc = "Toggle Diagnostics" })
Keymap("n", "<leader>ul", function() Functions.number() end, { desc = "Toggle Line numbers" })
Keymap("n", "<leader>uL", function() Functions("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
Keymap("n", "<leader>us", function() Functions("spell") end, { desc = "Toggle Spelling" })
Keymap("n", "<leader>uw", function() Functions("wrap") end, { desc = "Toggle Word Wrap" })
Keymap("n", "<leader>ut", function() Functions.statusline() end, { desc = "Toggle Statusline" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
Keymap("n", "<leader>uC", function() Functions("conceallevel", false, { 0, conceallevel }) end,
  { desc = "Toggle Conceal" })
--  }}}
-- {{{ v - VIM/Select commands
Keymap("n", "vv", "^vg_", { desc = "Select current line" })
Keymap("n", "vaa", "ggvGg_", { desc = "Select All" })
--  }}}
-- {{{ x - Trouble
Keymap("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
Keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
--  }}}
-- {{{ z - Quit
Keymap("n", "z0", "<cmd>set foldlevel=0<cr>", { desc = "Foldlevel=0" })
Keymap("n", "z1", "<cmd>set foldlevel=1<cr>", { desc = "Foldlevel=1" })
Keymap("n", "z2", "<cmd>set foldlevel=2<cr>", { desc = "Foldlevel=2" })
--  }}}
-- {{{ <tab> - Tabs
Keymap("n", "<leader><tab><tab>", "<cmd>tab split<cr>", { desc = "Create Tab" })
--  }}}
