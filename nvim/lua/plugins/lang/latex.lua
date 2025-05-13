if Is_Enabled("latex") then
  return {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.highlight = opts.highlight or {}
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "bibtex" })
        end
        if type(opts.highlight.disable) == "table" then
          vim.list_extend(opts.highlight.disable, { "latex" })
        else
          -- opts.highlight.disable = { "latex" }
        end
      end,
    },
    {
      "saghen/blink.cmp",
      dependencies = { "erooke/blink-cmp-latex" },
      opts = {
        sources = {
          default = { "latex" },
          providers = {
            latex = {
              name = "Latex",
              module = "blink-cmp-latex",
              score_offset = 1000,
              opts = {
                -- set to true to insert the latex command instead of the symbol
                insert_command = false,
              },
            },
          },
        },
      },
    },
    { import = "lazyvim.plugins.extras.lang.tex" },
  }
else
  return {}
end
