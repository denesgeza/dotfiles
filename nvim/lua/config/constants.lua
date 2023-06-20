local Constants = {}

Constants = {
  -- {{{ mason engines
  mason = {
    -- lsp
    "pyright",
    "lua-language-server",
    -- linting
    "ruff",
    "flake8",
    -- formatters
    "prettierd",
    "black",
    "isort",
    "djlint",
    -- dap
    -- "debugpy",
    -- code action
    -- "proselint",
  },
  -- }}}
  -- lspconfig {{{
  lsp = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "icons", -- initial prefix = "●",
      },
      severity_sort = true,
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = { callSnippet = "Replace" },
          },
        },
      },
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectory = { mode = "auto" },
        },
      },
      jsonls = {
        -- lazy-load schemastore when needed
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = { enable = true },
          },
        },
      },
      tsserver = {
        settings = {
          typescript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
          },
          javascript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
    setup = {
      eslint = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function(event)
            local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
            if client then
              local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
              if #diag > 0 then
                vim.cmd("EslintFixAll")
              end
            end
          end,
        })
      end,
      tsserver = function(_, opts)
        require("lazyvim.util").on_attach(function(client, buffer)
          if client.name == "tsserver" then
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = buffer, desc = "Organize Imports" })
          -- stylua: ignore
          vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
          end
        end)
        require("typescript").setup({ server = opts })
        return true
      end,
    },
  },
  -- }}}
  -- {{{ icons
  icons = {
    dap = {
      expanded = "",
      collapsed = "",
      circular = "",
    },
    diagnostic = {
      Error = "",
      Hint = "",
      Info = "",
      Warn = "",
    },
    lsp_kinds = {
      Class = "",
      Color = "",
      Constant = "",
      Constructor = "",
      Enum = "",
      EnumMember = "",
      Event = "",
      Field = "",
      File = "",
      Folder = "",
      Function = "",
      Interface = "",
      Keyword = "",
      Method = "",
      Module = "",
      Operator = "",
      Property = "",
      Reference = "",
      Snippet = " ",
      Struct = "",
      Text = "",
      TypeParameter = "",
      Unit = "",
      Value = "",
      Variable = "",
      buffer = "﬘ ",
      calc = " ",
      nvim_lsp = " ",
      path = " ",
      spell = " ",
      vsnip = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    gitsigns = {
      add = { text = " " },
      change = { text = " " },
      delete = { text = " " },
      topdelete = { text = "契" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    keywords = {
      Youtube = { icon = " ", color = "#ff0000" },
      TODO = { icon = " ", color = "#ff0000" },
      FIXME = { icon = " ", color = "#ff0000" },
      URL = { icon = "", color = "#7711FF", alt = { "Url", "url" } },
    },
    web_devicons = {
      Dockerfile = { icon = "", color = "#b8b5ff", name = "Dockerfile" },
      css = { icon = "", color = "#61afef", name = "css" },
      deb = { icon = "", color = "#a3b8ef", name = "deb" },
      html = { icon = "", color = "#DE8C92", name = "html" },
      jpeg = { icon = " ", color = "#BD77DC", name = "jpeg" },
      jpg = { icon = " ", color = "#BD77DC", name = "jpg" },
      js = { icon = "", color = "#EBCB8B", name = "js" },
      kt = { icon = "󱈙", color = "#ffcb91", name = "kt" },
      lock = { icon = "", color = "#DE6B74", name = "lock" },
      md = { icon = "", color = "#b8b5ff", name = "mp3" },
      mp3 = { icon = "", color = "#C8CCD4", name = "mp3" },
      mp4 = { icon = "", color = "#C8CCD4", name = "mp4" },
      out = { icon = "", color = "#C8CCD4", name = "out" },
      png = { icon = " ", color = "#BD77DC", name = "png" },
      py = { icon = "", color = "#a7c5eb", name = "py" },
      rb = { icon = "", color = "#ff75a0", name = "rb" },
      rpm = { icon = "", color = "#fca2aa", name = "rpm" },
      toml = { icon = "", color = "#61afef", name = "toml" },
      ts = { icon = "ﯤ", color = "#519ABA", name = "ts" },
      vue = { icon = "﵂", color = "#7eca9c", name = "vue" },
      xz = { icon = "", color = "#EBCB8B", name = "xz" },
      yaml = { icon = "", color = "#EBCB8B", name = "xz" },
      zip = { icon = "", color = "#EBCB8B", name = "zip" },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ borders

  display_border = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  },

  -- ----------------------------------------------------------------------- }}}
}

return Constants
