return {
  "obsidian-nvim/obsidian.nvim",
  enabled = Is_Enabled("obsidian"),
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
      },
      {
        name = "work",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Work",
      },
    },
    daily_notes = {
      folder = "notes/daily",
      date_format = "%Y-%m-%d",
      template = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal/notes/templates/note.md",
      default_tags = { "dailies" },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
    picker = {
      name = "snacks.pick", ---@type "telescope.nvim" | "fzf-lua" | "mini.pick" | "snacks.pick"
    },
    notes_subdir = "notes/inbox",
    new_notes_location = "notes_subdir",
    disable_frontmatter = true,
    templates = {
      subdir = "notes/templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    ui = {
      enable = false,
      update_debounce = 200, -- update delay after a text change (in milliseconds)
      max_file_length = 5000, -- disable UI features for files with more than this many lines
      -- Define how various check-boxes are displayed
      -- checkboxes = {
      --   -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      --   [" "] = { char = "󰄱 ", hl_group = "ObsidianTodo" },
      --   ["x"] = { char = " ", hl_group = "ObsidianDone" },
      --   [">"] = { char = " ", hl_group = "ObsidianRightArrow" },
      --   ["~"] = { char = "󰰱 ", hl_group = "ObsidianTilde" },
      --   ["!"] = { char = " ", hl_group = "ObsidianImportant" },
      --   -- Replace the above with this if you don't have a patched font:
      --   -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      --   -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      --   -- You can also add more custom ones...
      -- },
      -- Use bullet marks for non-checkbox lists.
      bullets = { char = "• ", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "open", url }) -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
      -- vim.ui.open(url) -- need Neovim 0.10.0+
    end,
    statusline = {
      enabled = true,
      format = "  {{properties}} props {{backlinks}} blinks {{words}} words {{chars}} chars",
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
        desc = "Toggle checkbox",
      },
      -- Smart action depending on context: follow link, show notes with tag, or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
  },
  keys = {
    { "<leader>oa", "<cmd>ObsidianDailies<cr>", desc = "Dailies" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Tags" },
    { "<leader>op", "<cmd>ObsidianTOC<cr>", desc = "TOC" },
    { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Switch Workspace" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search" },
    { "<leader>oT", "<cmd>ObsidianToday<cr>", desc = "Today" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Switch" },
    -- Create a new note in the vault
    { "<leader>on", "<cmd>Obsidian new_from_template<cr>", desc = "New note" },
    -- convert note to template and remove leading white space
    {
      "<leader>oh",
      ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
      desc = "Add header to note",
    },
    -- strip date from note title and replace dashes with spaces
    -- must have cursor on title
    { "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>", desc = "Format title" },
    -- for review workflow
    -- KEEP: move file from  inbox to processed folder
    {
      "<leader>ok",
      ":!mv '%:p' /Users/geza/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Personal/notes/processed<cr>:bd<cr>",
      desc = "Process inbox",
    },
    -- delete file in current buffer
    { "<leader>odd", ":!rm '%:p'<cr>:bd<cr>", desc = "Delete file in current buffer" },
    -- DELETE: delete file in current buffer and all links to it
    {
      "<leader>og",
      function()
        Snacks.picker.files({ cwd = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/" })
      end,
      desc = "Find notes",
    },
  },
}
