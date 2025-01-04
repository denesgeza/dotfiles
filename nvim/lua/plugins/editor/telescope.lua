Manager = require("config.manager")
Telescope = require("settings.telescope")

return {
  "nvim-telescope/telescope.nvim",
  enabled = Manager.explorer == "telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "^venv/",
        "/venv/",
        "^vendor/",
        "/vendor/",
      },
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-s>"] = require("telescope.actions").cycle_previewers_next,
          ["<C-a>"] = require("telescope.actions").cycle_previewers_prev,
        },
        n = {
          ["<esc>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
      },
    },
  },
  keys = {
    { "<leader><space>", false },
    { "<leader>fb", false },
    { "<leader>fc", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fg", false },
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>fp", false },
    { "<leader>st", false },
    {
      mode = { "n" },
      "<leader>sb",
      "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>",
      desc = "Buffer",
    },
    { "<leader>sf", "<cmd>Telescope find_files sort_mru=true sort_lastused=true<cr>", desc = "Find files" },
    { "<leader>si", "<cmd>lua Telescope.buffers()<cr>", desc = "Open Buffers" },
    { "<leader>se", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
    { "<leader>sp", "<cmd>lua Telescope.edit_neovim()<cr>", desc = "Dot Files" },
    { "<leader><space>", "<cmd>lua Telescope.find_files()<cr>", desc = "Find Files" },
  },
}
