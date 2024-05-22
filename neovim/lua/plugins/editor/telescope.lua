Is_enabled = require("core.functions").is_enabled
Telescope = require("core.settings.telescope")

return {
  "nvim-telescope/telescope.nvim",
  enabled = Is_enabled("telescope"),
  cmd = "Telescope",
  version = false,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = vim.fn.executable("make") == 1 and "make"
          or
          "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  config = function()
    require("telescope").setup({
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
      },
    })
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-e>"] = actions.move_selection_previous,
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,
          },
          n = {
            ["<esc>"] = actions.close,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-e>"] = actions.move_selection_previous,
          },
        },
      },
    })
  end,
  keys = {
    { "<leader>:",       "<cmd>Telescope command_history<cr>",                          desc = "Command History" },
    { "<leader><space>", "<cmd>lua Telescope.find_files()<cr>",                         desc = "Find Files" },
    -- find
    { "<leader>sb",      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    -- { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
    { "<leader>sr",      "<cmd>Telescope oldfiles<cr>",                                 desc = "Recent" },
    -- git
    { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                              desc = "Commits" },
    { "<leader>gs",      "<cmd>Telescope git_status<CR>",                               desc = "Status" },
    { "<leader>gb",      "<cmd>Telescope git_branches<CR>",                             desc = "Branches" },
    { "<leader>ga",      "<cmd>Telescope git_stash<CR>",                                desc = "Stash" },
    -- search
    { '<leader>s"',      "<cmd>Telescope registers<cr>",                                desc = "Registers" },
    { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                             desc = "Auto Commands" },
    { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",                desc = "Fuzzy Buffer" },
    { "<leader>sc",      "<cmd>Telescope command_history<cr>",                          desc = "Command History" },
    { "<leader>sC",      "<cmd>Telescope commands<cr>",                                 desc = "Commands" },
    { "<leader>sd",      "<cmd>Telescope diagnostics bufnr=0<cr>",                      desc = "Document Diagnostics" },
    { "<leader>sD",      "<cmd>Telescope diagnostics<cr>",                              desc = "Workspace Diagnostics" },
    { "<leader>sf",      "<cmd>Telescope find_files<cr>",                               desc = "Find files" },
    { "<leader>sg",      "<cmd>Telescope live_grep<cr>",                                desc = "Live grep" },
    { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                                desc = "Help Pages" },
    { "<leader>sH",      "<cmd>Telescope highlights<cr>",                               desc = "Search Highlight Groups" },
    { "<leader>sj",      "<cmd>Telescope jumplist<cr>",                                 desc = "Jumplist" },
    { "<leader>sl",      "<cmd>Telescope loclist<cr>",                                  desc = "Location list" },
    { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                                  desc = "Key Maps" },
    { "<leader>sn",      "<cmd>lua Telescope.edit_neovim()<cr>",                        desc = "~dotfiles" },
    { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                                desc = "Man Pages" },
    { "<leader>sm",      "<cmd>Telescope marks<cr>",                                    desc = "Jump to Mark" },
    { "<leader>so",      "<cmd>Telescope vim_options<cr>",                              desc = "Options" },
    { "<leader>sq",      "<cmd>Telescope quickfix<cr>",                                 desc = "Quickfix" },
    { "<leader>si",      "<cmd>Telescope buffers<cr>",                                  desc = "Buffers" },
    { "<leader>sR",      "<cmd>Telescope resume<cr>",                                   desc = "Resume" },
    { "<leader>uc",      "<cmd>Telescope colorscheme<cr>",                              desc = "Colorscheme with Preview" },
  },
}
