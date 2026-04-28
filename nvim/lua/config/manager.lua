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
    ['kanagawa'] = { enabled = false },
    ['koda'] = { enabled = false },
    -- }}}
    -- Editor {{{
    ['dadbod'] = { enabled = false },
    ['flash'] = { enabled = false },
    ['gitsigns'] = { enabled = true },
    ['nvim-surround'] = { enabled = Settings.surround == 'nvim-surround' },
    ['obsidian'] = { enabled = true },
    ['which-key'] = { enabled = true },
    -- }}}
    -- UI {{{
    ['bufferline'] = { enabled = Settings.tabline == true },
    ['render-markdown'] = { enabled = true },
    ['snacks'] = { enabled = true },
    ['todo-comments'] = { enabled = true },
    -- }}}
    -- Languages {{{
    ['python'] = { enabled = true },
    ['latex'] = { enabled = false },
    ['typescript'] = { enabled = true },
    ['typst'] = { enabled = true },
    -- }}}
    -- Python {{{
    ['uv'] = { enabled = true },
    ['django'] = { enabled = false },
    -- }}}
  },
}

return Manager
