-- Imports {{{
Is_Enabled = require("config.functions").is_enabled
Customize = require("config.customize")
-- }}}
-- Conform {{{
-- to formatting on save
if Is_Enabled("conform") then
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      -- FormatDisable! will disable formatting just for this buffer
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
    vim.notify("Autoformat-on-save disabled")
  end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })

  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  end, {
    desc = "Re-enable autoformat-on-save",
  })
end
-- }}}
-- Colorscheme {{{
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = require("plugins.settings.highlights").set_highlights,
})
-- }}}
-- nvim-lint {{{
-- if Is_Enabled("nvim-lint") then
--   vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     callback = function()
--       require("lint").try_lint()
--     end,
--   })
-- end
-- }}}
-- Disable commqent on save {{{
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})
-- }}}
