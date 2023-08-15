-- Display settings {{{

-- Padding from the window edges
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

-- Font
-- vim.o.guifont = "Victor Mono:h13,Victor Mono Italic:h13:i, Symbols Nerd Font:h13"
-- vim.o.guifont = "FiraCode NFM Retina:h12,Victor Mono Italic:h12:i, Symbols Nerd Font:h12"
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12, Symbols Nerd Font:h12"
vim.opt.linespace = 4
vim.g.neovide_scale_factor = 1.05

-- Helper function for adjusting font size
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.25)
end)
-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1117" .. alpha()

-- Add keybinds to change transparency
local change_transparency = function(delta)
  vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end

vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
  change_transparency(0.01)
end)
vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
  change_transparency(-0.01)
end)

-- Floating blur amount TODO: play with these values
vim.g.neovide_floating_blur_amount_x = 1
vim.g.neovide_floating_blur_amount_y = 1

-- Animations
vim.g.neovide_scroll_animation_length = 0.3

-- Mouse
vim.g.neovide_hide_mouse_when_typing = true

-- For font size above 15 (glitchy at the moment)
vim.g.neovide_underline_automatic_scaling = true

--  Background theme (auto, dark, light)
--  auto in day time loads catppuccin latte instead of mocha
vim.g.neovide_theme = "dark"

-- Refresh rate
vim.g.neovide_refresh_rate = 30
vim.g.neovide_refresh_rate_idle = 2

-- Confirm quit
vim.g.neovide_confirm_quit = false

-- Fullscreen
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = true -- remember last window size from previous session

-- Profiler (shows a frametime graph in the upper left corner)
vim.g.neovide_profiler = false

-- MacOs Alt is Meta
vim.g.neovide_input_macos_alt_is_meta = true
-- }}}
-- Cursor settings {{{
vim.g.neovide_cursor_animation_length = 0.23
vim.g.neovide_cursor_trail_size = 0.3
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- Particle modes (none, pixiedust, rain, railgun or "" to disable)
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 7.0
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 1.0
-- }}}
-- Keymaps {{{
vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- }}}
