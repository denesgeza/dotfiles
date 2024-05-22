local Is_enabled = require("core.functions").is_enabled

return {
  "stevearc/conform.nvim",
  enabled = Is_enabled("conform"),
  event = { "BufWritePre" },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  opts = {
    formatters_by_ft = {
      ["*"] = { "trim_whitespace", "trim_newlines" },
      css = { "prettierd" },
      -- lua = { "stylua" },
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
          return { "isort", "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        vim.b.disable_autoformat = not vim.b.disable_auto_format
      else
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      end
      local msg = "Autoformat-on-save " .. (vim.g.disable_autoformat and "disabled" or "enabled")
      local msg_type = vim.g.disable_autoformat and "warn" or "info"
      vim.notify(msg, msg_type)
    end, { desc = "Toggle auto-format", bang = true })
    opts.format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      else
        return { timeout_ms = 500, lsp_fallback = true }
      end
    end
    require("conform").setup(opts)
  end,
  keys = {
    { mode = { "n" }, "<leader>ci", "<cmd>ConformInfo<cr>",  desc = "Conform Info" },
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
