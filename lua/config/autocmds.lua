vim.api.nvim_create_augroup("FileTypes", { clear = true })
vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_augroup("Makeprgs", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypes",
  desc = "Don't show linenunmbers",
  pattern = { "yaml", "yml" },
  command = "set nonumber | set norelativenumber | set signcolumn=no",
})

vim.api.nvim_create_autocmd({ "VimEnter", "BufRead", "BufNewFile", "BufEnter", "BufWinEnter" }, {
  group = "Makeprgs",
  callback = function(args)
    local path = vim.fn.fnamemodify(args.file, ":p")
    local buf = args.buf
    local makeprg

    -- Map of full/partial paths to makeprg
    local path_map = {
      [vim.fn.expand("~/.tmux.conf")] = "tmux source-file ~/.tmux.conf",
    }

    -- Try path match first
    for p, cmd in pairs(path_map) do
      if path == vim.fn.fnamemodify(p, ":p") then
        makeprg = cmd
        break
      end
    end

    -- If no path match, fallback to filetype
    if not makeprg then
      local ft_map = {
        c = "gcc % -o %<",
        -- lua = "luacheck %",
        -- python = "python3 %",
      }
      makeprg = ft_map[vim.bo[buf].filetype]
    end

    if makeprg then
      vim.bo[buf].makeprg = makeprg
      vim.keymap.set("n", "<leader>m", ":w<cr>:make<cr>", {
        buffer = buf,
        desc = "Make: " .. makeprg,
        silent = true,
      })
    end
  end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  group = "CursorLine",
  desc = "Show cursorline on active window",
  command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = "CursorLine",
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
