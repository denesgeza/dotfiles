return {
  {
    "dimaportenko/telescope-simulators.nvim",
    enabled = Is_enabled("telescope-simulators"),
  },
  {
    "terje/simctl.nvim",
    version = "*", -- Use latest release instead of latest commit. Recommended.
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
