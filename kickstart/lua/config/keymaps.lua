-- General mappings {{{
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Don't yank on put
vim.keymap.set('x', 'p', '"_dP', { desc = "Don't yank on put" })

-- Save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
-- Visual yank
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy' })
-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
-- quit
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- highlights under cursor
vim.keymap.set('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })

-- LazyVim Changelog
vim.keymap.set('n', '<leader>L', function()
  Util.news.changelog()
end, { desc = 'LazyVim Changelog' })
-- }}}
-- COLEMAK mappings {{{
-- if Customize.keyboard == "colemak" then
-- Navigation
vim.keymap.set({ 'n', 'x' }, 'n', 'j', { desc = 'j -> n', noremap = true })
vim.keymap.set({ 'n', 'x' }, 'e', 'k', { desc = 'k -> e', noremap = true })
vim.keymap.set({ 'n' }, 'i', 'l', { desc = 'l -> i', noremap = true })
vim.keymap.set({ 'n', 'x' }, 'f', 'e', { desc = 'f -> e', noremap = true }) -- End of word
-- Enter insert mode
vim.keymap.set({ 'n' }, 'l', 'i', { desc = 'l -> i', noremap = true })
-- Window navigation
vim.keymap.set({ 'n' }, 'I', '<cmd>bn<cr>', { desc = 'Left window' })
vim.keymap.set({ 'n' }, '<C-i>', '<C-w>l', { desc = 'Right window' })
vim.keymap.set({ 'n' }, '<C-e>', '<C-w>k', { desc = 'Up window' })

-- Focus search results
vim.keymap.set('n', 'k', 'nzz', { desc = 'Next search result' })

-- Line start/end
vim.keymap.set({ 'n', 'x', 'o' }, '<D-h>', '^', { desc = 'Line Start [non-blank]' })
vim.keymap.set({ 'n', 'x', 'o' }, '<D-i>', '$', { desc = 'End of Line [non-blank]' })

-- Move line up/down
vim.keymap.set('n', '<D-e>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
vim.keymap.set('n', '<D-n>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
vim.keymap.set('i', '<D-n>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
vim.keymap.set('i', '<D-e>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
vim.keymap.set('v', '<D-n>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', '<D-e>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })
-- end
-- }}}
-- Navigation {{{
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', 'H', '<cmd>bp<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', 'I', '<cmd>bn<cr>', { desc = 'Previous buffer' })
-- }}}
-- Diagnostic keymaps {{{
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- }}}
-- Terminal {{{
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- }}}
-- n - Neotree {{{
vim.keymap.set('n', '<Leader>e', '<cmd>Neotree<cr>', { desc = 'Neotree' })
-- }}}
-- {{{ o - Options
vim.keymap.set('n', '<leader>oc', '<cmd>lua Functions.ClearReg()<cr>', { desc = 'Clear registers' })
vim.keymap.set('n', '<leader>oh', '<cmd>checkhealth<cr>', { desc = 'Check health' })
vim.keymap.set('n', '<leader>oH', '<cmd>silent vert bo help<cr>', { desc = 'Help' })
vim.keymap.set('n', '<leader>ol', '<cmd>set list!<cr>', { desc = 'Toogle [in]visible characters' })
vim.keymap.set('n', '<leader>oe', '<cmd>set foldmethod=expr<cr>', { desc = 'Folding [expr]' })
vim.keymap.set('n', '<leader>om', '<cmd>set foldmethod=marker<cr>', { desc = 'Folding [marker]' })
vim.keymap.set('n', '<leader>on', '<cmd>set foldmethod=manual<cr>', { desc = 'Folding [manual]' })
vim.keymap.set('n', '<leader>oi', '<cmd>set foldmethod=indent<cr>', { desc = 'Folding [indent]' })
vim.keymap.set('n', '<leader>os', '<cmd>set foldmethod=syntax<cr>', { desc = 'Folding [syntax]' })
--  }}}
-- {{{ u - UI
 -- stylua: ignore
vim.keymap.set( "n", "<leader>ub", "<cmd>lua require('config.functions').toggle_background()<cr>", { desc = "Toggle background" })
--  }}}
-- {{{ w - Window
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Equal split windows' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>wo', '<cmd>only<cr>', { desc = 'Only one window' })
vim.keymap.set('n', '<leader>wx', '<C-w>x', { desc = 'Swap current with next' })
vim.keymap.set('n', '<leader>wm', '<C-w>|', { desc = 'Max out width' })
--  }}}
