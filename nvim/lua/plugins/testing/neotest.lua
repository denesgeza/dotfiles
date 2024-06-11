return {
  "nvim-neotest/neotest",
  enabled = Is_Enabled("neotest"),
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "antoinemadec/FixCursorHold.nvim",
  --   "nvim-treesitter/nvim-treesitter",
  --   "nvim-neotest/neotest-python",
  --   "folke/neodev.nvim",
  -- },
  -- config = function()
  --   require("neotest").setup({
  --     adapters = {
  --       require("neotest-python")({
  --         -- dap = { justMyCode = false },
  --         runner = "pytest",
  --         args = { "--log-level", "DEBUG", "--color", "yes", "-vv", "-s" },
  --         python = "venv/bin/python",
  --         pytest_discover_instances = true,
  --       }),
  --     },
  --   })
  -- end,
  keys = {
    -- {
    --   mode = { "n" },
    --   "<leader>tr",
    --   function()
    --     require("neotest").run.run()
    --   end,
    --   desc = "Tests | Run all tests",
    -- },
    -- {
    --   mode = { "n" },
    --   "<leader>tc",
    --   function()
    --     require("neotest").run.run(vim.fn.expand("%"))
    --   end,
    --   desc = "Tests | Run current file",
    -- },
    {
      mode = { "n" },
      "<leader>tp",
      "<cmd>lua require('neotest').output_panel.toggle()<cr>",
      desc = "Tests | Panel",
    },
    { mode = { "n" }, "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Tests | Summary" },
  },
}
