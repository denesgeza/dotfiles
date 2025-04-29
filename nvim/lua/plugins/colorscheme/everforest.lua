return {
  "sainnhe/everforest",
  enabled = Is_Enabled("everforest"),
  name = "everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_current_word = "underline" ---@type 'grey background' | 'underline' | 'high contrast background' | 'bold' | 'italic'
    vim.g.everforest_diagnostic_text_highlight = 0
    vim.g.everforest_float_style = "dim" ---@type 'bright' | 'dim'
    vim.g.everforest_ui_contrast = "high" ---@type 'low' | 'high'
    vim.g.everforest_dim_inactive_windows = 0
    vim.g.everforest_transparent_background = Settings.transparency and 2 or 0
    vim.g.everforest_cursor = "auto" ---@type 'auto' | 'red' | 'green' | 'blue' | 'yellow' | 'purple' | 'orange'
    vim.g.everforest_disable_italic_comment = 0 ---@type 0 | 1
    vim.g.everforest_enable_italic = 1 ---@type 0 | 1
    vim.g.everforest_background = "hard" ---@type 'soft' | 'medium' | 'hard'
    vim.g.everforest_better_performance = 1
  end,
}
