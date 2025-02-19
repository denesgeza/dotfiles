local Manager = {
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ["blink"] = { enabled = Settings.completion == "blink" },
    ["blink-copilot"] = { enabled = true },
    ["copilot"] = { enabled = true },
    ["nvim-cmp"] = { enabled = Settings.completion == "nvim-cmp", defaults = false },
    ["conform"] = { enabled = true },
    ["compiler"] = { enabled = false },
    ["codeium"] = { enabled = false },
    ["namu"] = { enabled = true },
    ["nvim-dap"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["molten"] = { enabled = false }, -- Jupyter notebooks
    ["vim-visual-multi"] = { enabled = true },
    ["quarto"] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ["catppuccin"] = { enabled = false },
    ["kanagawa"] = { enabled = true },
    ["rose-pine"] = { enabled = false },
    ["tokyonight"] = { enabled = true },
    ["shadow"] = { enabled = true },
    -- }}}
    -- Editor {{{
    ["dadbod"] = { enabled = false },
    ["diffview"] = { enabled = false },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["neo-tree"] = { enabled = false },
    ["nvim-surround"] = { enabled = true },
    ["mini.align"] = { enabled = false },
    ["which-key"] = { enabled = true },
    ["ts-comments"] = { enabled = false },
    -- }}}
    -- Testing {{{
    ["neotest"] = { enabled = true },
    -- }}}
    -- UI {{{
    ["bufferline"] = { enabled = true },
    ["lualine"] = { enabled = false, defaults = false },
    ["mini.icons"] = { enabled = true },
    ["noice"] = { enabled = false, defaults = false },
    ["snacks"] = { enabled = true },
    ["typr"] = { enabled = false },
    -- }}}
    -- Languages {{{
    ["vimtex"] = { enabled = false },
    ["venv-selector"] = { enabled = false },
    -- }}}
  },
}

return Manager
