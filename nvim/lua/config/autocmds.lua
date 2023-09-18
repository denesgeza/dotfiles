-- Imports {{{
Is_Enabled = require("config.functions").is_enabled
Customize = require("config.customize")
-- }}}
-- Conform {{{
-- to formatting on save
if Is_Enabled("conform") then
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   pattern = "*",
  --   callback = function(args)
  --     require("conform").format({ bufnr = args.buf })
  --   end,
  -- })

  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      -- FormatDisable! will disable formatting just for this buffer
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
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
-- Emmet language server {{{
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = "astro,css,eruby,html,htmldjango,javascriptreact,less,pug,sass,scss,svelte,typescriptreact,vue",
--   callback = function()
--     vim.lsp.start({
--       cmd = { "emmet-language-server", "--stdio" },
--       root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
--       init_options = {
--         --- @type table<string, any> https://docs.emmet.io/customization/preferences/
--         preferences = {},
--         --- @type "always" | "never" defaults to `"always"`
--         showexpandedabbreviation = "always",
--         --- @type boolean defaults to `true`
--         showabbreviationsuggestions = true,
--         --- @type boolean defaults to `false`
--         showsuggestionsassnippets = false,
--         --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
--         syntaxprofiles = {},
--         --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
--         variables = {},
--         --- @type string[]
--         excludelanguages = {},
--       },
--     })
--   end,
-- })
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
      { "Warn",  "W" },
      { "Hint",  "H" },
      { "Info",  "I" },
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
