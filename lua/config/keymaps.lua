-- easy to command mode
vim.keymap.set({ "n", "x" }, ";", ":", { desc = "Enter Command" })
vim.keymap.set({ "n", "x" }, ":", ";", { desc = "Repeat Search" })

-- Terminal
vim.keymap.set("n", "<leader>otl", function()
  Snacks.terminal(nil, { win = { position = "left" }, cwd = LazyVim.root() })
end, { silent = true, desc = "Terminal Left" })
vim.keymap.set("n", "<leader>otr", function()
  Snacks.terminal(nil, { win = { position = "right" }, cwd = LazyVim.root() })
end, { silent = true, desc = "Terminal Right" })
vim.keymap.set("n", "<leader>x", ":SendToTerm<cr>", { desc = "Send command to term" })
vim.keymap.set("n", "<leader>X", ":SendToTerm ", { desc = "New command to term" })
vim.keymap.set("n", "<leader>c", ":SaveTermCommand<cr>", { desc = "Save term command" })

-- misc
vim.keymap.set("n", "<C-i>", "<C-i>", { silent = true })
vim.keymap.set({ "n", "x" }, "<TAB>", "%", { desc = "Match character" })
vim.keymap.set("n", "<Leader>`", "<C-^>", { desc = "Buffer Previous" })
-- vim.keymap.set("n", "'", "`", { desc = "Marks" })
-- vim.keymap.set(
--   "n",
--   "<leader>ul",
--   -- [[&signcolumn == 'yes' ? 'mR:windo set signcolumn=no numberwidth=1 nonumber norelativenumber<CR>`R:delmark R<cr>' : 'mR:windo set signcolumn=yes numberwidth=4 number<CR>`R:delmark R<cr>']],
--   [[&signcolumn == 'yes' ? ':set signcolumn=no numberwidth=1 nonumber norelativenumber<cr>' : ':set signcolumn=yes numberwidth=4 number<cr>']],
--   { expr = true, silent = true, desc = "Signcolumn" }
-- )
vim.keymap.set("n", "<leader>tl", function()
  require("myStuff.myFuncs").toggleLeftColumns()
end, { expr = true, silent = true, desc = "Signcolumn" })

vim.keymap.set("n", "<leader>tL", function()
  require("myStuff.myFuncs").toggleLeftColumns(1)
end, { expr = true, silent = true, desc = "Signcolumn" })
vim.keymap.set("n", "<leader>m", ":w<cr>:make<cr>", { desc = "Make" })

-- buffer
vim.keymap.set("n", "`", ":bnext<cr>", { desc = "Buffer Next" })
vim.keymap.set("n", "<Leader>bs", ":w<cr>", { desc = "Save Buffer" })
vim.keymap.set("n", "<Leader>by", "mtgg0vG$y`t:delmarks t<cr>", { desc = "Yank Buffer" })
vim.keymap.set("n", "<leader>bk", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<Leader>bl", ":FzfLua filetypes<cr>", { desc = "Buffer Filetype" })

-- splits
vim.keymap.set("n", "-=", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "--", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "-_", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "-<BS>", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "-v", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "-s", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "-x", "<cmd>close<CR>", { desc = "Close current split" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg0vG$", { silent = true, desc = "Select All" })
vim.keymap.set("i", "<C-a>", "<Esc>gg0vG$", { silent = true, desc = "Select All" })

-- set indent
vim.keymap.set("n", "<leader>c2", ":set tabstop=2 shiftwidth=2<CR>", { silent = true, desc = "Tabs: 2 spaces" })
vim.keymap.set("n", "<leader>c4", ":set tabstop=4 shiftwidth=4<CR>", { silent = true, desc = "Tabs: 4 spaces" })

-- Copy/paste
vim.keymap.set("x", "p", "P", { desc = "Paste without yanking" })

-- Cycle visual > visual block mode
vim.keymap.set("x", "v", [[mode() ==# 'v' ? 'V' : mode() ==# '<C-v>' ? 'v' : '<C-q>']], { silent = true, expr = true })

-- quickfix
vim.keymap.set(
  "n",
  "<C-q>",
  ':lua require("myStuff/myFuncs").search_to_qf()<CR>',
  { silent = true, desc = "Send current search to qf" }
)
vim.keymap.set(
  "n",
  "<C-p>",
  [[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-p>" : ":cprevious<CR>"]],
  { silent = true, expr = true, desc = "cprevious" }
)
vim.keymap.set(
  "n",
  "<C-n>",
  [[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-n>" : ":cnext<CR>"]],
  { silent = true, expr = true, desc = "cnext" }
)

-- enter key
vim.keymap.set(
  "n",
  "<CR>",
  [[&buftype ==# 'quickfix' ? "\<CR>" : ':silent! norm!za<CR>']],
  { silent = true, expr = true, desc = "goto qf item" }
)

-- search
-- global search for word under cursor and send to quickfix
vim.keymap.set(
  "n",
  "<leader>s/",
  '/\\V<C-r>=expand("<cword>")<CR><CR>:lua require("myStuff/myFuncs").search_to_qf()<CR>',
  { silent = true, desc = "Search Word Under Cursor" }
)
-- local search for visual selection and send to quickfix
vim.keymap.set(
  "v",
  "<leader>s/",
  [["hy/<C-r>h<CR><S-n>:lua require("myStuff/myFuncs").search_to_qf()<CR>]],
  { silent = true, desc = "Search Visual Selection" }
)

-- Search/Replace ---
-- start local whole file substitution
vim.keymap.set("n", "<leader>R", [[:%s///gc<Left><Left><Left><Left>]], { noremap = true, desc = "Replace in file" })
-- start local substitution within visual selection
vim.keymap.set("v", "<leader>R", [[:s///gc<Left><Left><Left><Left>]], { noremap = true, desc = "Replace in selection" })
-- local search/replace word under cursor
-- vim.keymap.set(
--   "n",
--   "<leader>r",
--   [[viw"hy/\V<C-r>h<CR>:%s/<C-r>h/<C-r>h/gc<Left><Left><Left>]],
--   { noremap = true, desc = "Replace Word Under Cursor" }
-- )

vim.keymap.set(
  "n",
  "<leader>r",
  [[mr/\V<C-r>=expand("<cword>")<cr><cr>`r:delmark r<cr>:%s/\<<C-r>=expand("<cword>")<CR>\>/<C-r>=expand("<cword>")<CR>/gc<Left><Left><Left>]],
  -- [[*'':%s/\<<C-r>=expand("<cword>")<CR>\>/<C-r>=expand("<cword>")<CR>/gc<Left><Left><Left>]],
  { noremap = true }
)
-- local search/replace visual selection
vim.keymap.set(
  "v",
  "<leader>r",
  [[mr"hy/\V<C-r>h<cr>`r:delmark r<cr>:%s/<C-r>h/<C-r>h/gc<Left><Left><Left>]],
  { noremap = true, desc = "Replace Visual Selection" }
)

--formatting
--xml
vim.keymap.set({ "n", "v" }, "=x", function()
  vim.bo.filetype = "xml"
  LazyVim.format({ force = true })
end, { desc = "Format Xml" })

--xml
vim.keymap.set({ "n", "v" }, "=j", function()
  vim.bo.filetype = "json"
  LazyVim.format({ force = true })
end, { desc = "Format Json" })

-- -- Stay in indent mode
-- vim.keymap.set("n", "<", "<<", { silent = true })
-- vim.keymap.set("n", ">", ">>", { silent = true })
-- vim.keymap.set("v", "<", "<gv", { silent = true })
-- vim.keymap.set("v", ">", ">gv", { silent = true })

-- -- json
-- vim.keymap.set('n','=j',':set filetype=json<CR>:%!jq .<CR>:set foldmethod=syntax<CR>zR', { noremap = true, silent = true })

-- -- xml
-- -- vim.keymap.set('n','=x', ':set filetype=xml<CR>:1s/<?xml .*?>//e<CR>:silent %!xmllint --encode UTF-8 --format -<CR>:1d<CR><ESC>', { noremap = true, silent = true })
-- vim.keymap.set('n','=x', ':set filetype=xml<CR>:%s/></>\r</g<CR>==', { noremap = true, silent = true })

-- -- Search ---
-- -- send // to quickfix locally
-- vim.keymap.set('n','<C-q>', [[:silent vimgrep //j %<CR>]], { noremap = true, silent = true })
-- -- send // to quickfix globally
-- vim.keymap.set('n','<leader><C-q>', [[:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], { noremap = true, silent = true })
-- -- local search for word under cursor and send to quickfix
-- vim.keymap.set('n','<leader>/', [[/\V<C-r>=expand("<cword>")<CR><CR>]], { noremap = true, silent = true })
-- -- global search for word under cursor and send to quickfix
-- vim.keymap.set('n','<leader><leader>/', [[/\V<C-r>=expand("<cword>")<CR><CR>:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], { noremap = true, silent = true })
-- -- global search for functions
-- vim.keymap.set('n','<leader>sf', [[/<CR>:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], { noremap = true, silent = true })
--
-- -- local search for visual selection
-- vim.keymap.set('v','/','"hy/\\V<C-r>h<CR><S-n>', { noremap = true, silent = true })
-- -- local search for visual selection and send to quickfix
-- vim.keymap.set('v','<leader>/', [["hy/<C-r>h<CR>:silent vimgrep //j %<CR>]], { noremap = true, silent = true })
-- -- global search for visual selection and send to quickfix
-- vim.keymap.set('v','<leader><leader>/', [["hy/<C-r>h<CR>:silent exe "grep "shellescape(substitute(@/,'[()\]\[]','\\&','g'))<CR>]], { noremap = true, silent = true })
--
-- -- Search/Replace ---
-- -- start local whole file substitution
-- vim.keymap.set('n','<leader>;', [[:%s///gc<Left><Left><Left><Left>]], { noremap = true })
-- -- start local substitution within visual selection
-- vim.keymap.set('v','<leader>;', [[:s///gc<Left><Left><Left><Left>]], { noremap = true })
-- -- local search/replace word under cursor
-- vim.keymap.set('n','<leader>h', [[/\V<C-r>=expand("<cword>")<CR><CR>:%s/\<<C-r>=expand("<cword>")<CR>\>/<C-r>=expand("<cword>")<CR>/gc<Left><Left><Left>]], { noremap = true })
-- -- local search/replace visual selection
-- vim.keymap.set('v','<leader>h', [["hy/\V<C-r>h<CR>:%s/<C-r>h//gc<Left><Left><Left>]], { noremap = true })
-- -- global search/replace word under cursor
-- vim.keymap.set('v','<leader><leader>h', [["hy/<C-r>h<CR>:silent exe "grep "shellescape(substitute(@/,'[()\]\[{}]','\\&','g'))<CR>:cdo s/<C-r>h//gc<Left><Left><Left>]], { noremap = true })

-- -- QuickFix list
-- vim.keymap.set('n','<F4>', ':call ToggleQuickFix()<cr>', { noremap = true, silent = true })
-- vim.keymap.set('n','<C-p>', [[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-p>" : ":cprevious<CR>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-n>', [[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-n>" : ":cnext<CR>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<CR>', [[&buftype ==# 'quickfix' ? "\<CR>" : ':silent! norm!za<CR>']], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-o>', [[&buftype ==# 'quickfix' ? ":echo 'o'<CR>" : "<C-o>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-i>', [[&buftype ==# 'quickfix' ? ":echo 'i'<CR>" : "<C-i>"]], { noremap = true, silent = true, expr = true})
--
-- -- Location list
-- vim.keymap.set('n','<F5>', ':silent! call ToggleLocationList()<cr>', { noremap = true, silent = true })
-- vim.keymap.set('n','<C-M-p>', [[empty(filter(getwininfo(), 'v:val.loclist')) ? "<C-M-p>" : ":lprevious<CR>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-M-n>', [[empty(filter(getwininfo(), 'v:val.loclist')) ? "<C-M-n>" : ":lnext<CR>"]], { noremap = true, silent = true, expr = true})

-- -- Copy paste
-- vim.keymap.set('v','p','"_dP', { noremap = true, silent = true })
-- vim.keymap.set('','x','"_x', { noremap = true, silent = true })

-- -- paste without overwriting register
-- vim.keymap.set("v", "p", "pgvy", { noremap = true, desc = "Paste" })
-- vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })

-- -- tmux send last command
-- vim.keymap.set('n','<leader>v',':w<BAR>:silent !tmux send-keys -t\\! "\\!\\!" Enter Enter<CR>', { noremap = true, silent = true })

-- -- term send last command
-- if jit.os == "Windows" then
--   vim.keymap.set( "n", "<leader>v", ":w<cr>:TermExec cmd=\"r\"<cr>", { noremap = true, desc = "Repeat Terminal Command (r)" })
-- else
--   vim.keymap.set( "n", "<leader>v", ":w<cr>:TermExec cmd='!!'<cr>:TermExec cmd=''<cr>", { noremap = true, desc = "Repeat Terminal Command (!!)" })
-- end

-- -- QuickFix list
-- vim.keymap.set('n','<F4>', ':call ToggleQuickFix()<cr>', { noremap = true, silent = true })
-- vim.keymap.set('n','<C-p>', [[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-p>" : ":cprevious<CR>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-n>', [[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-n>" : ":cnext<CR>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<CR>', [[&buftype ==# 'quickfix' ? "\<CR>" : ':silent! norm!za<CR>']], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-o>', [[&buftype ==# 'quickfix' ? ":echo 'o'<CR>" : "<C-o>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-i>', [[&buftype ==# 'quickfix' ? ":echo 'i'<CR>" : "<C-i>"]], { noremap = true, silent = true, expr = true})
--
-- -- Location list
-- vim.keymap.set('n','<F5>', ':silent! call ToggleLocationList()<cr>', { noremap = true, silent = true })
-- vim.keymap.set('n','<C-M-p>', [[empty(filter(getwininfo(), 'v:val.loclist')) ? "<C-M-p>" : ":lprevious<CR>"]], { noremap = true, silent = true, expr = true})
-- vim.keymap.set('n','<C-M-n>', [[empty(filter(getwininfo(), 'v:val.loclist')) ? "<C-M-n>" : ":lnext<CR>"]], { noremap = true, silent = true, expr = true})
--
-- -- Search ---
-- -- send // to quickfix locally
-- vim.keymap.set('n','<C-q>', [[:silent vimgrep //j %<CR>]], { noremap = true, silent = true })
-- -- send // to quickfix globally
-- vim.keymap.set('n','<leader><C-q>', [[:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], { noremap = true, silent = true })
--
-- -- local search for word under cursor - don't need, * does same thing
-- vim.keymap.set('n','<leader>/', [[/\V<C-r>=expand("<cword>")<CR><CR>]], { noremap = true, silent = true })
-- -- global search for word under cursor and send to quickfix
-- vim.keymap.set('n','<leader><leader>/', [[/\V<C-r>=expand("<cword>")<CR><CR>:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], { noremap = true, silent = true })
-- -- global search for functions
-- vim.keymap.set('n','<leader>sf', [[/<CR>:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], { noremap = true, silent = true })
--
-- -- local search for visual selection
-- vim.keymap.set('v','/','"hy/\\V<C-r>h<CR><S-n>', { noremap = true, silent = true })
-- -- local search for visual selection and send to quickfix
-- vim.keymap.set('v','<leader>/', [["hy/<C-r>h<CR>:silent vimgrep //j %<CR>]], { noremap = true, silent = true })
-- -- global search for visual selection and send to quickfix
-- vim.keymap.set('v','<leader><leader>/', [["hy/<C-r>h<CR>:silent exe "grep "shellescape(substitute(@/,'[()\]\[]','\\&','g'))<CR>]], { noremap = true, silent = true })
--
-- -- Search/Replace ---
-- -- start local whole file substitution
-- vim.keymap.set('n','<leader>;', [[:%s///gc<Left><Left><Left><Left>]], { noremap = true })
-- -- start local substitution within visual selection
-- vim.keymap.set('v','<leader>;', [[:s///gc<Left><Left><Left><Left>]], { noremap = true })
-- -- local search/replace word under cursor
-- vim.keymap.set('n','<leader>h', [[/\V<C-r>=expand("<cword>")<CR><CR>:%s/\<<C-r>=expand("<cword>")<CR>\>/<C-r>=expand("<cword>")<CR>/gc<Left><Left><Left>]], { noremap = true })
-- -- local search/replace visual selection
-- vim.keymap.set('v','<leader>h', [["hy/\V<C-r>h<CR>:%s/<C-r>h//gc<Left><Left><Left>]], { noremap = true })
-- -- global search/replace visual selection
-- vim.keymap.set('v','<leader><leader>h', [["hy/<C-r>h<CR>:silent exe "grep "shellescape(substitute(@/,'[()\]\[{}]','\\&','g'))<CR>:cdo s/<C-r>h//gc<Left><Left><Left>]], { noremap = true })
