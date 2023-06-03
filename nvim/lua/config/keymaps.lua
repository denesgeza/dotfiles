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
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Navigation
Keymap("n", "<leader>h", "<C-w>h", { desc = "Left window" }) -- jump to window on left
Keymap("n", "<leader>l", "<C-w>l", { desc = "Right window" }) -- jump to window on right
Keymap("n", "<leader>j", "<C-w>j", { desc = "Bottom window" }) -- jump to window on the bottom
Keymap("n", "<leader>k", "<C-w>k", { desc = "Top window" }) -- jump to window on the top

-- -- Tmux Navigation

Keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left" })
Keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right" })
Keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down" })
Keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up" })

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x')

-- Delete the current line.
Keymap("n", "-", "dd")

-- Save all files.
Keymap("n", "<F2>", "<cmd>wall<cr>")

-- Stay in indent mode.
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- Visual yank
Keymap("v", "<leader>cc", '"+y')

-- Obfuscate
Keymap("n", "<f3>", "mmggg?G`m")

-- <leader>x conflicts with LazyVim
-- Keymap("n", "<leader>X", "<Plug>(bullets-toggle-checkbox)")

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

Keymap("n", "<leader>bl", "<cmd>vertical resize -1<cr>")
Keymap("n", "<leader>bh", "<cmd>vertical resize +1<cr>")
Keymap("n", "<leader>bj", "<cmd>resize +1<cr>")
Keymap("n", "<leader>bk", "<cmd>resize -1<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find & tmux

if Is_Enabled("telescope.nvim") then
  Keymap("n", "<leader><leader>", "<cmd>Telescope git_files<cr>", { desc = "Git Files" })
  Keymap("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
  Keymap("n", "<leader>fF", "<cmd>Telescope media_files<cr>")
  Keymap("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "Manual Pages" })
  Keymap("n", "<leader>fR", "<cmd>Telescope registers<cr>", { desc = "Registers" })
  Keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
  Keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
  Keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
  Keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep `live`" })
  Keymap("n", "<leader>fl", "<cmd>Telescope resume<cr>", { desc = "Resume" })
  Keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Old files" })
  Keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Projects" }) -- Not installed
  Keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find words" })
  -- Keymap("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Notifications" })
end

if Is_Enabled("todo-comments.nvim") then
  Keymap("n", "<leader>fy", "<cmd>TodoTelescope<cr>", { desc = "TODO" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

if Is_Enabled("telescope.nvim") then
  Keymap("n", "<leader>gC", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
  Keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
  Keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
end
--
-- if Is_Enabled("vim-fugitive") then
--   Keymap("n", "<leader>gc", "<cmd>G commmit<cr>", { desc = "Commit" })
--   Keymap("n", "<leader>gd", "<cmd>G diff<cr>", { desc = "Diff" })
--   Keymap("n", "<leader>gl", "<cmd>G log<cr>", { desc = "Git log" })
--   Keymap("n", "<leader>gh", "<cmd>vert bo help fugitive<cr>")
--   Keymap("n", "<leader>gp", "<cmd>G push<cr>", { desc = "Push" })
--   Keymap("n", "<leader>gP", "<cmd>G pull<cr>", { desc = "Pull" })
--   Keymap("n", "<leader>gs", "<cmd>G<cr>")
-- end

-- if Is_Enabled("vim-bundle-plantuml") then
--   Keymap("n", "<leader>gu", "<cmd>call GenerateUmlDiagram<cr>")
-- end

Keymap("n", "gk", [[0mMvg_"ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
Keymap("v", "gk", [["ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

Keymap("n", "<leader>H", "<cmd>silent vert bo help<cr>", { desc = "Help" })

-- ------------------------------------------------------------------------- }}}
-- {{{ L - Lazy

-- LazyVim
Keymap("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- ------------------------------------------------------------------------- }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.

Keymap("n", "J", "mzJ`z", { desc = "Join" })
Keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join" })

-- ------------------------------------------------------------------------- }}}
-- {{{ n - Noice/Neorg
Keymap("n", "<leader>ni", "<cmd>Neorg index<cr>", { desc = "Neorg index" })
Keymap("n", "<leader>nt", "<cmd>Neorg toggle-concealer<cr>", { desc = "Neorg concealer" })
Keymap("n", "<leader>nr", "<cmd>Neorg <cr>", { desc = "Neorg" })
Keymap("n", "<leader>nh", "<cmd>NoiceErrors<cr>", { desc = "Noice Errors" })
-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Check health" })
Keymap("n", "<leader>oo", "<cmd>only<cr>", { desc = "Only one window" })

-- if Is_Enabled("oil") then
--   Keymap("n", "-", require("oil").open, { desc = "Open parent directory" })
-- end
-- if Is_Enabled("zen-mode.nvim") then
--   Keymap("n", "<leader>oz", [[<cmd>lua require("zen-mode").toggle()<cr>]])
-- end

-- ------------------------------------------------------------------------- }}}
-- {{{ O - Outline

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

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Hop
if Is_Enabled("hop") then
  Keymap("n", "s", ":HopChar1<cr>", { desc = "Hop to word" })
  Keymap("n", "S", ":HopPattern<cr>", { desc = "Hop to Pattern" })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ T - ToggleTerm

if Is_Enabled("toggleterm.nvim") then
  Keymap("n", "<leader>Tf", [[<cmd>lua Customize.toggleterm.float()<cr>]], { desc = "Float" })
  Keymap("n", "<leader>Th", "<cmd>lua Customize.toggleterm.horizontal()<cr>", { desc = "Horizontal" })
  Keymap("n", "<leader>Tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })
  Keymap("n", "<leader>Tr", "<cmd>lua Customize.toggleterm.ranger()<cr>", { desc = "Ranger" })
  Keymap("n", "<leader>Tp", "<cmd>lua Customize.toggleterm.python()<cr>", { desc = "Python" })
  Keymap("n", "<leader>Tn", "<cmd>lua Customize.toggleterm.node()<cr>", { desc = "Node" })
  Keymap("n", "<leader>Ts", "<cmd>lua Customize.toggleterm.htop()<cr>", { desc = "HTop" })
  -- ToggleTerm mappings
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

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Window

Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
Keymap("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally

-- ------------------------------------------------------------------------- }}}
-- {{{ v - VIM/Select commands
-- Indent
Keymap("n", "<leader>vl", "<cmd>set list!<cr>", { desc = "Toogle [in]visible characters" })
Keymap("n", "<leader>vm", "<cmd>set foldmethod=marker foldlevel=10<cr>", { desc = "Folding [marker]" })
Keymap("n", "<leader>vi", "<cmd>set foldmethod=indent foldlevel=10<cr>", { desc = "Folding [indent]" })

if Is_Enabled("ufo") then
  Keymap(
    "n",
    "<leader>vu",
    "<cmd>set foldcolumn=1 foldlevel=99 foldlevelstart=99 foldenable<cr>",
    { desc = "Folding [ufo]" }
  )
end
-- Select
Keymap("n", "vv", "^vg_", { desc = "Select current line" })
Keymap("n", "vaa", "ggvGg_", { desc = "Select All - below" })
Keymap("n", "Vaa", "ggVG", { desc = "Select All - above" })
Keymap("n", "<leader>V", "V`]", { desc = "Select All" })

-- ------------------------------------------------------------------------- }}}
-- {{{ z - Folding
-- Keymap("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
-- Keymap("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })
-- ------------------------------------------------------------------------- }}}
