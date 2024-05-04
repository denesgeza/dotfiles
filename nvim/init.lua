local function safe_require(module)
  local ok, result = pcall(require, module)
  if ok then
    return result
  else
    print("Error loading module: " .. module)
    print(result)
  end
end

safe_require("config.lazy")
-- NeoVide settings {{{
if vim.g.neovide then
  safe_require("plugins.settings.neovide")
end
-- }}}
-- Plugin settings {{{
safe_require("plugins.settings.statusline")
safe_require("plugins.settings.highlights").set_highlights()
safe_require("config.icons")
safe_require("config.icons").setup()
-- }}}
--
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
