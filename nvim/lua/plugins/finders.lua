Constants = require("config.constants")
Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ Ranger
  {
    "kelly-lin/ranger.nvim",
    enabled = Is_Enabled("ranger"),
    config = function()
      require("ranger-nvim").setup({ replace_netrw = false })
      -- vim.api.nvim_set_keymap("n", "<leader>ef", "", {
      --   noremap = true,
      --   callback = function()
      --     require("ranger-nvim").open(true)
      --   end,
      -- })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Hop
  {
    "phaazon/hop.nvim",
    enabled = Is_Enabled("hop"),
    name = "hop",
    branch = "v2",
    config = function()
      require("hop").setup({
        keys = "asdfjkluiopnm",
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Telescope
  {
    "nvim-telescope/telescope.nvim",
    enabled = Is_Enabled("telescope.nvim"),
    cmd = "Telescope",
    keys = false,
    opts = {
      defaults = {
        layout_config = { prompt_position = "bottom" },
        layout_strategy = "horizontal",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "descending",
        winblend = 0,
      },
      pickers = {
        colorscheme = { enable_preview = true },
      },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Telescope fzf native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = Is_Enabled("telescope-fzf-native.nvim"),
    cmd = "Telescope",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ todo-comments.nvim
  --
  --     Unicodes:
  --       Youtube -> F167
  --       Cloud -> F0C2

  {
    "folke/todo-comments.nvim",
    enabled = Is_Enabled("todo-comments.nvim"),
    opts = function(_, opts)
      opts.merge_keywords = true
      opts.keywords = Constants.icons.keywords
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
