local Manager = {
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ["blink"] = { enabled = Settings.completion == "blink" },
    ["blink-copilot"] = { enabled = false },
    ["copilot"] = { enabled = true },
    ["nvim-cmp"] = { enabled = Settings.completion == "nvim-cmp", defaults = false },
    ["conform"] = { enabled = true },
    ["compiler"] = { enabled = false },
    ["codeium"] = { enabled = false },
    ["namu"] = { enabled = false },
    ["nvim-dap"] = { enabled = false },
    ["nvim-lint"] = { enabled = false },
    ["molten"] = { enabled = false }, -- Jupyter notebooks
    ["vim-visual-multi"] = { enabled = true },
    ["quarto"] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ["catppuccin"] = { enabled = true },
    ["kanagawa"] = { enabled = true },
    ["nightfly"] = { enabled = false },
    ["moonfly"] = { enabled = false },
    ["rose-pine"] = { enabled = true },
    ["shadow"] = { enabled = false },
    ["tokyonight"] = { enabled = false },
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
    ["venv-selector"] = { enabled = false },
    -- }}}
  },
}

return Manager
