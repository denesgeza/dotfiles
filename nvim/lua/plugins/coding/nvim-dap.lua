Is_Enabled = require("config.functions").is_enabled
return {
  "mfussenegger/nvim-dap",
  enabled = Is_Enabled("nvim-dap"),
  optional = true,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensured_installed = opts.ensured_installed or {}
        table.insert(opts.ensured_installed, "js-debug-adapter")
      end,
    },
  },
  opts = function()
    local dap = require("dap")
    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- 💀 Make sure to update this path to point to your installation
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end
    for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      if not dap.configurations[language] then
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "chrome",
            request = "launch",
            name = "Launch Chrome against localhost",
            url = "http://localhost:8000",
            webRoot = "${workspaceFolder}",
          },
        }
      end
    end
  end,
}
