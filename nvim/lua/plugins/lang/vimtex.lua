return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "tex", "plaintex", "bib" },
      root = { ".latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml" },
    })
  end,

  -- Add BibTeX/LaTeX to treesitter
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
        opts.highlight.disable = { "latex" }
      end
    end,
  },

  {
    "lervag/vimtex",
    enabled = Is_enabled("vimtex"),
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_indent_enabled = true
      -- vim.g["vimtex_quickfix_mode"] = 0 -- suppress error reporting on save and build
      -- vim.g["vimtex_mappings_enabled"] = 0 -- Ignore mappings
      -- vim.g["tex_flavor"] = "latex" -- how to read tex files
      -- vim.g["tex_indent_items"] = 0 -- turn off enumerate indent
      -- vim.g["tex_indent_brace"] = 0 -- turn off brace indent
      -- -- vim.g["vimtex_context_pdf_viewer"] = "okular" -- external PDF viewer run from vimtex menu command
      vim.g.vimtex_log_ignore = { -- Error suppression:
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
      }
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtex" },
    },
  },

  -- Correctly setup lspconfig for LaTeX 🚀
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      },
    },
  },
}
