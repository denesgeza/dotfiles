return {
  "JuanBaut/statuscolumn.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = Is_enabled("statuscolumn"),
  lazy = false,
  config = function()
    require("statuscolumn").setup({
      gradient_hl = "Special",
    })
  end,
}
