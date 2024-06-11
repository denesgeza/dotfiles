return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "htmldjango",
        "javascript",
        "json",
        "ninja",
        "python",
        "rst",
        "rust",
        "sql",
        "toml",
        "typescript",
        "regex",
        "lua",
        "markdown",
        "norg",
        "norg_meta",
        "vim",
      })
    end
    opts.auto_install = true
    opts.highlight = { enable = true }
    opts.indent = { enable = true }
    opts.disable = function(_, buf)
      local max_filesize = 100 * 1024
      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats ~= nil and stats.size > max_filesize then return true end
    end
    opts.additional_vim_regex_highlighting = true
    vim.treesitter.language.register("htmldjango", "html")
  end,
}
