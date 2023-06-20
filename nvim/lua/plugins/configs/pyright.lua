
require("lspconfig").pyright.setup({
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      },
    },
  },
  single_file_support = true,
})
