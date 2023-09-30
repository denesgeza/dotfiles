-- Imports {{{
Is_Enabled = require("config.functions").is_enabled
Customize = require("config.customize")
-- }}}
-- Conform {{{
-- to formatting on save
if Is_Enabled("conform") then
  require("conform").setup({
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_fallback = true }
    end,
  })

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
  callback = function()
    vim.api.nvim_set_hl(0, "MyPMenuSel", { bg = "#aaafff", fg = "#000000", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "MyPMenu", { bg = "none", blend = 0 })
  end,
})
-- }}}
-- nvim-lint {{{
if Is_Enabled("nvim-lint") then
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end
-- }}}
-- Statusline {{{
-- BUG: Not working yet
if Customize.statusline == "default" then
  local group = vim.api.nvim_create_augroup("StatusLine", { clear = true })

  local function diagnostics_section()
    local results = {}
    local diagnostics_attrs = {
      { "Error", "E" },
      { "Warn", "W" },
      { "Hint", "H" },
      { "Info", "I" },
    }

    for _, attr in pairs(diagnostics_attrs) do
      local n = vim.diagnostic.get(0, { severity = attr[1] })
      if #n > 0 then
        table.insert(results, string.format(" %d %s", #n, attr[2]))
      end
    end

    return table.concat(results)
  end

  vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufWinEnter" }, {
    group = group,
    callback = function()
      vim.b.diagnostics = diagnostics_section()
    end,
  })
end
-- }}}
