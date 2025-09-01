-- Display settings {{{
-- Draw a grey border around opaque windows only
vim.g.neovide_show_border = true
-- Padding from the window edges
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
-- }}}
-- Font settings {{{
-- vim.o.guifont = "FiraCode NFM,Maple Mono, Symbols Nerd Font:h13"
vim.opt.linespace = 20
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
-- Animations {{{
vim.g.neovide_scroll_animation_length = 0.5

-- Scroll animation far lines
vim.g.neovide_scroll_animation_far_lines = 1

-- Underline automatic scaling
vim.g.neovide_underline_stroke_scale = 3
-- For font size above 15 (glitchy at the moment)
vim.g.neovide_underline_automatic_scaling = true

-- Mouse
vim.g.neovide_hide_mouse_when_typing = true

--  Background theme
-- Issues with the cursor in auto mode
vim.g.neovide_theme = Settings.background

-- Refresh rate
vim.g.neovide_refresh_rate = 30 ---@type number
vim.g.neovide_refresh_rate_idle = 5 ---@type number

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
-- }}}
