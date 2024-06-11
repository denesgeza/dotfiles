Is_Enabled = require("config.functions").is_enabled

return {
  "stevearc/conform.nvim",
  enabled = Is_Enabled("conform"),
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      ["*"] = { "trim_whitespace", "trim_newlines" },
      css = { "prettierd" },
      lua = { "stylua" },
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      htmldjango = { { "prettierd", "prettier" } },
      json = { "jq" },
      markdown = { { "prettierd", "prettier" }, "markdownlint", "markdown-toc" },
      sh = { "shfmt" },
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
  },
  keys = {
    { mode = { "n" }, "<leader>ci", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
    {
      mode = { "n", "v" },
      "<leader>cf",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      desc = "Format",
    },
    { mode = { "n" }, "<leader>uf", "<cmd>FormatToggle<cr>", desc = "Toggle autoformat-on-save" },
  },
}
