return {
  "LazyVim/LazyVim",
  version = "*",
  -- version = "v13.9.1",
  opts = {
    defaults = {
      autocmds = true, -- lazyvim.config.autocmds
      keymaps = true, -- lazyvim.config.keymaps
      -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
      -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
    },
    colorscheme = Settings.colorscheme,
    news = {
      lazyvim = true,
      neovim = false,
    },
    icons = {
      diagnostics = {
        Error = "E",
        Warn = "W",
        Info = "I",
        Hint = "H",
      },
    },
  },
  keys = {
    { "<leader>ol", "<cmd>Lazy<cr>", { desc = "Lazy" } },
    { "<leader>ox", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" } },
  },
}
