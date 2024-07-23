return {
  "quarto-dev/quarto-nvim",
  enabled = Is_Enabled("quarto"),
  dependencies = {
    {
      "jmbuhr/otter.nvim",
      opts = {
        lsp = {
          hover = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
        },
        buffers = { set_filetype = true },
      },
    },
  },
  opts = {
    lspFeatures = {
      enabled = true,
      languages = { "r", "python", "julia", "bash", "lua", "html" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWrite" },
      },
      codeRunner = {
        enabled = false,
        default_method = "molten", -- 'molten' or 'slime'
        ft_runners = { python = "molten" }, -- filetype to runner, ie. `{ python = "molten" }`.
      },
      completion = {
        enabled = true,
      },
    },
    keymap = {
      hover = "K",
      definition = "gd",
      rename = "<leader>cr",
      references = "gR",
    },
  },
  keys = {
    { mode = { "n" }, "<leader>cp", "<cmd>lua require('quarto').quartoPreview()<cr>", desc = "Quarto Preview" },
    { mode = { "n" }, "<leader>cR", "<cmd>lua require('quarto').quartoRender()<cr>", desc = "Quarto Render" },
  },
}
