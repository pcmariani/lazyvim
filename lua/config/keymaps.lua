-- Keymaps are automaticaEuropelly loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- (This file is being ignored by stylua (.styluaignore))

-- DELETIONS
-- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")
-- windows
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
-- buffers


vim.keymap.set("n", "<Leader>cp", function()
  return require("debugprint").debugprint({ variable = true })
end, { noremap = true, expr = true, desc = "DEBUG Print" })

-- send-command (testing)
-- vim.api.nvim_set_keymap( "n", "<leader>i", ':lua require"send-command".get_user_input()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap( "n", "<leader>s", ':lua require"send-command".send_to_terminal()<CR>', { noremap = true, silent = true })

-- keep from jumplist
-- vim.keymap.set("n", "{", [[:execute "keepjumps norm! " . v:count1 . "{"<cr>]], { noremap = true, desc = "Previous empty line" })
-- vim.keymap.set("n", "}", [[:execute "keepjumps norm! " . v:count1 . "}"<cr>]], { noremap = true, desc = "Next empty line" })

-- paste without overwriting register
vim.keymap.set("v", "p", "pgvy", { noremap = true, desc = "Paste" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })

-- buffer
vim.keymap.set("n", "<Leader>bs", ":w<cr>", { noremap = true, desc = "Save Buffer" })
vim.keymap.set("n", "<Leader>w", ":w<cr>", { noremap = true, desc = "Save Buffer" })
vim.keymap.set("n", "<Leader>by", "mtgg0vG$y`t:delmarks t<cr>", { noremap = true, desc = "Yank Buffer" })
vim.keymap.set("n", "<Leader>bN", ":enew<cr>", { noremap = true, desc = "New Buffer" })
vim.keymap.set("n", "<Leader>bl", ":Telescope filetypes<cr>", { noremap = true, desc = "Set Buffer Filetype" })
vim.keymap.set("n", "<Leader>bf", ":Telescope filetypes<cr>", { noremap = true, desc = "Format Buffer" })
vim.keymap.set({ "n", "v" }, "<leader>bf", function() require("lazyvim.util").format({ force = true }) end, { desc = "Format" })

-- easy to command mode
vim.keymap.set({ "n", "x" }, ";", ":", { noremap = true, desc = "Enter Command" })
vim.keymap.set({ "n", "x" }, ":", ";", { noremap = true, desc = "Repeat Search" })

-- Move text up and down
vim.keymap.set("n", "∆", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move Up" })
vim.keymap.set("n", "˚", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move Down" })
vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move Up" })
vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move Down" })
vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move Up" })
vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move Down" })

-- Select all (don't add to jumplist)
-- vim.keymap.set("n", "<C-a>", [[:execute "keepjumps norm! gg0vG$"<cr>]], { noremap = true, silent = true, desc = "Select All" })
-- vim.keymap.set("i", "<C-a>", [[:execute "keepjumps norm! <Esc>gg0vG$"<cr>]], { noremap = true, silent = true, desc = "Select All" })
vim.keymap.set("n", "<C-a>", "<cr>gg0vG$", { noremap = true, silent = true, desc = "Select All" }) -- TODO:don't add gg to jump list
vim.keymap.set("i", "<C-a>", "<Esc>gg0vG$", { noremap = true, silent = true, desc = "Select All" })

-- tmux send last command
-- vim.keymap.set( "n", "<leader>v", ':w<BAR>:silent !tmux send-keys -t\\! "\\!\\!" Enter Enter<CR>', { noremap = true, silent = true })

-- term send last command
if jit.os == "Windows" then
  vim.keymap.set( "n", "<leader>v", ":w<cr>:TermExec cmd=\"r\"<cr>", { noremap = true, desc = "Repeat Terminal Command (r)" })
else
  vim.keymap.set( "n", "<leader>v", ":w<cr>:TermExec cmd='!!'<cr>:TermExec cmd=''<cr>", { noremap = true, desc = "Repeat Terminal Command (!!)" })
end

-- Send to QuickFix --
-- send // to quickfix locally
vim.keymap.set("n", "<C-q>", [[:silent vimgrep //j %<CR>]], { noremap = true, silent = true, desc = "Send to qf" })
-- send // to quickfix globally
-- vim.keymap.set( "n", "<leader><C-q>", [[:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], { noremap = true, silent = true, desc = "Send to qf globally" })

-- Search/Replace --
-- start local whole file substitution
vim.keymap.set("n", "<leader>;", [[:%s///gc<Left><Left><Left><Left>]], { noremap = true, desc = "Begin Substitution" })
-- start local substitution within visual selection
vim.keymap.set("v", "<leader>;", [[:s///gc<Left><Left><Left><Left>]], { noremap = true, desc = "Begin Substitution" })
-- local search/replace word under cursor
vim.keymap.set( "n", "<leader>h", [[viw"hy/\V<C-r>h<CR>:%s/<C-r>h/<C-r>h/gc<Left><Left><Left>]], { noremap = true, desc = "Replace Word Under Cursor" })
-- local search/replace visual selection
vim.keymap.set( "v", "<leader>h", [["hy/\V<C-r>h<CR>:%s/<C-r>h/<C-r>h/gc<Left><Left><Left>]], { noremap = true, desc = "Replace Visual Selection" })

--- Formatting ---
-- format all
vim.keymap.set("n", "=b", "gg0vG$==", { noremap = true, silent = true, desc = "Format Buffer" })

-- set indent
vim.keymap.set("n", "=2", ":set tabstop=2 shiftwidth=2<CR>", { noremap = true, silent = true, desc = "set indent=2" })
vim.keymap.set("n", "=4", ":set tabstop=4 shiftwidth=4<CR>", { noremap = true, silent = true, desc = "set indent=4" })

vim.keymap.set({ "n", "v" }, "=j", function()
  vim.bo.filetype = 'json'
  require("lazyvim.util").format({ force = true })
end, { desc = "Set Filetype JSON" })

vim.keymap.set({ "n", "v" }, "=x", function()
  vim.bo.filetype = 'xml'
  require("lazyvim.util").format({ force = true })
end, { desc = "Set Filetype XML" })

-- vim.keymap.set("n", "<Leader>ct", function()
--   local buf_ids = vim.api.nvim_list_bufs()
--   for _, buf_id in ipairs(buf_ids) do
--     local buftype = vim.api.nvim_buf_get_option(buf_id, 'buftype')
--     if buftype =='terminal' then
--       print("yes term")
--       break
--     else
--       print("no term")
--     end
--   end
-- end, { desc = "Check if there is a term"})
