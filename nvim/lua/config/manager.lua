local Manager = {
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ["blink"] = { enabled = Settings.completion == "blink" },
    ["blink-copilot"] = { enabled = false },
    ["nvim-cmp"] = { enabled = Settings.completion == "nvim-cmp", defaults = false },
    ["conform"] = { enabled = true },
    ["compiler"] = { enabled = false },
    ["nvim-dap"] = { enabled = false },
    ["nvim-lint"] = { enabled = false },
    ["molten"] = { enabled = false }, -- Jupyter notebooks
    ["vim-visual-multi"] = { enabled = true },
    ["quarto"] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ["catppuccin"] = { enabled = false },
    ["everforest"] = { enabled = true },
    ["gruvbox"] = { enabled = false },
    ["kanagawa"] = { enabled = false },
    ["rose-pine"] = { enabled = false },
    ["tokyonight"] = { enabled = false },
    -- }}}
    -- Editor {{{
    ["dadbod"] = { enabled = false },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["neorg"] = { enabled = false },
    ["neo-tree"] = { enabled = false },
    ["nvim-surround"] = { enabled = true },
    ["mini.align"] = { enabled = true },
    ["mini.misc"] = { enabled = true },
    ["obsidian"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["ts-comments"] = { enabled = false },
    -- }}}
    -- Testing {{{
    ["neotest"] = { enabled = false },
    -- }}}
    -- UI {{{
    ["bufferline"] = { enabled = Settings.tabline == true },
    ["lualine"] = { enabled = Settings.statusline == "lualine", defaults = false },
    ["mini.icons"] = { enabled = Settings.icons == "mini-icons" },
    ["noice"] = { enabled = false, defaults = false },
    ["snacks"] = { enabled = true },
    ["smear-cursor"] = { enabled = true },
    ["typr"] = { enabled = false },
    -- }}}
    -- Languages {{{
    ["python"] = { enabled = true },
    ["latex"] = { enabled = false },
    ["typescript"] = { enabled = true },
    ["typst"] = { enabled = true },
    -- }}}
    -- Language tools {{{
    -- Python
    ["venv-selector"] = { enabled = false },
    ["uv"] = { enabled = true },
    -- Typescript
    ["typescript-tools"] = { enabled = false },
    -- }}}
    -- Miscelaneous {{{
    ["vim_be_better"] = { enabled = true },
    -- }}}
  },
}

return Manager
