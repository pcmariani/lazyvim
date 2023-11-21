-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- from DevAsLife
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "cpp",
--   callback = function()
--     vim.api.nvim_buf_set_keymap(
--       0,
--       "n",
--       "<C-c>",
--       ":split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i",
--       opts
--     )
--   end,
-- })

-- local function code_keymap()
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.schedule(CodeRunner)
  end,
})
--
function CodeRunner()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local fname = vim.fn.expand("%:p:t")
  -- local keymap_c = {}

  -- if ft == "python" then
  --   keymap_c = {
  --     name = "Code",
  --     r = { "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>", "Run" },
  --     m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
  --   }
  -- elseif ft == "lua" then
  --   keymap_c = {
  --     name = "Code",
  --     r = { "<cmd>luafile %<cr>", "Run" },
  --   }
  if ft == "groovy" then
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<leader>v",
      ":w<cr>:TermExec cmd='!!'<cr>:TermExec cmd=''<cr>",
      { noremap = true, desc = "Groovy Repeat Terminal Command (!!)" }
    )
  elseif fname == ".tmux.conf" then
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<leader>cs",
      ":w<cr><cmd>!tmux source-file ~/.tmux.conf<cr>",
      { noremap = true, desc = "Source .tmux.conf" }
    )
  end
end

--   elseif ft == "rust" then
--     keymap_c = {
--       name = "Code",
--       r = { "<cmd>Cargo run<cr>", "Run" },
--       D = { "<cmd>RustDebuggables<cr>", "Debuggables" },
--       h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
--       R = { "<cmd>RustRunnables<cr>", "Runnables" },
--     }
--   elseif ft == "go" then
--     keymap_c = {
--       name = "Code",
--       r = { "<cmd>GoRun<cr>", "Run" },
--     }
--   elseif ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
--     keymap_c = {
--       name = "Code",
--       o = { "<cmd>TSLspOrganize<cr>", "Organize" },
--       r = { "<cmd>TSLspRenameFile<cr>", "Rename File" },
--       i = { "<cmd>TSLspImportAll<cr>", "Import All" },
--       R = { "<cmd>lua require('config.test').javascript_runner()<cr>", "Choose Test Runner" },
--       s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
--       t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
--     }
--   end
--
--   if fname == "package.json" then
--     keymap_c.v = { "<cmd>lua require('package-info').show()<cr>", "Show Version" }
--     keymap_c.c = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
--     keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
--     keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
--   end
--
--   if next(keymap_c) ~= nil then
--     whichkey.register(
--       { c = keymap_c },
--       { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
--     )
--   end
-- end
-- end
