local M = {}

-- Variable to store user input
local user_input = ""

function M.get_user_input()
  local files = vim.fn.glob(vim.fn.getcwd() .. "/*", true, true)
  -- print(files)
  -- print(require("pl.pretty").dump(files))
  a = vim.ui.input({ prompt = "Enter something!!!: ", completion = "file" }, function(input)
    print(input)
  end)
  -- user_input = vim.fn.input("Enter something: ", "", vim.fn.glob(vim.fn.getcwd() .. "/*", true, true))
end

function M.send_to_terminal()
  if user_input ~= "" then
    vim.fn.termopen("echo " .. user_input)
  else
    print("No input to send to the terminal.")
  end
end

function M.complete_file(arg_lead, cmd_line, cursor_pos)
  local files = vim.fn.glob(vim.fn.getcwd() .. "/*", true, true)
  return vim.fn.matcharg(files, arg_lead)
end

return M
