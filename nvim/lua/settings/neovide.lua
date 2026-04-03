-- Display settings {{{
-- Refresh rate
vim.g.neovide_refresh_rate = 30 ---@type number
vim.g.neovide_refresh_rate_idle = 5 ---@type number

-- Draw a grey border around opaque windows only
vim.g.neovide_show_border = true
vim.g.neovide_corner_preference = 'round' ---@type "round" | "round_small" | "default" | "do_not_round"

-- Padding from the window edges
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_pixel_geometry = 'RGBH'

-- Drag selection
vim.g.neovide_message_area_drag_selection = true
-- }}}
-- Font settings {{{
vim.g.neovide_scale_factor = 1.0

-- Helper function for adjusting font size
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set('n', '<C-=>', function()
  change_scale_factor(1.05)
end)
vim.keymap.set('n', '<C-->', function()
  change_scale_factor(1 / 1.05)
end)
-- }}}
-- Transparency {{{
-- Settings.transparency = false
-- TODO:
if Settings.transparency then
  vim.g.neovide_opacity = 0.8 -- TODO: To check this out
  vim.g.neovide_normal_opacity = 0.8
  vim.g.transparency = 0.8
  -- vim.g.neovide_background_color = "black"
  vim.g.neovide_window_blurred = false
else
  vim.g.neovide_opacity = 1.0
  vim.g.transparency = 1.0
  vim.g.neovide_normal_opacity = 1
end
-- }}}
-- Floating blur {{{
vim.g.neovide_window_floating_opacity = 0.2
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 1.0
-- }}}
-- Floating shadow {{{
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
-- }}}
-- Theme {{{
vim.g.neovide_theme = Settings.neovide.theme
-- }}}
-- Animations {{{
-- Progress bar
vim.g.neovide_progress_bar_enabled = true
vim.g.neovide_progress_bar_height = 5.0
vim.g.neovide_progress_bar_animation_speed = 200.0
vim.g.neovide_progress_bar_hide_delay = 0.2
vim.g.neovide_scroll_animation_length = 0.5

-- Scroll animation far lines
vim.g.neovide_scroll_animation_far_lines = 1

-- Underline automatic scaling
vim.g.neovide_underline_stroke_scale = 3
-- For font size above 15 (glitchy at the moment)
vim.g.neovide_underline_automatic_scaling = false
-- TODO: Not implemented yet
vim.g.underline_offset = 0.2

-- Mouse
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_has_mouse_grid_detection = true

-- Confirm quit
vim.g.neovide_confirm_quit = false ---@type boolean

-- Fullscreen
vim.g.neovide_fullscreen = false ---@type boolean
-- remember last window size from previous session
vim.g.neovide_remember_window_size = true ---@type boolean
-- Profiler (shows a frametime graph in the upper left corner)
vim.g.neovide_profiler = false ---@type boolean

-- MacOs Alt is Meta TODO: Not working yet
vim.g.neovide_input_macos_option_key_is_meta = 'both' ---@type 'both' | 'only_left' | 'only_right' | 'none
vim.g.neovide_input_ime = false
-- }}}
-- Cursor settings {{{
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_animation_length = 0.05 -- default 0.4
vim.g.neovide_cursor_trail_size = 0.05 -- default 0.5
vim.g.neovide_cursor_trail_length = 0.05 -- default 0.5
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- Particle modes
vim.g.neovide_cursor_vfx_mode = Settings.neovide.vfx_mode
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.5
vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2
vim.g.neovide_cursor_vfx_particle_density = 0.7
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 1.0

-- Highlight matching pair
vim.g.neovide_highlight_matching_pair = Settings.neovide.hl_matching_paren
-- }}}
-- Keymaps {{{
vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
vim.keymap.set('v', '<D-c>', '"+y') -- Copy
vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

vim.keymap.set('n', '<X1Mouse>', '<Cmd>NeovideForceClick<CR>', { silent = true })
vim.keymap.set('n', '<leader>k', '<Cmd>NeovideForceClick<CR>', { silent = true })
-- }}}

vim.cmd [[set lsp=15]]

-- vim:tw=120:ts=2:sw=2:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:fen:
