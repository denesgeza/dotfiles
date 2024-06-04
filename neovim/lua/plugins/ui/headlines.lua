Is_enabled = require("core.functions").is_enabled
return {
    "lukas-reineke/headlines.nvim",
    enabled = Is_enabled("headlines"),
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
}
