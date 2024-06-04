Is_enabled = require("core.functions").is_enabled

return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        cmd = "CopilotChat",
        opts = function()
            local user = vim.env.USER or "User"
            user = user:sub(1, 1):upper() .. user:sub(2)
            return {
                model = "gpt-4",
                auto_insert_mode = true,
                show_help = true,
                question_header = "  " .. user .. " ",
                answer_header = "  Copilot ",
                window = {
                    width = 0.4,
                },
                selection = function(source)
                    local select = require("CopilotChat.select")
                    return select.visual(source) or select.buffer(source)
                end,
            }
        end,
        keys = {
            {
                "<leader>aa",
                function()
                    return require("CopilotChat").toggle()
                end,
                desc = "Toggle (CopilotChat)",
                mode = { "n", "v" },
            },
            {
                "<leader>ax",
                function()
                    return require("CopilotChat").reset()
                end,
                desc = "Clear (CopilotChat)",
                mode = { "n", "v" },
            },
            {
                "<leader>aq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input)
                    end
                end,
                desc = "Quick Chat (CopilotChat)",
                mode = { "n", "v" },
            },
        },
        init = function()
            vim.schedule(function()
                require("which-key").register({ a = { name = "+CopilotChat (AI)" } }, { prefix = "<leader>" })
            end)
        end,
        config = function(_, opts)
            local chat = require("CopilotChat")
            local ns = vim.api.nvim_create_namespace("copilot-chat-text-hl")

            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "copilot-chat",
                callback = function(ev)
                    vim.opt_local.relativenumber = false
                    vim.opt_local.number = false
                end,
            })

            chat.setup(opts)
        end,
    },

    -- Telescope integration
    {
        "nvim-telescope/telescope.nvim",
        optional = true,
        keys = {
            -- Show help actions with telescope
            {
                "<leader>ad",
                function()
                    local actions = require("CopilotChat.actions")
                    local help = actions.help_actions()
                    if not help then
                        vim.notify("No diagnostics found on the current line", vim.log.levels.WARN)
                        return
                    end
                    require("CopilotChat.integrations.telescope").pick(help)
                end,
                desc = "Diagnostic Help (CopilotChat)",
                mode = { "n", "v" },
            },
            -- Show prompts actions with telescope
            {
                "<leader>ap",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end,
                desc = "Prompt Actions (CopilotChat)",
                mode = { "n", "v" },
            },
        },
    },
}
