Keymap = Functions.keymap
-- General {{{
Keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
Keymap('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
Keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
Keymap('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
Keymap('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
Keymap('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
Keymap('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
Keymap('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })

-- Start/End of line
Keymap({ 'n', 'x', 'o' }, 'gh', '^', { desc = 'Line Start [non-blank]' })
Keymap({ 'n', 'x', 'o' }, 'gl', '$', { desc = 'Endof Line [non-blank]' })

--  See `:help hlsearch`
Keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- better indenting
Keymap('v', '<', '<gv')
Keymap('v', '>', '>gv')

Keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Don't yank on put
Keymap('x', 'p', '"_dP', { desc = "Don't yank on put" })
-- }}}
-- {{{ a - Ai
Keymap('n', '<leader>ac', '<CMD>CodeCompanionChat<CR>', { desc = 'Chat' })
Keymap('n', '<leader>aa', '<CMD>CodeCompanionActions<CR>', { desc = 'Actions' })
Keymap('n', '<leader>ai', '<CMD>CodeCompanion<CR>', { desc = 'Inline Assistant' })
-- }}}
-- {{{ c - Code
-- Run current line
Keymap('n', '<leader>cx', '<CMD>:.lua<CR>', { desc = 'Run current line' })
Keymap('n', '<leader>ci', '<CMD>Conform Info<CR>', { desc = 'Conform Info' })
-- }}}
-- {{{ f - find
Keymap('n', '<leader>fa', '<cmd>edit ~/.config/aerospace/aerospace.toml<cr>', { desc = 'Aerospace config' })
Keymap('n', '<leader>fg', '<cmd>edit ~/.config/ghostty/config<cr>', { desc = 'Ghostty config' })
Keymap('n', '<leader>fk', '<cmd>edit ~/.config/kitty/kitty.conf<cr>', { desc = 'Kitty config' })
Keymap('n', '<leader>fz', '<cmd>edit ~/.config/zellij/config.kdl<cr>', { desc = 'Zellij config' })
--  }}}
-- {{{ J - Join
--  Keep the cursor in place while joining lines.
Keymap('n', 'J', 'mzJ`z', { desc = 'Join' })
-- }}}
-- {{{ q - Exit
Keymap('n', '<leader>qr', '<cmd>restart<cr>', { desc = 'Restart Neovim' })
-- }}}
-- {{{ v - VIM/Select commands
Keymap('n', 'vv', '^vg_', { desc = 'Select current line' })
Keymap('n', 'vaa', 'ggvGg_', { desc = 'Select All' })
--  }}}
-- {{{ w - Window
Keymap('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' }) -- split window vertically
Keymap('n', '<leader>we', '<C-w>=', { desc = 'Equal split windows' }) -- make split windows equal width & height
Keymap('n', '<leader>wh', '<C-w>s', { desc = 'Split horizontally' }) -- split window horizontally
Keymap('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' })
Keymap('n', '<leader>wo', '<cmd>only<cr>', { desc = 'Only one window' })
Keymap('n', '<leader>wx', '<C-w>x', { desc = 'Swap current with next' })
Keymap('n', '<leader>wm', '<C-w>|', { desc = 'Max out width' })
--  See `:help wincmd` for a list of all window commands
Keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
Keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
Keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
Keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--  }}}
-- {{{ u - Toggle
 -- stylua: ignore
Keymap('n', '<leader>uu', '<CMD>lua vim.pack.update() <CR>', { desc = 'Update packages' })
Keymap('n', '<leader>ug', '<CMD>lua vim.pack.get() <CR>', { desc = 'Get packages' })
Keymap('n', '<leader>ub', "<cmd>lua require('config.functions').toggle_background()<cr>", { desc = 'Toggle background' })
Keymap('n', '<leader>ud', "<cmd>lua require('config.functions').toggle_virtual_lines()<cr>", { desc = 'Toggle virtual lines' })
Keymap('n', '<leader>uD', "<cmd>lua require('config.functions').toggle_virtual_text()<cr>", { desc = 'Toggle virtual text' })
Keymap('n', '<leader>uB', '<cmd>set list!<cr>', { desc = 'Toogle [in]visible characters' })
Keymap('n', '<leader>ut', "<cmd>lua require('config.functions').statusline()<cr>", { desc = 'Toggle Statusline' })
-- }}}
-- {{{ z - fold
Keymap('n', 'z0', '<cmd>set foldlevel=0<cr>', { desc = 'Foldlevel=0' })
Keymap('n', 'z1', '<cmd>set foldlevel=1<cr>', { desc = 'Foldlevel=1' })
Keymap('n', 'z2', '<cmd>set foldlevel=2<cr>', { desc = 'Foldlevel=2' })
Keymap('n', 'z3', '<cmd>set foldlevel=3<cr>', { desc = 'Foldlevel=3' })
--  }}}

-- {{{ Completion navigation keymaps in insert mode
if Settings.completion == 'native' then
  Keymap('i', '<C-Space>', function()
    vim.lsp.completion.get()
  end, { desc = 'Trigger lsp completion' })

  Keymap('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
  end, { expr = true, noremap = true })

  Keymap('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
  end, { expr = true, noremap = true })

  Keymap('i', '<CR>', function()
    return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
  end, { expr = true, noremap = true })
end
-- }}}
-- vim:tw=120:ts=2:sw=2:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:fen:
