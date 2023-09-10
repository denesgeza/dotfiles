-- {{{ Global definitions
Customize = require("config.customize")
Functions = require("config.functions")
Keymap = Functions.keymap
Is_Enabled = Functions.is_enabled
-- ------------------------------------------------------------------------- }}}
-- {{{ General mappings
-- ESC key
Keymap("i", "kj", "<Esc>")

-- Clear search
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search" })

-- Focus navigation up/down
Keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
Keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Focus search results
Keymap("n", "n", "nzz", { desc = "Next search result" })
Keymap("n", "N", "Nzz", { desc = "Previous search result" })

-- Start/End of line
vim.keymap.set({ "n", "x", "o" }, "gh", "^", { desc = "Line Start [non-blank]" })
vim.keymap.set({ "n", "x", "o" }, "gl", "$", { desc = "End of Line [non-blank]" })

-- -- Tmux Navigation
if Is_Enabled("tmux-navigator") then
  Keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window Left" })
  Keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })
  Keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window Down" })
  Keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })
end

-- Switch windows
Keymap("n", "<C-x>", "<C-w>x", { desc = "Switch windows" })

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x', { desc = "Delete single character" })

-- Go out of closing bracket
vim.keymap.set("i", "jj", "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>")

-- Stay in indent mode.
Keymap("v", "<", "<gv", { desc = "Indent left" })
Keymap("v", ">", ">gv", { desc = "Indent right" })

-- Don't yank on put
vim.keymap.set("x", "p", '"_dP', { desc = "Don't yank on put" })

-- Visual yank
Keymap("v", "<leader>cc", '"+y', { desc = "Copy" })
-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.
Keymap("n", "<leader>bl", "<cmd>vertical resize -1<cr>", { desc = "Decrease buffer height" })
Keymap("n", "<leader>bh", "<cmd>vertical resize +1<cr>", { desc = "Increase buffer height" })
Keymap("n", "<leader>bj", "<cmd>resize +3<cr>", { desc = "Increase buffer height" })
Keymap("n", "<leader>bk", "<cmd>resize -3<cr>", { desc = "Decrease buffer height" })
-- ------------------------------------------------------------------------- }}}
-- {{{ c - Code.
if Is_Enabled("null-ls") then
  Keymap("n", "<leader>cn", "<cmd>NullLsInfo<cr>", { desc = "Null LS Info" })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ d - Debug/Database
if Is_Enabled("dadbod") then
  Keymap("n", "<leader>du", "<cmd>DBUIToggle<cr>", { desc = "DB Toggle UI" })
  Keymap("n", "<leader>df", "<cmd>DBUIFindBuffer<cr>", { desc = "DB Find buffer" })
  Keymap("n", "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", { desc = "DB Rename buffer" })
  Keymap("n", "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", { desc = "DB Last Query Info" })
  vim.g["db_ui_save_location"] = "~/.config/nvim/temp/db"
end

if Is_Enabled("compiler.nvim") then
  Keymap("n", "<leader>dc", "<cmd>CompilerOpen<cr>", { desc = "Compiler Open" })
  Keymap("n", "<leader>dt", "<cmd>CompilerToggleResults<cr>", { desc = "Compiler Toggle Results" })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find & tmux
Keymap("n", "<leader><space>", "<cmd>lua Customize.telescope.find_files()<cr>", { desc = "Find Files" })
Keymap(
  "n",
  "<leader>fb",
  [[<Cmd>lua require'telescope.builtin'.buffers({prompt_title = 'Key', results_title='Open buffers', layout_strategy = 'vertical', layout_config = { width = 0.60, height = 0.55 }})<CR>]],
  { noremap = true, silent = true, desc = "Buffers" }
)
Keymap("n", "<leader>fs", "<cmd>Telescope spell_suggest<cr>", { desc = "Spelling" })
Keymap("n", "<leader>fN", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", { desc = "Notifications" })
Keymap("n", "<leader>fn", "<cmd>lua Customize.telescope.edit_neovim()<cr>", { desc = "Dot Files" })
Keymap(
  "n",
  "<leader>fp",
  "<cmd>lua require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root, prompt_title='Find plugins', results_title = 'Plugins' }) <cr>",
  { desc = "Find plugin file" }
)
-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

Keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Commits" })
Keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Branches" })
Keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })

-- }}}
-- {{{ h - harpoon
Keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add mark" })
Keymap("n", "<leader>hh", "<cmd>Telescope harpoon marks<cr>", { desc = "Harpoon marks" })
Keymap("n", "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Manage Marks" })
-- }}}
-- {{{ H - Help

Keymap("n", "<leader>H", "<cmd>silent vert bo help<cr>", { desc = "Help" })

-- ------------------------------------------------------------------------- }}}
-- {{{ L - Lazy

Keymap("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- ------------------------------------------------------------------------- }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.

Keymap("n", "J", "mzJ`z", { desc = "Join" })
Keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join" })

-- ------------------------------------------------------------------------- }}}
-- {{{ m - Copilot
if Is_Enabled("Copilot") then
  Keymap("n", "<leader>mo", "<cmd>lua require('copilot.panel').open({'bottom', 0.2})<cr>", { desc = "Copilot Panel" })
  Keymap("n", "<leader>ma", "<cmd>lua require('copilot.panel').accept()<cr>", { desc = "Copilot Accept" })
  Keymap("n", "<leader>mn", "<cmd>lua require('copilot.panel').jump_next()<cr>", { desc = "Copilot Next" })
  Keymap("n", "<leader>mp", "<cmd>lua require('copilot.panel').jump_prev()<cr>", { desc = "Copilot Previous" })
  Keymap("n", "<leader>mr", "<cmd>lua require('copilot.panel').refresh()<cr>", { desc = "Copilot Refresh" })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ n - Neorg
if Is_Enabled("neorg") then
  Keymap("n", "<leader>ni", "<cmd>Neorg index<cr>", { desc = "Index" })
  Keymap("n", "<leader>nj", "<cmd>Neorg journal<cr>", { desc = "Journal" })
  Keymap("n", "<leader>nt", "<cmd>Neorg toggle-concealer<cr>", { desc = "Concealer" })
  Keymap("n", "<leader>nr", "<cmd>Neorg <cr>", { desc = "Neorg" })
  Keymap("n", "<leader>nr", "<cmd>Neorg module <cr>", { desc = "Module" })
  Keymap("n", "<leader>nw", "<cmd>Neorg workspace <cr>", { desc = "Workspace" })
  Keymap("n", "<leader>nx", "<cmd>Neorg return <cr>", { desc = "Return" })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options
Keymap("n", "<leader>oc", "<cmd>lua Functions.ClearReg()<cr>", { desc = "Clear registers" })
Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Check health" })
Keymap("n", "<leader>ol", "<cmd>set list!<cr>", { desc = "Toogle [in]visible characters" })
Keymap("n", "<leader>om", "<cmd>set foldmethod=marker<cr>", { desc = "Folding [marker]" })
Keymap("n", "<leader>oi", "<cmd>set foldmethod=indent<cr>", { desc = "Folding [indent]" })
Keymap("n", "<leader>os", "<cmd>set foldmethod=syntax<cr>", { desc = "Folding [syntax]" })
-- ------------------------------------------------------------------------- }}}
-- {{{ O - Outline
if Is_Enabled("outline") then
  Keymap("n", "<Leader>O", "<cmd>SymbolsOutline<CR>", { desc = "Outline" })
  -- keys:
  -- - Esc - close
  -- - Enter - goto location in code
  -- - o - goto location without loosing focus
  -- - Ctrl-Space - Hover current symbol
  -- - K - Preview
  -- - r - rename
  -- - a - code actions
  -- - h - fold symbol
  -- - l - unfold symbol
  -- - W - fold all
  -- - E - unfold all
  -- - ? - Show help message
end
-- ------------------------------------------------------------------------- }}}
-- {{{ t - ToggleTerm
if Is_Enabled("toggleterm.nvim") then
  Keymap("n", "<leader>tf", "<cmd>lua Customize.toggleterm.float()<cr>", { desc = "Float" })
  Keymap("n", "<leader>th", "<cmd>lua Customize.toggleterm.horizontal()<cr>", { desc = "Horizontal" })
  Keymap("n", "<leader>tv", "<cmd>lua Customize.toggleterm.vertical()<cr>", { desc = "Vertical" })
  Keymap("n", "<leader>tp", "<cmd>lua Customize.toggleterm.python()<cr>", { desc = "Python" })
  Keymap("n", "<leader>tn", "<cmd>lua Customize.toggleterm.node()<cr>", { desc = "Node" })
  Keymap("n", "<leader>tb", "<cmd>lua Customize.toggleterm.btop()<cr>", { desc = "BTop" })
  Keymap("n", "<leader>tl", "<cmd>lua Customize.toggleterm.lazygit()<cr>", { desc = "LazyGit" })
  -- ToggleTerm mappings
  Keymap("n", "<C-\\>", "<cmd>ToggleTerm<cr>")
  Keymap("t", "<esc>", [[<C-\><C-n>]])
  Keymap("t", "kj", [[<C-\><C-n>]])
  Keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
  Keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
  Keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
  Keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
  Keymap("t", "<C-w>", [[<C-\><C-n><C-w>]])
end
-- ------------------------------------------------------------------------- }}}
-- {{{ u - UI
Keymap("n", "<leader>uC", "<cmd>Telescope colorscheme<cr>", { desc = "ColorScheme" })
Keymap("n", "<leader>ue", "<cmd>NoiceErrors<cr>", { desc = "Noice Errors" })
Keymap("n", "<leader>uz", "<cmd>lua require('zen-mode').toggle({window={width=0.85}})<cr>", { desc = "Zen mode" })
-- ------------------------------------------------------------------------- }}}
-- {{{ w - Window
Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
Keymap("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally
Keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only one window" })
-- ------------------------------------------------------------------------- }}}
-- {{{ v - VIM/Select commands
Keymap("n", "vv", "^vg_", { desc = "Select current line" })
Keymap("n", "vaa", "ggvGg_", { desc = "Select All" })
-- ------------------------------------------------------------------------- }}}
-- {{{ <tab> - Tabs
Keymap("n", "<leader><tab><tab>", "<cmd>tab split<cr>", { desc = "Create Tab" })
-- ------------------------------------------------------------------------- }}}
