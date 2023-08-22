local functions = require("config.functions")
Is_Enabled = functions.is_enabled

local options = {
  autoindent = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  termguicolors = true,
  foldmethod = "indent",
  -- foldlevel = 1,
  -- foldlevelstart = 1,
  laststatus = 2,
  swapfile = false,
  showmode = false,
  cmdheight = 2,
  fillchars = [[eob: ,fold:•,foldopen:,foldsep: ,foldclose:]],
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

if Is_Enabled("lualine") then
  vim.opt.laststatus = 0
else
  vim.opt.laststatus = 2

  vim.cmd([[
let g:currentmode={
       \ 'n'  : '%#@character# NORMAL ',
       \ 'no'  : '%#ModeMsg# O-PENDING ',
       \ 'nov'  : '%#ModeMsg# O-PENDING ',
       \ 'noV'  : '%#ModeMsg# O-PENDING ',
       \ 's'  : '%#String# SELECT ',
       \ 'v'  : '%#Search# VISUAL ',
       \ "\<C-V>" : '%#Title# V·BLOCK ',
       \ 'V'  : '%#IncSearch# V·LINE ',
       \ 'Rv' : '%#String# V·REPLACE ',
       \ 'i'  : '%#Todo# INSERT ',
       \ 'R'  : '%#Substitute# REPLACE ',
       \ 'c'  : '%#CurSearch# COMMAND ',
       \ '!'  : '%#ModeMsg# SHELL ',
       \ 't'  : '%#CurSearch# TERMINAL ',
       \}
]])

  vim.cmd([[
let g:currentmode_hl={
       \ 'n'  : '%#@character#',
       \ 'no'  : '%#ModeMsg#',
       \ 'nov'  : '%#ModeMsg#',
       \ 'noV'  : '%#ModeMsg#',
       \ 's'  : '%#String#',
       \ 'v'  : '%#Search#',
       \ "\<C-V>" : '%#Title#',
       \ 'V'  : '%#IncSearch#',
       \ 'Rv' : '%#String#',
       \ 'i'  : '%#Todo#',
       \ 'R'  : '%#Substitute#',
       \ 'c'  : '%#CurSearch#',
       \ '!'  : '%#ModeMsg#',
       \ 't'  : '%#CurSearch#',
       \}
]])
  -- vim.opt.statusline =
  --   '%{%g:currentmode[mode()]%} %* %y %* %t  %* %= %m %r %w %#Substitute#%{g:gitbranch} %{%g:currentmode_hl[mode()]%}%{strftime(" %H:%M")} '

  vim.cmd([[
function! StatuslineGitBranch()
  let g:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let g:gitbranch="  ".substitute(l:gitrevparse, '\n', '', 'g')." "
      else
        let g:gitbranch=""
      endif
    catch
    endtry
  endif
endfunction
]])

  vim.cmd([[
augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
]])
end
