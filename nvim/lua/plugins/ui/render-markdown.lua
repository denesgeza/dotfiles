return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    completions = { blink = { enabled = true } },
    -- render_modes = true,
    code = {
      enabled = true,
      sign = "language",
      width = "block",
      right_pad = 4,
    },
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      -- Determines how icons fill the available space:
      --  inline:  underlying text is concealed resulting in a left aligned icon
      --  overlay: result is left padded with spaces to hide any additional text
      position = "inline",
      unchecked = {
        -- Replaces '[ ]' of 'task_list_marker_unchecked'
        icon = "   󰄱 ",
        -- Highlight for the unchecked icon
        highlight = "RenderMarkdownUnchecked",
        -- Highlight for item associated with unchecked checkbox
        scope_highlight = nil,
      },
      checked = {
        -- Replaces '[x]' of 'task_list_marker_checked'
        icon = "   󰱒 ",
        -- Highlight for the checked icon
        highlight = "RenderMarkdownChecked",
        -- Highlight for item associated with checked checkbox
        scope_highlight = nil,
      },
    },
    html = {
      -- Turn on / off all HTML rendering
      enabled = true,
      comment = {
        -- Turn on / off HTML comment concealing
        conceal = false,
      },
    },
    heading = {
      sign = false,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      backgrounds = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        -- "Headline4Bg",
        -- "Headline5Bg",
        -- "Headline6Bg",
      },
      -- foregrounds = {
      --   "CursorLine",
      --   "CurSearch",
      --   "Visual",
      --   "Headline4Fg",
      --   "Headline5Fg",
      --   "Headline6Fg",
      -- },
    },
  },
  ft = { "markdown", "norg", "rmd", "org", "codecompanion", "md", "copilot-chat" },
  config = function(_, opts)
    require("render-markdown").setup(opts)
    Snacks.toggle({
      name = "Render Markdown",
      get = function()
        return require("render-markdown.state").enabled
      end,
      set = function(enabled)
        local m = require("render-markdown")
        if enabled then
          m.enable()
        else
          m.disable()
        end
      end,
    }):map("<leader>um")
  end,
}
