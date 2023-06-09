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
if Is_Enabled("tmux-navigator") then
  Keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left" })
  Keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right" })
  Keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down" })
  Keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up" })
end

-- Start/End of line
vim.keymap.set({ "n", "x", "o" }, "<C-h>", "^", { desc = "Line Start [non-blank]" })
vim.keymap.set({ "n", "x", "o" }, "<C-l>", "$", { desc = "End of Line" })

-- Swap : and ;
vim.keymap.set({ "n", "x" }, ":", ";", { desc = "Jump to next character" })
vim.keymap.set({ "n", "x" }, ";", ":", { desc = "Command mode" })

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x')

-- Go out of closing bracket
vim.keymap.set("i", "jj", "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>")
-- This could also be, but goes at the end of the line
-- vim.keymap.set("i", "jj", "<Esc>A", { desc = "Move one char right" })

-- Pressing <CR> selects the current word and increases the selection to the parent Treesitter node.
require("nvim-treesitter.configs").setup({
  -- <snip>
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
    },
  },
})

-- Stay in indent mode.
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- Don't yank on put
vim.keymap.set("x", "p", '"_dP')

-- Visual yank
Keymap("v", "<leader>cc", '"+y')
-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

Keymap("n", "<leader>bl", "<cmd>vertical resize -1<cr>")
Keymap("n", "<leader>bh", "<cmd>vertical resize +1<cr>")
Keymap("n", "<leader>bj", "<cmd>resize +3<cr>")
Keymap("n", "<leader>bk", "<cmd>resize -3<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Code.

Keymap("n", "<leader>ce", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace Diagnostics" })
Keymap("n", "<leader>cn", "<cmd>NullLsInfo<cr>", { desc = "Null LS Info" })

-- ------------------------------------------------------------------------- }}}
-- {{{ d - Debug/Database

if Is_Enabled("dadbod") then
  Keymap("n", "<leader>du", "<cmd>DBUIToggle<cr>", { desc = "DB Toggle UI" })
  Keymap("n", "<leader>df", "<cmd>DBUIFindBuffer<cr>", { desc = "DB Find buffer" })
  Keymap("n", "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", { desc = "DB Rename buffer" })
  Keymap("n", "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", { desc = "DB Last Query Info" })
  vim.g["db_ui_save_location"] = "~/.config/nvim/temp/db"
end

-- ------------------------------------------------------------------------- }}}
-- {{{ e - Neo-tree/Mini-files

-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find & tmux

Keymap("n", "<leader><space>", "<cmd>lua Customize.telescope.find_files()<cr>", { desc = "Find Files" })
Keymap("n", "<leader>fa", "<cmd>Telescope marks<cr>", { desc = "Marks" })
Keymap("n", "<leader>fA", "<cmd>Telescope man_pages<cr>", { desc = "Manual Pages" })
Keymap(
  "n",
  "<leader>fb",
  [[<Cmd>lua require'telescope.builtin'.buffers({prompt_title = ' Key', results_title='﬘ Open buffers', layout_strategy = 'vertical', layout_config = { width = 0.60, height = 0.55 }})<CR>]],
  { noremap = true, silent = true, desc = "Buffers" }
)
-- Keymap("n", "<leader>fB", "<cmd>lua Customize.telescope.file_browser()<cr>", { desc = "File Browser" })
Keymap("n", "<leader>fc", "<cmd>lua Customize.telescope.commands()<cr>", { desc = "Commands" })
if Is_Enabled("telescope-frecency.nvim") then
  Keymap("n", "<leader>fd", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", { desc = "Frecency" })
end
Keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
Keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep `live`" })
Keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
Keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
Keymap("n", "<leader>fl", "<cmd>Telescope resume<cr>", { desc = "Resume" })
Keymap("n", "<leader>fs", "<cmd>Telescope spell_suggest<cr>", { desc = "Spelling" })
Keymap("n", "<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", { desc = "Notifications" })
Keymap("n", "<leader>fN", "<cmd>lua Customize.telescope.edit_neovim()<cr>", { desc = "Neovim" })
Keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Old files" })
-- Keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Projects" })
Keymap("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Registers" })
Keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find words" })
Keymap("n", "<leader>fv", "<cmd>Telescope vim_options<cr>", { desc = "VIM options" })

if Is_Enabled("todo-comments.nvim") then
  Keymap("n", "<leader>fy", "<cmd>TodoTelescope<cr>", { desc = "TODO" })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

Keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
Keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
Keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Git status" })

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
-- {{{ n - Neorg

Keymap("n", "<leader>ni", "<cmd>Neorg index<cr>", { desc = "Index" })
Keymap("n", "<leader>nj", "<cmd>Neorg journal<cr>", { desc = "Journal" })
Keymap("n", "<leader>nt", "<cmd>Neorg toggle-concealer<cr>", { desc = "Concealer" })
Keymap("n", "<leader>nr", "<cmd>Neorg <cr>", { desc = "Neorg" })
Keymap("n", "<leader>nr", "<cmd>Neorg module <cr>", { desc = "Module" })
Keymap("n", "<leader>nw", "<cmd>Neorg workspace <cr>", { desc = "Workspace" })
Keymap("n", "<leader>nx", "<cmd>Neorg return <cr>", { desc = "Return" })

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Check health" })
Keymap("n", "<leader>ol", "<cmd>set list!<cr>", { desc = "Toogle [in]visible characters" })
Keymap("n", "<leader>om", "<cmd>set foldmethod=marker foldlevel=10<cr>", { desc = "Folding [marker]" })
Keymap("n", "<leader>oi", "<cmd>set foldmethod=indent foldlevel=10<cr>", { desc = "Folding [indent]" })

if Is_Enabled("ufo") then
  Keymap(
    "n",
    "<leader>ou",
    "<cmd>set foldcolumn=1 foldlevel=99 foldlevelstart=99 foldenable<cr>",
    { desc = "Folding [ufo] - default" }
  )
end

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
  if Is_Enabled("ranger") then
    Keymap("n", "<leader>tr", "<cmd>lua Customize.toggleterm.ranger()<cr>", { desc = "Ranger" })
  end
  Keymap("n", "<leader>tp", "<cmd>lua Customize.toggleterm.python()<cr>", { desc = "Python" })
  Keymap("n", "<leader>tn", "<cmd>lua Customize.toggleterm.node()<cr>", { desc = "Node" })
  Keymap("n", "<leader>ts", "<cmd>lua Customize.toggleterm.htop()<cr>", { desc = "HTop" })
  Keymap("n", "<leader>tb", "<cmd>lua Customize.toggleterm.btop()<cr>", { desc = "BTop" })
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
Keymap("n", "<leader>ut", "<cmd>Themery<cr>", { desc = "Themery" })

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
-- {{{ z - Folding

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- ------------------------------------------------------------------------- }}}
-- {{{ <tab> - Tabs

Keymap("n", "<leader><tab><tab>", "<cmd>tab split<cr>", { desc = "Create Tab" })

-- ------------------------------------------------------------------------- }}}
