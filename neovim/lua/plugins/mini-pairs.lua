return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  enabled = Is_enabled("mini-pairs"),
  opts = {
    mappings = {
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\`].", register = { cr = false } },
    },
  },
  keys = {
    {
      "<leader>up",
      function()
        vim.g.minipairs_disable = not vim.g.minipairs_disable
        if vim.g.minipairs_disable then
          vim.notify("Disabled auto pairs", "warn")
        else
          vim.notify("Enabled auto pairs", "info")
        end
      end,
      desc = "Toggle Auto Pairs",
    },
  },
}
