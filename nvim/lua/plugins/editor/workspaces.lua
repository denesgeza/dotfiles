return {
  "natecraddock/workspaces.nvim",
  enabled = Is_Enabled("workspaces"),
  cmd = { "WorkspacesAdd", "WorkspacesOpen" },
  config = function()
    require("workspaces").setup({
      path = vim.fn.stdpath("data") .. "/workspaces",
      hooks = {
        open = function()
          local workspace_name = require("workspaces").name()
          local workspace_path = require("workspaces").path()
          vim.notify((" Switched to project: %s\n %s"):format(workspace_name, workspace_path), vim.log.levels.INFO, {
            title = "Workspaces",
          })
          local local_nvimrc = vim.fn.getcwd() .. "/.nvimrc"
          if vim.secure.read(local_nvimrc) then
            vim.cmd.source(local_nvimrc)
          end
        end,
      },
    })
  end,
}
