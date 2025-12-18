local M = {}

function M.search_to_qf(bang)
  -- If cwd is $HOME or bang, target %
  local target = (vim.fn.getcwd() == os.getenv("HOME") or bang) and "%" or "**/*"
  -- Construct the vimgrep command
  local search_pattern = vim.fn.escape(vim.fn.getreg("/"), "/")
  local cmd = "silent vimgrep! /\\C" .. search_pattern .. "/jg " .. target
  -- Execute the command, open the quickfix window, switch back to the previous window
  vim.cmd(cmd)
  vim.cmd("copen")
  vim.cmd("wincmd p")
end

function M.ToggleRainbow()
  -- Use vim.b to access buffer-local variables
  vim.b.rainbow_aligned = vim.b.rainbow_aligned or 0

  if vim.b.rainbow_aligned == 0 then
    vim.cmd("RainbowAlign")
    vim.b.rainbow_aligned = 1
  else
    vim.cmd("RainbowShrink")
    vim.b.rainbow_aligned = 0
  end
end

function M.toggleLeftColumns(bang)
  if not bang then
    if vim.o.signcolumn == "yes" then
      vim.o.signcolumn = "no"
      vim.o.numberwidth = 1
      vim.o.number = false
    else
      vim.o.signcolumn = "yes"
      vim.o.numberwidth = 4
      vim.o.number = true
    end
  else
    local toggle_off = vim.wo.signcolumn == "yes"

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local buftype = vim.api.nvim_get_option_value("buftype", { scope = "local", buf = buf })
      local is_floating = vim.api.nvim_win_get_config(win).relative ~= ""

      if vim.api.nvim_win_is_valid(win) and not is_floating and buftype == "" then
        vim.api.nvim_win_call(win, function()
          if toggle_off then
            vim.wo.signcolumn = "no"
            vim.wo.numberwidth = 1
            vim.wo.number = false
          else
            vim.wo.signcolumn = "yes"
            vim.wo.numberwidth = 4
            vim.wo.number = true
          end
        end)
      end
    end
  end
end

function M.toggle_status_bars()
  -- local status = vim.fn.system("tmux show -v status"):gsub("%s+", "")
  -- local new_status = (status == "on") and "off" or "on"
  -- vim.fn.system("tmux set status " .. new_status)

  if vim.o.laststatus == 0 then
    vim.o.laststatus = 3
    vim.fn.system("tmux set status on")
  else
    vim.o.laststatus = 0
    vim.fn.system("tmux set status off")
  end
end

function M.SearchVisibleWindowsToQuickFix()
  local search_term = vim.fn.input("Search all windows for: ")
  if search_term == "" then
    return
  end

  local qf_items = {}
  local wins = vim.api.nvim_tabpage_list_wins(0)

  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)

    -- Skip unlisted or special buffers
    if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "" then
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

      for lnum, line in ipairs(lines) do
        local col = string.find(line, search_term)
        if col then
          table.insert(qf_items, {
            filename = bufname ~= "" and bufname or "[No Name]",
            lnum = lnum,
            col = col,
            text = line,
          })
        end
      end
    end

    if #qf_items == 0 then
      print("No matches found for: " .. search_term)
    else
      vim.fn.setqflist(qf_items, "r")
      vim.cmd("copen")
      print("Found " .. #qf_items .. " matches for: " .. search_term)
    end
  end
end

return M
