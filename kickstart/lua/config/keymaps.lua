Keymap = Functions.keymap

-- {{{ General
Keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
Keymap('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
Keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
Keymap('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
Keymap('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
Keymap('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })

-- Start/End of line
vim.keymap.set({ 'n', 'x', 'o' }, 'gh', '^', { desc = 'Line Start [non-blank]' })
vim.keymap.set({ 'n', 'x', 'o' }, 'gl', '$', { desc = 'Endof Line [non-blank]' })
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- better indenting
Keymap('v', '<', '<gv')
Keymap('v', '>', '>gv')

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Don't yank on put
vim.keymap.set('x', 'p', '"_dP', { desc = "Don't yank on put" })

-- Visual yank
Keymap('v', '<C-c>', '"+y', { desc = 'Copy' })
--  }}}
-- {{{ g - go to
--
-- Keymap for 'Go to Definition'
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
-- }}}
-- {{{ f - find
Keymap('n', '<leader>fa', '<cmd>edit ~/.config/aerospace/aerospace.toml<cr>', { desc = 'Aerospace config' })
Keymap('n', '<leader>fg', '<cmd>edit ~/.config/ghostty/config<cr>', { desc = 'Ghostty config' })
Keymap('n', '<leader>fk', '<cmd>edit ~/.config/kitty/kitty.conf<cr>', { desc = 'Kitty config' })
Keymap('n', '<leader>fz', '<cmd>edit ~/.config/zellij/config.kdl<cr>', { desc = 'Zellij config' })
--  }}}
-- {{{ s - search
Keymap('n', '<leader>sv', '<cmd>silent vert bo help<cr>', { desc = 'Help' })
--  }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.
Keymap('n', 'J', 'mzJ`z', { desc = 'Join' })
-- }}}
-- {{{ u - UI
 -- stylua: ignore
Keymap( "n", "<leader>ub", "<cmd>lua require('config.functions').toggle_background()<cr>", { desc = "Toggle background" })
Keymap('n', '<leader>uB', '<cmd>set list!<cr>', { desc = 'Toogle [in]visible characters' })
Keymap('n', '<leader>ut', "<cmd>lua require('config.functions').statusline()<cr>", { desc = 'Toggle Statusline' })
--  }}}
-- {{{ w - Window
Keymap('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' }) -- split window vertically
Keymap('n', '<leader>we', '<C-w>=', { desc = 'Equal split windows' }) -- make split windows equal width & height
Keymap('n', '<leader>wh', '<C-w>s', { desc = 'Split horizontally' }) -- split window horizontally
Keymap('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' })
Keymap('n', '<leader>wo', '<cmd>only<cr>', { desc = 'Only one window' })
Keymap('n', '<leader>wx', '<C-w>x', { desc = 'Swap current with next' })
Keymap('n', '<leader>wm', '<C-w>|', { desc = 'Max out width' })
--  }}}
-- {{{ x - Exit
Keymap('n', '<leader>xz', '<cmd>restart<cr>', { desc = 'Restart Neovim' })
-- }}}
-- {{{ v - VIM/Select commands
Keymap('n', 'vv', '^vg_', { desc = 'Select current line' })
Keymap('n', 'vaa', 'ggvGg_', { desc = 'Select All' })
--  }}}
-- {{{ z - fold
Keymap('n', 'z0', '<cmd>set foldlevel=0<cr>', { desc = 'Foldlevel=0' })
Keymap('n', 'z1', '<cmd>set foldlevel=1<cr>', { desc = 'Foldlevel=1' })
Keymap('n', 'z2', '<cmd>set foldlevel=2<cr>', { desc = 'Foldlevel=2' })
Keymap('n', 'z3', '<cmd>set foldlevel=3<cr>', { desc = 'Foldlevel=3' })
--  }}}
