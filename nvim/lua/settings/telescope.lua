local M = {}

M.file_browser = function()
  require("telescope").extensions.file_browser.file_browser({
    prompt_title = " File Browser",
    hidden = true,
    path_display = { "smart" },
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.5, width = 0.75 },
  })
end

M.commands = function()
  require("telescope.builtin").commands({
    prompt_title = "Commands",
    layout_strategy = "horizontal",
    -- layout_config = { preview_width = 0.5, width = 0.75 },
  })
end

M.edit_neovim = function()
  require("telescope.builtin").git_files({
    -- shorten_path = true,
    prompt_title = "~ dotfiles ~",
    path_display = { "smart" },
    cwd = "~/.config/nvim",
    height = 10,

    layout_strategy = "horizontal",
    layout_options = {
      preview_width = 0.75,
    },
  })
end

M.find_files = function()
  local opts = {
    results_title = "Results",
    path_display = { "smart" },
    layout_strategy = "vertical",
    previewer = false,
    layout_config = {
      -- preview_width = 0.5,
      width = 0.5,
      height = 0.5,
    },
    file_ignore_patterns = {
      "venv/",
      "node_modules/",
      "vendor/",
    },
  } -- define here if you want to define something
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    opts.prompt_title = " Git Files"
    opts.prompt_prefix = "  "
    opts.results_title = " Repo Files"
    require("telescope.builtin").git_files(opts)
  else
    opts.prompt_title = " Find Files"
    require("telescope.builtin").find_files(opts)
  end
end

return M
