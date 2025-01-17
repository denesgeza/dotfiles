Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

return {
  "folke/noice.nvim",
  enabled = Is_Enabled("noice"),
  opts = function()
    if Use_Defaults("noice") then
      return {}
    else
      return {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          progress = { enabled = true }, -- handled by fidget
          signature = {
            enabled = false,
            auto_open = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
        notify = { enabled = true }, --  fidget needs do be activated if false to hanle it
        messages = { enabled = true },
        presets = {
          ---@type boolean
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together if false
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        cmdline = {
          enabled = true,
          view = "cmdline_popup", ---@type "cmdline" | "cmdline_popup"
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
            input = {}, -- Used by input()
          },
        },
        popupmenu = {
          enabled = true,
          backend = "nui", ---@type "nui" | "cmp"
        },
      }
    end
  end,
  keys = {
    { mode = { "n" }, "<leader>ne", "<cmd>NoiceErrors<cr>", desc = "Noice Errors" },
    { mode = { "n" }, "<leader>nh", "<cmd>NoiceHistory<cr>", desc = "Noice History" },
  },
}
