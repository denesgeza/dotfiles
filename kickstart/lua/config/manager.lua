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
    ['catppuccin'] = { enabled = false },
    ['everforest'] = { enabled = true },
    ['gruvbox'] = { enabled = false },
    ['kanagawa'] = { enabled = false },
    ['rose-pine'] = { enabled = false },
    ['tokyonight'] = { enabled = false },
    -- }}}
    -- Editor {{{
    ['dadbod'] = { enabled = false },
    ['flash'] = { enabled = true },
    ['gitsigns'] = { enabled = true },
    ['nvim-surround'] = { enabled = true },
    ['mini.align'] = { enabled = true },
    ['mini.misc'] = { enabled = true },
    ['obsidian'] = { enabled = true },
    ['which-key'] = { enabled = true },
    -- }}}
    -- UI {{{
    ['bufferline'] = { enabled = Settings.tabline == true },
    ['lualine'] = { enabled = Settings.statusline == 'lualine', defaults = false },
    ['mini.icons'] = { enabled = Settings.icons == 'mini-icons' },
    ['render-markdown'] = { enabled = true },
    ['snacks'] = { enabled = true },
    ['smear-cursor'] = { enabled = true },
    ['typr'] = { enabled = false },
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
    -- Typescript
    ['typescript-tools'] = { enabled = false },
    -- }}}
    -- Miscelaneous {{{
    ['vim_be_better'] = { enabled = false },
    -- }}}
  },
}

return Manager
