local Is_enabled = require("core.functions").is_enabled

-- V3
-- return {
--   "folke/trouble.nvim",
--   enabled = Is_enabled("trouble"),
--   -- branch = "dev",
--   keys = {
--     { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
--     { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
--     { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
--     {
--       "<leader>cS",
--       "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--       desc = "LSP references/definitions/... (Trouble)",
--     },
--     { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
--     { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
--     {
--       "[q",
--       function()
--         if require("trouble").is_open() then
--           require("trouble").prev({ skip_groups = true, jump = true })
--         else
--           local ok, err = pcall(vim.cmd.cprev)
--           if not ok then
--             vim.notify(err, vim.log.levels.ERROR)
--           end
--         end
--       end,
--       desc = "Previous Trouble/Quickfix Item",
--     },
--   },
-- }
-- V2
return {
  "folke/trouble.nvim",
  enabled = Is_enabled("trouble"),
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  },
}
