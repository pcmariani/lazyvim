-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.o.relativenumber = false
vim.opt.showtabline = 1
vim.o.tabline = "%!v:lua.MyTabLine()"
vim.o.cursorline = false
vim.opt.equalalways = false
vim.opt.list = false
-- vim.o.winborder = "rounded"

-- auto reload buffer if changed by another program
vim.o.autoread = true
-- Periodically check for external file changes (works inside tmux)
do
  local timer = vim.loop.new_timer()
  timer:start(
    2000, -- initial delay (ms)
    2000, -- repeat interval (ms)
    vim.schedule_wrap(function()
      -- Check all visible buffers in the current tab only
      local seen = {}
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if not seen[buf] then
          seen[buf] = true
          local bo = vim.bo[buf]
          if bo.buftype == "" and bo.modifiable and not bo.modified then
            vim.api.nvim_buf_call(buf, function()
              vim.cmd("silent! checktime")
            end)
          end
        end
      end
    end)
  )
end

-- Do not continue comments on 'o' or 'O', but keep it for <Enter>
vim.opt.formatoptions:remove({ "o" })

function _G.MyTabLine()
  local s = ""
  local tab_count = vim.fn.tabpagenr("$")

  for tab = 1, tab_count do
    local win = vim.fn.tabpagewinnr(tab)
    local buflist = vim.fn.tabpagebuflist(tab)
    local bufnr = buflist[win]
    local bufname = vim.fn.bufname(bufnr)
    local filename = vim.fn.fnamemodify(bufname, ":t")

    if filename == "" then
      filename = "[No Name]"
    end

    local hl = (tab == vim.fn.tabpagenr()) and "%#TabLineSel#" or "%#TabLine#"
    s = s .. string.format("%%%dT%s  %s  ", tab, hl, filename)

    -- Add separator between tabs (except after the last one)
    if tab < tab_count then
      s = s .. "%#TabLineFill#│"
    end
  end

  s = s .. "%#TabLineFill#"
  return s
end

-- Neovide configuration moved to lua/config/neovide.lua
if vim.g.neovide then
  require("config.neovide")
end

-- vim.g.editorconfig = false
-- vim.o.mousemoveevent = true
--
-- vim.cmd("let g:netrw_liststyle = 3")
-- vim.cmd("filetype plugin indent on") -- Enable all filetype plugins
--
-- vim.o.mouse = "a"
-- vim.o.breakindent = true -- Indent wrapped lines to match line start
-- vim.o.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
-- vim.o.number = true -- Show line numbers
--
-- vim.o.splitbelow = true -- Horizontal splits will be below
-- vim.o.splitright = true -- Vertical splits will be to the right
--
-- vim.o.ruler = false -- Don't show cursor position in command line
-- vim.o.showmode = false -- Don't show mode in command line
-- vim.o.wrap = false -- Display long lines as just one line
--
-- vim.o.signcolumn = "yes" -- Always show sign column (otherwise it will shift text)
-- vim.o.fillchars = "eob: " -- Don't show `~` outside of buffer
--
-- -- Editing
-- vim.o.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
-- vim.o.incsearch = true -- Show search results while typing
-- vim.o.infercase = true -- Infer letter cases for a richer built-in keyword completion
-- vim.o.smartcase = true -- Don't ignore case when searching if pattern has upper case
-- vim.o.smartindent = true -- Make indenting smart
--
-- vim.o.completeopt = "menuone,noinsert,noselect" -- Customize completions
-- vim.o.virtualedit = "block" -- Allow going past the end of line in visual block mode
--
-- -- tabs & indentation
-- vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
-- vim.opt.shiftwidth = 0 -- 2 spaces for indent width
-- vim.opt.expandtab = true -- expand tab to spaces
-- vim.opt.autoindent = true -- copy indent from current line when starting new one
--
-- -- turn on termguicolors for tokyonight colorscheme to work
-- -- (have to use iterm2 or any other true color terminal)
-- vim.opt.termguicolors = true
-- vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
-- vim.opt.shortmess:append("Wc") -- Reduce command line messages
--
-- -- backspace
-- vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
--
-- -- clipboard
-- vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
--
-- -- turn off swapfile
-- vim.opt.swapfile = false
--
-- -- Save undo history
-- vim.opt.undofile = true
--
-- -- Decrease update time
-- vim.opt.updatetime = 250
--
-- -- Decrease mapped sequence wait time
-- -- Displays which-key popup sooner
-- vim.opt.timeoutlen = 300
--
-- -- Show which line your cursor is on
-- vim.opt.cursorline = true
--
-- -- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 5
--
-- -- Sets how neovim will display certain whitespace characters in the editor.
-- --  See `:help 'list'`
-- --  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
--
-- -- Preview substitutions live, as you type!
-- vim.opt.inccommand = "split"
-- --
-- -- Set highlight on search, but clear on pressing <Esc> in normal mode
-- vim.opt.hlsearch = true
--
-- -- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])
--
-- -- vim.o.sessionoptions = "buffers,curdir,help,globals,folds,winsize,winpos,terminal,localoptions"
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
--
-- -- For Windows
-- if jit.os == "Windows" then
--   -- powershell
--   vim.opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
--   vim.opt.shellcmdflag =
--     "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
--   vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
--   vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
--   vim.opt.shellquote = ""
--   vim.opt.shellxquote = ""
-- end
