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
      preset = "normal",
      style = "full", ---@type "full" | "normal" | "none"
      cell = "padded", ---@type "padded" | "overlay" | "raw" | "trimmed"
    },
    callout = {
      -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'.
      -- The key is for healthcheck and to allow users to change its values, value type below.
      -- | raw        | matched against the raw text of a 'shortcut_link', case insensitive |
      -- | rendered   | replaces the 'raw' value when rendering                             |
      -- | highlight  | highlight for the 'rendered' text and quote markers                 |
      -- | quote_icon | optional override for quote.icon value for individual callout       |
      -- | category   | optional metadata useful for filtering                              |

      note = {
        raw = "[!NOTE]",
        rendered = "󰋽 Note",
        highlight = "RenderMarkdownInfo",
        category = "github",
      },
      tip = {
        raw = "[!TIP]",
        rendered = "󰌶 Tip",
        highlight = "RenderMarkdownSuccess",
        category = "github",
      },
      important = {
        raw = "[!IMPORTANT]",
        rendered = "󰅾 Important",
        highlight = "RenderMarkdownHint",
        category = "github",
      },
      warning = {
        raw = "[!WARNING]",
        rendered = "󰀪 Warning",
        highlight = "RenderMarkdownWarn",
        category = "github",
      },
      caution = {
        raw = "[!CAUTION]",
        rendered = "󰳦 Caution",
        highlight = "RenderMarkdownError",
        category = "github",
      },
      -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
      abstract = {
        raw = "[!ABSTRACT]",
        rendered = "󰨸 Abstract",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      },
      summary = {
        raw = "[!SUMMARY]",
        rendered = "󰨸 Summary",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      },
      tldr = {
        raw = "[!TLDR]",
        rendered = "󰨸 Tldr",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      },
      info = {
        raw = "[!INFO]",
        rendered = "󰋽 Info",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      },
      todo = {
        raw = "[!TODO]",
        rendered = "󰗡 Todo",
        highlight = "RenderMarkdownInfo",
        category = "obsidian",
      },
      hint = {
        raw = "[!HINT]",
        rendered = "󰌶 Hint",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      },
      success = {
        raw = "[!SUCCESS]",
        rendered = "󰄬 Success",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      },
      check = {
        raw = "[!CHECK]",
        rendered = "󰄬 Check",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      },
      done = {
        raw = "[!DONE]",
        rendered = "󰄬 Done",
        highlight = "RenderMarkdownSuccess",
        category = "obsidian",
      },
      question = {
        raw = "[!QUESTION]",
        rendered = "󰘥 Question",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      },
      help = {
        raw = "[!HELP]",
        rendered = "󰘥 Help",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      },
      faq = {
        raw = "[!FAQ]",
        rendered = "󰘥 Faq",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      },
      attention = {
        raw = "[!ATTENTION]",
        rendered = "󰀪 Attention",
        highlight = "RenderMarkdownWarn",
        category = "obsidian",
      },
      failure = {
        raw = "[!FAILURE]",
        rendered = "󰅖 Failure",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      },
      fail = {
        raw = "[!FAIL]",
        rendered = "󰅖 Fail",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      },
      missing = {
        raw = "[!MISSING]",
        rendered = "󰅖 Missing",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      },
      danger = {
        raw = "[!DANGER]",
        rendered = "󱐌 Danger",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      },
      error = {
        raw = "[!ERROR]",
        rendered = "󱐌 Error",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      },
      bug = {
        raw = "[!BUG]",
        rendered = "󰨰 Bug",
        highlight = "RenderMarkdownError",
        category = "obsidian",
      },
      example = {
        raw = "[!EXAMPLE]",
        rendered = "󰉹 Example",
        highlight = "RenderMarkdownHint",
        category = "obsidian",
      },
      quote = {
        raw = "[!QUOTE]",
        rendered = "󱆨 Quote",
        highlight = "RenderMarkdownQuote",
        category = "obsidian",
      },
      cite = {
        raw = "[!CITE]",
        rendered = "󱆨 Cite",
        highlight = "RenderMarkdownQuote",
        category = "obsidian",
      },
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
      position = "inline", ---@type "inline" | "overlay"
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
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "markdownH5", scope_highlight = nil },
        important = { raw = "[!]", rendered = " ", highlight = "markdownH3", scope_highlight = "markdownH3" },
        followup = { raw = "[>]", rendered = " ", highlight = "markdownH6", scope_highlight = "markdownH6" },
        tilde = { raw = "[~]", rendered = "󰰱 ", highlight = "markdownH3", scope_highlight = nil },
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
      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
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
