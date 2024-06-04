Is_enabled = require("core.functions").is_enabled
return {
    "iamcco/markdown-preview.nvim",
    enabled = Is_enabled("markdown-preview"),
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
}
