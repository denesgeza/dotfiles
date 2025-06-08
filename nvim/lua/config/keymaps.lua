-- Imports {{{
Functions = require("config.functions")
Keymap = Functions.keymap
Is_Enabled = Functions.is_enabled
-- }}}
-- COLEMAK mappings {{{
if Settings.keyboard == "colemak" then
  -- Navigation
  vim.keymap.set({ "n", "x" }, "n", "j", { desc = "j -> n", noremap = true })
  vim.keymap.set({ "n", "x" }, "e", "k", { desc = "k -> e", noremap = true })
  vim.keymap.set({ "n" }, "i", "l", { desc = "l -> i", noremap = true })
  -- vim.keymap.set({ "n", "x" }, "f", "e", { desc = "f -> e", noremap = true }) -- End of word
  -- Enter insert mode
  vim.keymap.set({ "n" }, "l", "i", { desc = "l -> i", noremap = true })
  -- Window navigation
  vim.keymap.set({ "n" }, "I", "<cmd>bn<cr>", { desc = "Left window" })
  vim.keymap.set({ "n" }, "<C-i>", "<C-w>l", { desc = "Right window" })
  vim.keymap.set({ "n" }, "<C-e>", "<C-w>k", { desc = "Top window" })
  vim.keymap.set({ "n" }, "<C-n>", "<C-w>j", { desc = "Bottom window" })

  -- Focus search results
  vim.keymap.set("n", "k", "nzz", { desc = "Next search result" })

  -- Line start/end
  vim.keymap.set({ "n", "x", "o" }, "<D-h>", "^", { desc = "Line Start [non-blank]" })
  vim.keymap.set({ "n", "x", "o" }, "<D-i>", "$", { desc = "End of Line [non-blank]" })

  -- Move line up/down
  vim.keymap.set("n", "<D-e>", "<cmd>m .-2<cr>==", { desc = "Move up" })
  vim.keymap.set("n", "<D-n>", "<cmd>m .+1<cr>==", { desc = "Move down" })
  vim.keymap.set("i", "<D-n>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
  vim.keymap.set("i", "<D-e>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
  vim.keymap.set("v", "<D-n>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
  vim.keymap.set("v", "<D-e>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
  -- }}}
  -- QWERTY mappings {{{
else
  -- ESC key
  -- Keymap("i", "kj", "<Esc>")

  -- Start/End of line
  vim.keymap.set({ "n", "x", "o" }, "gh", "^", { desc = "Line Start [non-blank]" })
  vim.keymap.set({ "n", "x", "o" }, "gl", "$", { desc = "Endof Line [non-blank]" })

  -- Go out of closing bracket
  -- vim.keymap.set("i", "jj", "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>")
  -- Keymap("i", "jj", "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>")
end
-- }}}
-- {{{ General mappings
-- Replace word under cursor across entire buffer
vim.keymap.set(
  "n",
  "<leader>sx",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)

-- Copilot models
vim.keymap.set("n", "<leader>am", "<cmd>CopilotChatModels<cr>", { desc = "Copilot models" })
-- Clear search
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search" })

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x', { desc = "Delete single character" })

-- Don't yank on put
vim.keymap.set("x", "p", '"_dP', { desc = "Don't yank on put" })

-- Visual yank
Keymap("v", "<C-c>", '"+y', { desc = "Copy" })
--  }}}
-- {{{ f - find
Keymap("n", "<leader>fa", "<cmd>edit ~/.config/aerospace/aerospace.toml<cr>", { desc = "Aerospace config" })
Keymap("n", "<leader>fz", "<cmd>edit ~/.config/zellij/config.kdl<cr>", { desc = "Zellij config" })
Keymap("n", "<leader>fk", "<cmd>edit ~/.config/kitty/kitty.conf<cr>", { desc = "Kitty config" })
--  }}}
-- {{{ s - search
Keymap("n", "<leader>sv", "<cmd>silent vert bo help<cr>", { desc = "Help" })
--  }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.
Keymap("n", "J", "mzJ`z", { desc = "Join" })
-- }}}
-- {{{ o - Obsidian
-- Keymap("n", "<leader>oe", "<cmd>set foldmethod=expr<cr>", { desc = "Folding [expr]" })
-- Keymap("n", "<leader>oi", "<cmd>set foldmethod=indent<cr>", { desc = "Folding [indent]" })
-- Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Check health" })
-- Keymap("n", "<leader>om", "<cmd>set foldmethod=marker<cr>", { desc = "Folding [marker]" })
-- Keymap("n", "<leader>on", "<cmd>set foldmethod=manual<cr>", { desc = "Folding [manual]" })
-- Keymap("n", "<leader>os", "<cmd>set foldmethod=syntax<cr>", { desc = "Folding [syntax]" })
--  }}}
-- {{{ u - UI
 -- stylua: ignore
Keymap( "n", "<leader>ub", "<cmd>lua require('config.functions').toggle_background()<cr>", { desc = "Toggle background" })
Keymap("n", "<leader>uB", "<cmd>set list!<cr>", { desc = "Toogle [in]visible characters" })
Keymap("n", "<leader>ut", "<cmd>lua require('config.functions').statusline()<cr>", { desc = "Toggle statusline" })
--  }}}
-- {{{ w - Window
Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
Keymap("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally
Keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only one window" })
Keymap("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
Keymap("n", "<leader>wm", "<C-w>|", { desc = "Max out width" })
--  }}}
-- {{{ x - Exit
Keymap("n", "<leader>xz", "<cmd>restart<cr>", { desc = "Restart Neovim" })
-- }}}
-- {{{ v - VIM/Select commands
Keymap("n", "vv", "^vg_", { desc = "Select current line" })
Keymap("n", "vaa", "ggvGg_", { desc = "Select All" })
--  }}}
-- {{{ z -
Keymap("n", "z0", "<cmd>set foldlevel=0<cr>", { desc = "Foldlevel=0" })
Keymap("n", "z1", "<cmd>set foldlevel=1<cr>", { desc = "Foldlevel=1" })
Keymap("n", "z2", "<cmd>set foldlevel=2<cr>", { desc = "Foldlevel=2" })
Keymap("n", "z3", "<cmd>set foldlevel=3<cr>", { desc = "Foldlevel=3" })
--  }}}
