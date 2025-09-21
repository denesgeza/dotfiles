local term = require('config.functions').get_terminal_info().terminal

local Manager = {
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ['blink'] = { enabled = Settings.completion == 'blink' },
    ['blink-copilot'] = { enabled = false },
    ['codecompanion'] = { enabled = true },
    ['copilot-chat'] = { enabled = false },
    ['conform'] = { enabled = true },
    ['trouble'] = { enabled = true },
    ['vim-visual-multi'] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ['everforest'] = { enabled = false },
    -- }}}
    -- Editor {{{
    ['dadbod'] = { enabled = false },
    ['flash'] = { enabled = false },
    ['gitsigns'] = { enabled = true },
    ['nvim-surround'] = { enabled = false },
    ['obsidian'] = { enabled = true },
    ['which-key'] = { enabled = true },
    -- }}}
    -- UI {{{
    ['bufferline'] = { enabled = Settings.tabline == true },
    ['render-markdown'] = { enabled = true },
    ['snacks'] = { enabled = true },
    ['smear-cursor'] = { enabled = term == 'ghostty' },
    ['todo-comments'] = { enabled = true },
    -- }}}
    -- Languages {{{
    ['python'] = { enabled = true },
    ['latex'] = { enabled = false },
    ['typescript'] = { enabled = true },
    ['typst'] = { enabled = true },
    -- }}}
    -- Language tools {{{
    -- Python
    ['uv'] = { enabled = true },
    -- }}}
    -- Miscelaneous {{{
    ['vim_be_better'] = { enabled = false },
    -- }}}
  },
}

return Manager
