-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "kanagawa",
  callback = function()
    if vim.o.background == "light" then
      vim.fn.system("kitty +kitten themes Kanagawa_light")
    elseif vim.o.background == "dark" then
      vim.fn.system("kitty +kitten themes Kanagawa_dragon")
    else
      vim.fn.system("kitty +kitten themes Kanagawa")
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "catppuccin",
  callback = function()
    if vim.o.background == "dark" then
      vim.fn.system("kitty +kitten themes --reload-in=all <Catppuccin-Mocha>")
    elseif vim.o.background == "light" then
      vim.fn.system("kitty +kitten themes --reload-in=all <Catppuccin-Latte>")
    else
      vim.fn.system("kitty +kitten themes Catppuccin")
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "MyPMenuSel", { bg = "#aaafff", fg = "#000000", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "MyPMenu", { bg = "none", blend = 0 })
    -- vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "Comment" })
  end,
})
