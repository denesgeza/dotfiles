-- {{{ Imports
Customize = require("config.customize")
Functions = require("config.functions")
Keymap = Functions.keymap
Is_Enabled = Functions.is_enabled
-- }}}
-- {{{ General mappings
-- Colemak mappings {{{
if Customize.keyboard == "colemak" then
  vim.keymap.set({ "n" }, "n", "j", { desc = "j -> n", remap = true })
  vim.keymap.set({ "n" }, "e", "k", { desc = "k -> e", remap = true })
  vim.keymap.set({ "n" }, "i", "l", { desc = "l -> i", remap = true })
  -- Enter insert mode
  vim.keymap.set({ "n" }, "l", "i", { desc = "l -> i", remap = true })

  -- Focus search results
  -- Keymap("n", "k", "nzz", { desc = "Next search result" })

  -- Start/End of line
  vim.keymap.set({ "n", "x", "o" }, "gh", "^", { desc = "Line Start [non-blank]" })
  vim.keymap.set({ "n", "x", "o" }, "gi", "$", { desc = "End of Line [non-blank]" })
end
-- }}}
-- QWERTY mappings {{{
if Customize.keyboard == "qwerty" then
  -- ESC key
  -- Keymap("i", "kj", "<Esc>")

  -- Start/End of line
  vim.keymap.set({ "n", "x", "o" }, "gh", "^", { desc = "Line Start [non-blank]" })
  vim.keymap.set({ "n", "x", "o" }, "gl", "$", { desc = "End of Line [non-blank]" })

  -- Go out of closing bracket
  -- vim.keymap.set("i", "jj", "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>")
end
-- }}}

-- Replace word under cursor across entire buffer
vim.keymap.set(
  "n",
  "<leader>sx",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)

-- Clear search
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search" })

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x', { desc = "Delete single character" })

-- Don't yank on put
vim.keymap.set("x", "p", '"_dP', { desc = "Don't yank on put" })

-- Visual yank
Keymap("v", "<leader>cc", '"+y', { desc = "Copy" })

-- Terminal mappings
Keymap("t", "<esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
Keymap("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })
--  }}}
-- {{{ f - Telescope
Keymap("n", "<leader><space>", "<cmd>lua Customize.telescope.find_files()<cr>", { desc = "Find Files" })
Keymap("n", "<leader>fs", "<cmd>Telescope spell_suggest<cr>", { desc = "Spelling" })
if Is_Enabled("nvim-notify") then
  Keymap("n", "<leader>fN", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", { desc = "Notifications" })
end
Keymap("n", "<leader>fn", "<cmd>lua Customize.telescope.edit_neovim()<cr>", { desc = "Dot Files" })
Keymap(
  "n",
  "<leader>fp",
  "<cmd>lua require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root, prompt_title='Find plugins', results_title = 'Plugins' }) <cr>",
  { desc = "Find plugin file" }
)
-- ------------------------------------------------------------------------- }}}
-- {{{ g - git
Keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Branches" })
Keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
-- }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.
Keymap("n", "J", "mzJ`z", { desc = "Join" })
Keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join" })

-- }}}
-- {{{ o - Options
Keymap("n", "<leader>oc", "<cmd>lua Functions.ClearReg()<cr>", { desc = "Clear registers" })
Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Check health" })
Keymap("n", "<leader>oH", "<cmd>silent vert bo help<cr>", { desc = "Help" })
Keymap("n", "<leader>ol", "<cmd>set list!<cr>", { desc = "Toogle [in]visible characters" })
Keymap("n", "<leader>om", "<cmd>set foldmethod=marker<cr>", { desc = "Folding [marker]" })
Keymap("n", "<leader>on", "<cmd>set foldmethod=manual<cr>", { desc = "Folding [manual]" })
Keymap("n", "<leader>oi", "<cmd>set foldmethod=indent<cr>", { desc = "Folding [indent]" })
Keymap("n", "<leader>os", "<cmd>set foldmethod=syntax<cr>", { desc = "Folding [syntax]" })
--  }}}
-- {{{ u - UI
Keymap("n", "<leader>uC", "<cmd>Telescope colorscheme<cr>", { desc = "ColorScheme" })
Keymap(
  "n",
  "<leader>ub",
  "<cmd>lua require('config.functions').toggle_background()<cr>",
  { desc = "Toggle background" }
)
Keymap("n", "<leader>ue", "<cmd>NoiceErrors<cr>", { desc = "Noice Errors" })
--  }}}
-- {{{ w - Window
Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
Keymap("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally
Keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only one window" })
Keymap("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
Keymap("n", "<leader>wm", "<C-w>|", { desc = "Max out width" })
--  }}}
-- {{{ v - VIM/Select commands
Keymap("n", "vv", "^vg_", { desc = "Select current line" })
Keymap("n", "vaa", "ggvGg_", { desc = "Select All" })
--  }}}
-- {{{ <tab> - Tabs
Keymap("n", "<leader><tab><tab>", "<cmd>tab split<cr>", { desc = "Create Tab" })
--  }}}
