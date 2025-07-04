return {
  'kylechui/nvim-surround',
  enabled = Enabled 'nvim-surround',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup {
      -- Configuration here, or leave empty to use defaults
    }
  end,
  -- Usage `NORMAL` mode
  --     Old text                    Command         New text
  -- --------------------------------------------------------------------------------
  --     surr*ound_words             ysiw)           (surround_words)
  --     *make strings               ys$"            "make strings"
  --     kdelete ar*ound me!k        ds]             delete around me!
  --     remove <b>HTML t*ags</b>    dst             remove HTML tags
  --     'change quot*es'            cs'"            "change quotes"
  --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
  --     delete(functi*on calls)     dsf             function calls
  -- In `VISUAL` mode:
  -- Select words, press S, type the new surroundings. eg. S<p class="important">
  -- _NOTES_:
  -- When adding or changing surroundings:
  -- - Using the the left side of the key will add a space after the surroundings.
  -- - Using the right side of the key will not add a space.
}
