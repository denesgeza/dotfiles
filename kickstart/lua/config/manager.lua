local Manager = {
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ['blink'] = { enabled = Settings.completion == 'blink' },
    ['blink-copilot'] = { enabled = false },
    ['conform'] = { enabled = true },
    ['trouble'] = { enabled = true },
    ['vim-visual-multi'] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ['everforest'] = { enabled = false },
    ['gruvbox'] = { enabled = false },
    ['kanagawa'] = { enabled = false },
    ['rose-pine'] = { enabled = false },
    ['tokyonight'] = { enabled = false },
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
    ['lualine'] = { enabled = Settings.statusline == 'lualine', defaults = false },
    ['render-markdown'] = { enabled = true },
    ['snacks'] = { enabled = true },
    ['smear-cursor'] = { enabled = false },
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
