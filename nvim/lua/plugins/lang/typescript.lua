if Is_Enabled("typescript") then
  return {
    {
      "pmizio/typescript-tools.nvim",
      enabled = Is_Enabled("typescript-tools"),
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      event = { "BufReadPre", "BufNewFile" },
      ft = { "typescript", "typescriptreact", "javascript" },
      lazy = true,
      opts = {
        complete_function_calls = true,
        code_lens = "all", ---@type "all"|"off"|"implementations_only"|"references_only"
        disable_member_code_lens = false,
        settings = {
          tsserver_file_preferences = {
            quotePreference = "auto",
            includeCompletionsForModuleExports = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            importModuleSpecifierEnding = "auto",
            jsxAttributeCompletionStyle = "auto",
            allowTextChangesInNewFiles = true,
            providePrefixAndSuffixTextForRename = true,
            allowRenameOfImportPath = true,
            includeAutomaticOptionalChainCompletions = true,
            provideRefactorNotApplicableReason = true,
            generateReturnInDocTemplate = true,
            includeCompletionsForImportStatements = true,
            includeCompletionsWithSnippetText = true,
            includeCompletionsWithClassMemberSnippets = true,
            includeCompletionsWithObjectLiteralMethodSnippets = true,
            useLabelDetailsInCompletionEntries = true,
            displayPartsForJSDoc = true,
            disableLineTextInReferences = true,
          },
          tsserver_format_options = {
            allowIncompleteCompletions = false,
          },
          tsserver_plugins = {
            "@styled/typescript-styled-plugin",
          },
        },
      },
    },
    { import = "lazyvim.plugins.extras.lang.typescript" },
  }
else
  return {}
end
