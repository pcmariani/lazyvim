-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.relativenumber = false
vim.opt.showtabline = 1
vim.o.tabline = "%!v:lua.MyTabLine()"
vim.o.cursorline = false
vim.opt.equalalways = false
-- vim.o.winborder = "rounded"

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

vim.opt.guifont = "Iosevka Nerd Font:h16"

if vim.g.neovide then
  --
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.1)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.1)
  end)

  -- ### Controls the space between the window border and the actual Neovim, which is filled with the background color instead.
  -- vim.g.neovide_padding_top = 0
  -- vim.g.neovide_padding_bottom = 0
  -- vim.g.neovide_padding_right = 0
  -- vim.g.neovide_padding_left = 0

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  end
  -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
  -- vim.g.neovide_opacity = 0.0
  -- vim.g.transparency = 0.8
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()

  -- ### transparency
  -- local alpha = function()
  --   return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  -- end
  -- ### note that g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- ### Setting g:neovide_transparency to a value between 0.0 and 1.0 will set the opacity of the window to that value.
  -- vim.g.neovide_transparency = 0.0
  -- vim.g.neovide_opacity = 0.0
  -- vim.g.transparency = 1
  -- ### Setting g:neovide_background_color to a value that can be parsed by csscolorparser-rs will set the color of the whole window to that value.
  -- vim.g.neovide_background_color = "#000000" .. alpha()
  -- vim.g.neovide_background_color = "#13141a"

  -- ### blur
  -- vim.g.neovide_floating_blur_amount_x = 2.0
  -- vim.g.neovide_floating_blur_amount_y = 2.0

  -- ### scroll
  -- vim.g.neovide_scroll_animation_length = 0.3

  -- ### general
  --Set the background option when Neovide starts. Possible values: light, dark, auto. On systems that support it, auto will mirror the system theme, and will update background when the system theme changes.
  -- vim.g.neovide_theme = "dark" -- light, dark, auto
  -- vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true
  -- ### Interprets Alt + whatever actually as <M-whatever>, instead of sending the actual special character to Neovim.
  vim.g.neovide_input_macos_alt_is_meta = false
  -- ### Setting g:neovide_cursor_animation_length determines the time it takes for the cursor to complete it's animation in seconds. Set to 0 to disable.

  -- ### cursor
  -- vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.1
  -- vim.g.neovide_cursor_antialiasing = true
  -- vim.g.neovide_cursor_animate_in_insert_mode = true
  -- vim.g.neovide_cursor_animate_command_line = true
  -- ### Specify cursor outline width in ems. You probably want this to be a positive value less than 0.5. If the value is <=0 then the cursor will be invisible. This setting takes effect when the editor window is unfocused, at which time a block cursor will be rendered as an outline instead of as a full rectangle.
  -- vim.g.neovide_cursor_unfocused_outline_width = 0.125
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
