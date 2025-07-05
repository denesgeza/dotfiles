Keymap = Functions.keymap

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

-- Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
-- Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
-- Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
-- Snacks.toggle.diagnostics():map '<leader>ud'
-- Snacks.toggle.line_number():map '<leader>ul'
-- Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = 'Conceal Level' }):map '<leader>uc'
-- Snacks.toggle.option('showtabline', { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = 'Tabline' }):map '<leader>uA'
-- Snacks.toggle.treesitter():map '<leader>uT'
-- Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
-- Snacks.toggle.dim():map '<leader>uD'
-- Snacks.toggle.animate():map '<leader>ua'
-- Snacks.toggle.indent():map '<leader>ug'
-- Snacks.toggle.scroll():map '<leader>uS'
-- Snacks.toggle.profiler():map '<leader>dpp'
-- Snacks.toggle.profiler_highlights():map '<leader>dph'

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
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
-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.jump { count = 1 } or vim.diagnostic.jump { count = -1 }
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
vim.keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
vim.keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
vim.keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
vim.keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })
-- Keymap for 'Go to Definition'
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
-- }}}
-- {{{ f - find
Keymap('n', '<leader>fa', '<cmd>edit ~/.config/aerospace/aerospace.toml<cr>', { desc = 'Aerospace config' })
Keymap('n', '<leader>fz', '<cmd>edit ~/.config/zellij/config.kdl<cr>', { desc = 'Zellij config' })
Keymap('n', '<leader>fk', '<cmd>edit ~/.config/kitty/kitty.conf<cr>', { desc = 'Kitty config' })
--  }}}
-- {{{ s - search
Keymap('n', '<leader>sv', '<cmd>silent vert bo help<cr>', { desc = 'Help' })
--  }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.
Keymap('n', 'J', 'mzJ`z', { desc = 'Join' })
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
Keymap('n', '<leader>uB', '<cmd>set list!<cr>', { desc = 'Toogle [in]visible characters' })
Keymap('n', '<leader>ut', "<cmd>lua require('config.functions').statusline()<cr>", { desc = 'Toggle statusline' })
--  }}}
-- {{{ w - Window
Keymap('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' }) -- split window vertically
Keymap('n', '<leader>we', '<C-w>=', { desc = 'Equal split windows' }) -- make split windows equal width & height
Keymap('n', '<leader>wh', '<C-w>s', { desc = 'Split horizontally' }) -- split window horizontally
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
-- {{{ z -
Keymap('n', 'z0', '<cmd>set foldlevel=0<cr>', { desc = 'Foldlevel=0' })
Keymap('n', 'z1', '<cmd>set foldlevel=1<cr>', { desc = 'Foldlevel=1' })
Keymap('n', 'z2', '<cmd>set foldlevel=2<cr>', { desc = 'Foldlevel=2' })
Keymap('n', 'z3', '<cmd>set foldlevel=3<cr>', { desc = 'Foldlevel=3' })
--  }}}
