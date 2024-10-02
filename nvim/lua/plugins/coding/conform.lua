Is_Enabled = require("config.functions").is_enabled

return {
  "stevearc/conform.nvim",
  enabled = Is_Enabled("conform"),
  opts = {
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
    -- Conform will notify you when no formatters are available for the buffer
    notify_no_formatters = true,
    lsp_format = "last", ---@type "first" | "last" | "fallback" | "never"
    stop_after_first = false,
    formatters_by_ft = {
      ["*"] = { "trim_whitespace", "trim_newlines" },
      css = { "prettierd" },
      lua = { "stylua" },
      -- Use a sub-list to run only the first available formatter
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      html = { "prettierd" },
      htmldjango = { "prettierd" },
      json = { "jq" },
      markdown = { "prettierd", "markdownlint" },
      sh = { "shfmt" },
      sql = { "sqlfmt" },
      yaml = { "yamlfmt" },
      zsh = { "beautysh" },
      rust = { "rustfmt" },
      toml = { "taplo" },
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_organize_imports", "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
    },
    formatters = {
      sqlfmt = {
        append_args = { "-d", "clickhouse" },
      },
    },
  },
  keys = {
    { mode = { "n" }, "<leader>ci", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
    {
      mode = { "n", "v" },
      "<leader>cf",
      function()
        require("conform").format({
          lsp_format = "fallback",
          async = false,
          quiet = false,
          timeout_ms = 1000,
        })
      end,
      desc = "Format",
    },
    { mode = { "n" }, "<leader>uf", "<cmd>FormatToggle<cr>", desc = "Toggle autoformat-on-save" },
  },
}
