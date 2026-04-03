return {
  'folke/sidekick.nvim',
  opts = {
    -- add any options here
    cli = {
      mux = {
        backend = 'zellij',
        enabled = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    {
      "<C-;>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<C-;>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<leader>ae",
      function() require("sidekick.cli").toggle() end,
      desc = "CLI: Toggle/Select",
    },
    {
      "<leader>a.",
      function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end,
      desc = "CLI: Toggle Copilot",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "CLI: Select",
    },
    {
      "<leader>at",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "CLI: Send This",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "CLI: Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "CLI: Select Prompt",
    },
    {
      "<c-.>",
      function() require("sidekick.cli").focus() end,
      mode = { "n", "x", "i", "t" },
      desc = "CLI: Switch Focus",
    },
    -- Example of a keybinding to open Claude directly
    -- {
    --   "<leader>ac",
    --   function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
    --   desc = "Sidekick Toggle Claude",
    -- },
  },
}
