Is_enabled = require("core.functions").is_enabled

return {
  "mg979/vim-visual-multi",
  enabled = Is_enabled("vim-visual-multi"),
  branch = "master",
  lazy = false,
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-m>",
      -- ["Add Cursor Down"] = "<C-Down>",
      ["Add Cursor Up"] = "<A-e>",
      -- Multicursor
      -- if Is_Enabled("vim-visual-multi") then
      --   vim.keymap.set({ "n" }, "<C-m>", "<Plug>(VM-Find-Under)", { desc = "VM Word" })
      --   vim.keymap.set({ "n" }, "<A-e>", "<Plug>(VM-Add-Cursor-Up)", { desc = "VM Cursor Up" })
      --   -- let g:VM_maps['Find Under']                  = '<C-n>'
      --   -- let g:VM_maps['Find Subword Under']          = '<C-n>'
      --   -- let g:VM_maps["Select All"]                  = '\\A'
      --   -- let g:VM_maps["Start Regex Search"]          = '\\/'
      --   -- let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
      --   -- let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
      --   -- let g:VM_maps["Add Cursor At Pos"]           = '\\\'
      --   --
      --   -- let g:VM_maps["Visual Regex"]                = '\\/'
      --   -- let g:VM_maps["Visual All"]                  = '\\A'
      --   -- let g:VM_maps["Visual Add"]                  = '\\a'
      --   -- let g:VM_maps["Visual Find"]                 = '\\f'
      --    let g:VM_maps["Visual Cursors"]              = '\\c'
      -- end
    }
  end,
}
