return {
  "sainnhe/gruvbox-material",
  enabled = Is_Enabled("gruvbox"),
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = 1 ---@type 0 | 1
    vim.g.gruvbox_material_background = "hard" ---@type 'soft' | 'medium' | 'hard'
    vim.g.gruvbox_material_foreground = "mix" ---@type 'material' | 'mix' | 'original'
    vim.g.gruvbox_material_disable_italic_comment = 0 ---@type 0 | 1
    vim.g.gruvbox_material_enable_bold = 1 ---@type 0 | 1
    vim.g.gruvbox_material_transparent_background = Settings.transparency and 2 or 0
    vim.g.gruvbox_material_dim_inactive_windows = 0
    vim.g.gruvbox_material_visual = "grey background" ---@type 'grey background' | 'green background' | 'blue background' | 'reverse' | 'red background'
    vim.g.gruvbox_material_menu_selection_background = "grey" ---@type 'grey'|'red'| 'orange'|'yellow'|'green' |'aqua'|'blue'|'purple'
    vim.g.gruvbox_material_sign_column_background = "none" ---@type 'none' | 'grey'
    vim.g.gruvbox_material_ui_contrast = "high" ---@type 'low' | 'high'
    vim.g.gruvbox_material_float_style = "dim" ---@type 'bright' | 'dim'
    vim.g.gruvbox_material_diagnostic_text_highlight = 0 ---@type 0 | 1
    vim.g.gruvbox_material_diagnostic_line_highlight = 1 ---@type 0 | 1
    vim.g.gruvbox_material_diagnostic_virtual_text = "grey" ---@type 'colored' | 'grey' | 'highlighted'
    vim.g.gruvbox_material_current_word = "underline" ---@type 'grey background' | 'underline' | 'high contrast background' | 'bold' | 'italic'
    vim.g.gruvbox_material_inlay_hints_background = "dimmed" ---@type 'none' | 'dimmed'
    vim.g.gruvbox_material_statusline_style = "default" ---@type 'default' | 'mix' | 'original'
    vim.g.gruvbox_material_better_performance = 1
  end,
}
