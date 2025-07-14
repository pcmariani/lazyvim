local M = {}

function M.testMyModule()
  print("MY MODULE WORKS!!")
end

-- SEND TO TERM {{{
local hash_fn = function(str)
  return vim.fn.sha256(str):sub(1, 16) -- truncate for shorter filenames
end

local function storage_path()
  return vim.fn.stdpath("data") .. "/term_commands/"
end

local function get_first_terminal()
  local terminal_chans = {}

  for _, chan in pairs(vim.api.nvim_list_chans()) do
    if chan["mode"] == "terminal" and chan["pty"] ~= "" then
      table.insert(terminal_chans, chan)
    end
  end

  table.sort(terminal_chans, function(left, right)
    return left["buffer"] < right["buffer"]
  end)

  return terminal_chans[1]["id"]
end

function M.terminal_send(text)
  local first_terminal_chan = get_first_terminal()

  vim.api.nvim_chan_send(first_terminal_chan, text)
end

function M.save_term_command(cwd, command)
  local dir = storage_path()
  vim.fn.mkdir(dir, "p")

  local hash = hash_fn(cwd)
  local path = dir .. hash .. ".json"

  local data = {
    cwd = cwd,
    command = command,
  }

  local json = vim.fn.json_encode(data)
  local f = io.open(path, "w")
  if f then
    f:write(json)
    f:close()
  end
end

function M.load_term_command(cwd)
  local hash = hash_fn(cwd)
  local path = storage_path() .. hash .. ".json"

  local f = io.open(path, "r")
  if not f then
    return nil
  end

  local contents = f:read("*a")
  f:close()

  local ok, data = pcall(vim.fn.json_decode, contents)
  if ok and data and data.cwd == cwd then
    return data.command
  end
  return nil
end
-- }}} END SEND TO TERM

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

return M
