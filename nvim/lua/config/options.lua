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
  scrolloff = 8,
  wrap = false,
  fillchars = [[eob: ,fold:•,foldopen:,foldsep: ,foldclose:]],
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[
let g:currentmode={
       \ 'n'  : '%#String# NORMAL ',
       \ 'no'  : '%#ModeMsg# O-PENDING ',
       \ 'nov'  : '%#ModeMsg# O-PENDING ',
       \ 'noV'  : '%#ModeMsg# O-PENDING ',
       \ 's'  : '%#String# SELECT ',
       \ 'v'  : '%#Search# VISUAL ',
       \ "\<C-V>" : '%#Title# V·BLOCK ',
       \ 'V'  : '%#IncSearch# V·LINE ',
       \ 'Rv' : '%#String# V·REPLACE ',
       \ 'i'  : '%#InsertMode# INSERT ',
       \ 'R'  : '%#Substitute# REPLACE ',
       \ 'c'  : '%#CurSearch# COMMAND ',
       \ '!'  : '%#ModeMsg# SHELL ',
       \ 't'  : '%#ModeMsg# TERMINAL ',
       \}
]])

vim.opt.statusline =
  '%{%g:currentmode[mode()]%} %* %y %* %t  %* %= %m %r %w %#Substitute#%{g:gitbranch} %#InsertMode#%{strftime(" %H:%M")} '

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
