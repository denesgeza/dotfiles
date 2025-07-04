return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = Is_Enabled("render-markdown"),
  opts = {
    latex = { enabled = false },
    -- if setting blink, somehow breaks blink config
    completions = { lsp = { enabled = true } }, -- lsp, nvim-cmp, blink
    -- render_modes = true,
    code = {
      enabled = true,
      sign = true,
      width = "block",
      right_pad = 4,
    },
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
      render_modes = true,
      icons = { "●", "○", "◆", "◇" },
      left_pad = 0,
      -- Padding to add to the right of bullet point.
      -- Output is evaluated using the same logic as 'left_pad'.
      right_pad = 0,
      -- Highlight for the bullet icon.
      -- Output is evaluated using the same logic as 'icons'.
      highlight = "RenderMarkdownBullet",
      -- Highlight for item associated with the bullet point.
      -- Output is evaluated using the same logic as 'icons'.
      scope_highlight = {},
    },
    pipe_table = {
      enabled = true,
      preset = "heavy",
      style = "full", ---@type "full" | "normal" | "none"
      cell = "padded", ---@type "padded" | "overlay" | "raw" | "trimmed"
    },
    quote = {
      -- Turn on / off block quote & callout rendering.
      enabled = true,
      -- Additional modes to render quotes.
      render_modes = false,
      -- Replaces '>' of 'block_quote'.
      icon = "▋",
      -- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text
      -- if incorrectly configured with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'.
      -- A combination of these that is likely to work follows.
      -- | showbreak      | '  ' (2 spaces)   |
      -- | breakindent    | true              |
      -- | breakindentopt | '' (empty string) |
      -- These are not validated by this plugin. If you want to avoid adding these to your main
      -- configuration then set them in win_options for this plugin.
      repeat_linebreak = false,
      -- Highlight for the quote icon.
      -- If a list is provided output is evaluated by `cycle(value, level)`.
      highlight = {
        "RenderMarkdownQuote1",
        "RenderMarkdownQuote2",
        "RenderMarkdownQuote3",
        "RenderMarkdownQuote4",
        "RenderMarkdownQuote5",
        "RenderMarkdownQuote6",
      },
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      -- Determines how icons fill the available space:
      --  inline:  underlying text is concealed resulting in a left aligned icon
      --  overlay: result is left padded with spaces to hide any additional text
      position = "overlay", ---@type "inline" | "overlay"
      unchecked = {
        -- Replaces '[ ]' of 'task_list_marker_unchecked'
        icon = "󰄱 ",
        -- Highlight for the unchecked icon
        highlight = "RenderMarkdownUnchecked",
        -- Highlight for item associated with unchecked checkbox
        scope_highlight = nil,
      },
      checked = {
        -- Replaces '[x]' of 'task_list_marker_checked'
        -- icon = "   󰱒 ",
        icon = " ",
        -- Highlight for the checked icon
        highlight = "RenderMarkdownChecked",
        -- Highlight for item associated with checked checkbox
        scope_highlight = nil,
      },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "markdownH5", scope_highlight = "markdownH5" },
        important = { raw = "[!]", rendered = " ", highlight = "error", scope_highlight = "Error" },
        followup = { raw = "[>]", rendered = " ", highlight = "markdownH6", scope_highlight = "markdownH6" },
        tilde = { raw = "[~]", rendered = "󰰱 ", highlight = "markdownH3", scope_highlight = "markdownH3" },
      },
    },
    html = {
      -- Turn on / off all HTML rendering
      enabled = true,
      comment = {
        -- Turn on / off HTML comment concealing
        conceal = true,
      },
    },
    heading = {
      render_modes = true,
      sign = true,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      position = "inline",
      foregrounds = {
        "markdownH1",
        "markdownH2",
        "markdownH3",
        "markdownH4",
        "markdownH5",
        "markdownH6",
      },
    },
  },
  ft = {
    "markdown",
    "norg",
    "rmd",
    "org",
    "codecompanion",
    "md",
    "copilot-chat",
    "typst",
  },
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
