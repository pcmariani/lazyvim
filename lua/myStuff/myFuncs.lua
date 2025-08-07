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

return M
