--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5

vim.diagnostic.config({ virtual_text = false })
-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = { "*.lua", "*.py", "*.js" },
	timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Telescope
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.git_files.previewer = nil
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
lvim.builtin.telescope.defaults.path_display = nil
lvim.builtin.telescope.defaults.selection_strategy = "reset"
lvim.builtin.telescope.pickers = {
	find_files = {
		layout_config = {
			width = 0.95,
			height = 0.6,
		},
	},
	git_files = {
		layout_config = {
			width = 0.95,
			height = 0.95,
		},
	},
	grep_string = {
		layout_config = {
			width = 0.95,
			height = 0.95,
		},
	},
	live_grep = {
		layout_config = {
			width = 0.95,
		},
	},
}

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- generic LSP settings <https://www.lunarvim.org/docs/configuration/language-features/language-servers>

--- disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = true

---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {}
-- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)

-- Another try for the django html files
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "html" })
local opts = {
	filetypes = { "html", "htmldjango" },
}
require("lvim.lsp.manager").setup("html", opts)

---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
---`:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- Django, html
local opts_tailwind = {
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname) or require("lspconfig").util.path.dirname(fname)
	end,
	filetypes = { "html", "htmldjango", "djangohtml" },
}
require("lvim.lsp.manager").setup("tailwindcss", opts_tailwind)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- linters, formatters and code actions <https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "black" },
	{ name = "isort" },
	{ name = "stylua" },
	{
		--    command = "prettier",
		name = "prettierd",
		extra_args = { "--print-width", "100" },
		filetypes = {
			"typescript",
			"typescriptreact",
			"javascript",
			"css",
			"html",
			"markdown",
			"json",
		},
	},
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "json" } },
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		exe = "eslint",
		filetypes = { "typescript", "typescriptreact", "javascript", "json" },
	},
})

-- Additional Plugins <https://www.lunarvim.org/docs/configuration/plugins/user-plugins>
lvim.plugins = {
	-- Themes
	{ "folke/tokyonight.nvim" },
	{ "morhetz/gruvbox" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/sonokai" },
	{ "lunarvim/horizon.nvim" },
	{ "tomasr/molokai" },
	{ "christoomey/vim-tmux-navigator" },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{ "ThePrimeagen/harpoon" },
	{
		"phaazon/hop.nvim",
		name = "hop",
		branch = "v2",
		config = function()
			require("hop").setup({ keys = "asdfjkluiopnm" })
			vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", {})
			vim.api.nvim_set_keymap("n", "S", ":HopPattern<cr>", {})
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
	},
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
}

lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "frecency")
end

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
-- Geza additions

-- Esc key
lvim.keys.insert_mode["kj"] = "<ESC>"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.insert_mode["kk"] = "<ESC>"

-- Split
lvim.keys.normal_mode["<leader>sv"] = "<C-w>v"
lvim.keys.normal_mode["<leader>se"] = "<C-w>="
lvim.keys.normal_mode["<leader>sx"] = ":close<CR>" --

-- Navigation
-- lvim.keys.normal_mode["<leader>h"] = "<C-w>h"
-- lvim.keys.normal_mode["<leader>l"] = "<C-w>l"
-- lvim.keys.normal_mode["<leader>j"] = "<C-w>j"
-- lvim.keys.normal_mode["<leader>k"] = "<C-w>k"
-- To remember
-- Hover: <S-k> or shift+k
