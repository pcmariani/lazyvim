vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_augroup("Makeprgs", { clear = true })
vim.api.nvim_create_augroup("FileTypes", { clear = true })
vim.api.nvim_create_augroup("StartUp", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = "StartUp",
  callback = function()
    if vim.fn.getcwd() ~= vim.env.HOME and vim.fn.argc() == 0 then
      require("persistence").load()
    end
  end,
  nested = true,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local function popen(cmd)
      local handle = io.popen(cmd)
      if handle then
        local result = handle:read("*l")
        handle:close()
        return result
      end
      return nil
    end

    local session = popen("tmux display-message -p '#S:#I' 2>/dev/null")
    if session and session ~= "" then
      vim.g.tmux_info = " " .. session
    else
      vim.g.tmux_info = ""
    end
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "FileTypes",
  desc = "Set tabs to 4 spaces",
  pattern = { "c", "cpp", "groovy" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypes",
  desc = "Don't show linenunmbers",
  pattern = { "yaml", "yml" },
  command = "set nonumber | set norelativenumber | set signcolumn=no",
})

vim.api.nvim_create_autocmd("BufRead", {
  group = "FileTypes",
  pattern = "result.*",
  callback = function()
    vim.opt_local.autoread = true
  end,
})
-- vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
--   group = "CursorLine",
--   desc = "Show cursorline on active window",
--   command = "setlocal cursorline",
-- })
-- vim.api.nvim_create_autocmd("WinLeave", {
--   group = "CursorLine",
--   desc = "Don't Show cursorline on non-active window",
--   command = "setlocal nocursorline",
-- })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter", "BufWinEnter", "SessionLoadPost" }, {
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
        c = "gcc -g % -o %<",
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

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "*",
--   callback = function()
--     vim.schedule(CodeRunner)
--   end,
-- })
-- --
-- function CodeRunner()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
--   local fname = vim.fn.expand("%:p:t")
--   -- local keymap_c = {}
--
--   -- if ft == "python" then
--   --   keymap_c = {
--   --     name = "Code",
--   --     r = { "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>", "Run" },
--   --     m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
--   --   }
--   -- elseif ft == "lua" then
--   --   keymap_c = {
--   --     name = "Code",
--   --     r = { "<cmd>luafile %<cr>", "Run" },
--   --   }
--   -- if ft == "groovy" or ft == "sql" then
--   --   if jit.os == "Windows" then
--   --     vim.api.nvim_buf_set_keymap(
--   --       bufnr,
--   --       "n",
--   --       "<leader>v",
--   --       ':w<cr>:TermExec cmd="r"<cr>',
--   --       { noremap = true, desc = "Groovy Repeat Terminal Command (r)" }
--   --     )
--   --   else
--   --     vim.api.nvim_buf_set_keymap(
--   --       bufnr,
--   --       "n",
--   --       "<leader>v",
--   --       ":w<cr>:TermExec cmd='!!'<cr>:TermExec cmd=''<cr>",
--   --       { noremap = true, desc = "Groovy Repeat Terminal Command (!!)" }
--   --     )
--   --   end
--   if fname == ".tmux.conf" then
--     vim.api.nvim_buf_set_keymap(
--       bufnr,
--       "n",
--       "<leader>cs",
--       ":w<cr><cmd>!tmux source-file ~/.tmux.conf<cr>",
--       { noremap = true, desc = "Source .tmux.conf" }
--     )
--   end
-- end
--
-- --   elseif ft == "rust" then
-- --     keymap_c = {
-- --       name = "Code",
-- --       r = { "<cmd>Cargo run<cr>", "Run" },
-- --       D = { "<cmd>RustDebuggables<cr>", "Debuggables" },
-- --       h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
-- --       R = { "<cmd>RustRunnables<cr>", "Runnables" },
-- --     }
-- --   elseif ft == "go" then
-- --     keymap_c = {
-- --       name = "Code",
-- --       r = { "<cmd>GoRun<cr>", "Run" },
-- --     }
-- --   elseif ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
-- --     keymap_c = {
-- --       name = "Code",
-- --       o = { "<cmd>TSLspOrganize<cr>", "Organize" },
-- --       r = { "<cmd>TSLspRenameFile<cr>", "Rename File" },
-- --       i = { "<cmd>TSLspImportAll<cr>", "Import All" },
-- --       R = { "<cmd>lua require('config.test').javascript_runner()<cr>", "Choose Test Runner" },
-- --       s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
-- --       t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
-- --     }
-- --   end
-- --
-- --   if fname == "package.json" then
-- --     keymap_c.v = { "<cmd>lua require('package-info').show()<cr>", "Show Version" }
-- --     keymap_c.c = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
-- --     keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
-- --     keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
-- --   end
-- --
-- --   if next(keymap_c) ~= nil then
-- --     whichkey.register(
-- --       { c = keymap_c },
-- --       { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
-- --     )
-- --   end
-- -- end
-- -- end
