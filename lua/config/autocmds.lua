vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("filetypes", { clear = true }),
  desc = "Don't show linenunmbers",
  pattern = { "yaml", "yml" },
  command = "set nonumber | set norelativenumber | set signcolumn=no",
})

vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  group = "CursorLine",
  desc = "Show cursorline on active window",
  command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = vim.api.nvim_create_augroup("CursorLine", { clear = false }),
  desc = "Don't Show cursorline on non-active window",
  command = "setlocal nocursorline",
})

vim.cmd([[
" augroup Formatoptions
"   au!
"   au VimEnter * set fo-=c fo-=o
" augroup END

" augroup Filetypes
"   au!
"   au BufWinEnter * if &l:buftype ==# 'help' | nnoremap <buffer> q :q<CR> | endif
"   " Make sure .aliases, .bash_aliases and similar files get syntax highlighting.
"   au BufNewFile,BufRead *aliases* set ft=sh
"   " Update a buffer's contents on focus if it changed outside of Vim.
"   " au FocusGained,BufEnter * :checktime
" augroup END

" augroup terminal
"   au!
"   " au BufWinEnter,WinEnter term://* startinsert
"   au BufWinEnter,WinEnter * if &l:buftype ==# 'terminal' | call SpecialWindowMaps() | set signcolumn=no | endif
" augroup END

" augroup qf
"   au!
"   au BufWinEnter * if &l:buftype ==# 'quickfix'
"     \| nnoremap <buffer> dd :lua require('myFuncs').remove_qf_item()<CR>
"     \| nnoremap <buffer> q :cclose<CR>
"     \| nnoremap <buffer> <leader>bk :cclose<CR>
"     \| nnoremap <buffer> <leader>bd :cclose<CR>
"     \| call SpecialWindowMaps()
"     \| endif
"   au FileType qf call SetQFOptions()
"   " quit Vim if the last window is a quickfix window
"   " au qf BufEnter    <buffer> nested if get(g:, 'qf_auto_quit', 1) | if winnr('$') < 2 | q | endif | endif
" augroup END

" function SetQFOptions()
"   " open quickfix full width on the bottom
"   if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif
"   set nobuflisted
"   setlocal norelativenumber
"   setlocal number
"   set laststatus=0
"   au WinClosed <buffer> set laststatus=2
" endfunction

" function SpecialWindowMaps()
"   nnoremap <buffer> ` <nop>
"   nnoremap <buffer> <leader>` <nop>
"   nnoremap <buffer> <leader>bs <nop>
"   nnoremap <buffer> <leader>bn <nop>
"   nnoremap <buffer> <leader>bN <nop>
"   nnoremap <buffer> <leader>bp <nop>
"   endfunction

]])
