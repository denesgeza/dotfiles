return {
  ---@class snacks.statuscolumn.Config
  {
    "folke/snacks.nvim",
    enabled = Is_enabled("snacks"),
    priority = 1000,
    lazy = false,
    opts = {
      quickfile = { enabled = false },
      rename = { enabled = true },
      bufdelete = { enabled = true },
      statuscolumn = {
        left = { "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold", "git" }, -- priority of signs on the right (high to low)
        folds = {
          open = true, -- show open fold icons
          git_hl = true, -- use Git Signs hl for fold icons
        },
        git = {
          -- patterns to match Git signs
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50, -- refresh at most every 50ms
      },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            cmd = "colorscript -e square",
            height = 5,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = vim.fn.isdirectory(".git") == 1,
            cmd = "hub status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      terminal = {
        enabled = true,
        win = {
          position = "float",
          border = "single",
        },
      },
      words = {
        enabled = true,
        debounce = 200,
        notify_jump = false,
        notify_end = true,
        foldopen = true,
        jumplist = true,
        modes = { "n" },
      },
      notifier = { enabled = true, timeout = 5000 },
      lazygit = {
        -- automatically configure lazygit to use the current colorscheme
        -- and integrate edit with the current neovim instance
        configure = true,
        -- extra configuration for lazygit that will be merged with the default
        -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
        -- you need to double quote it: `"\"test\""`
        config = {
          os = { editPreset = "nvim-remote" },
          gui = { nerdFontsVersion = "3" },
        },
        theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
        -- Theme for lazygit
        theme = {
          [241] = { fg = "Special" },
          activeBorderColor = { fg = "DiagnosticError", bold = true },
          cherryPickedCommitBgColor = { fg = "Identifier" },
          cherryPickedCommitFgColor = { fg = "Function" },
          defaultFgColor = { fg = "Normal" },
          inactiveBorderColor = { fg = "FloatBorder" },
          optionsTextColor = { fg = "Function" },
          searchingActiveBorderColor = { fg = "DiagnosticError", bold = true },
          selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
          unstagedChangesColor = { fg = "DiagnosticError" },
        },
        win = {
          style = "lazygit",
        },
      },
      style = {
        notification = {
          wo = { wrap = true },
        },
      },
    },
    keys = {
      -- stylua: ignore start
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      -- stylua: ignore end
    },
    init = function()
      -- Simple LSP progress indicator
      -- vim.api.nvim_create_autocmd("LspProgress", {
      --   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      --   callback = function(ev)
      --     local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
      --     vim.notify(vim.lsp.status(), "info", {
      --       id = "lsp_progress",
      --       title = "LSP Progress",
      --       opts = function(notif)
      --         notif.icon = ev.data.params.value.kind == "end" and " "
      --           or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      --       end,
      --     })
      --   end,
      -- })
      -- Advanced LSP progress indicator
      ------@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
      ---local progress = vim.defaulttable()
      ---vim.api.nvim_create_autocmd("LspProgress", {
      ---  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      ---  callback = function(ev)
      ---    local client = vim.lsp.get_client_by_id(ev.data.client_id)
      ---    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
      ---    if not client or type(value) ~= "table" then
      ---      return
      ---    end
      ---    local p = progress[client.id]
      ---
      ---    for i = 1, #p + 1 do
      ---      if i == #p + 1 or p[i].token == ev.data.params.token then
      ---        p[i] = {
      ---          token = ev.data.params.token,
      ---          msg = ("[%3d%%] %s%s"):format(
      ---            value.kind == "end" and 100 or value.percentage or 100,
      ---            value.title or "",
      ---            value.message and (" **%s**"):format(value.message) or ""
      ---          ),
      ---          done = value.kind == "end",
      ---        }
      ---        break
      ---      end
      ---    end
      ---
      ---    local msg = {} ---@type string[]
      ---    progress[client.id] = vim.tbl_filter(function(v)
      ---      return table.insert(msg, v.msg) or not v.done
      ---    end, p)
      ---
      ---    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
      ---    vim.notify(table.concat(msg, "\n"), "info", {
      ---      id = "lsp_progress",
      ---      title = client.name,
      ---      opts = function(notif)
      ---        notif.icon = #progress[client.id] == 0 and " "
      ---          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      ---      end,
      ---    })
      ---  end,
      ---})
      -- Additional keys
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
        end,
      })
    end,
  },
}
