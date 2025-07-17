vim.api.nvim_create_user_command("SendToTerm", function(opts)
  local funcs = require("myStuff.myFuncs")
  local cwd = vim.fn.getcwd()

  if #opts.fargs > 0 then
    vim.g.termCommand = table.concat(opts.fargs, " ")
    funcs.save_term_command(cwd, vim.g.termCommand)
  elseif vim.g.termCommand == nil then
    vim.g.termCommand = funcs.load_term_command(cwd)
  end

  if vim.g.termCommand ~= nil then
    vim.cmd("w")
    funcs.terminal_send(vim.g.termCommand .. "\n")
  else
    vim.fn.feedkeys(":SendToTerm ", "nt")
  end
end, {
  nargs = "*",
  complete = "file",
})

vim.api.nvim_create_user_command("SaveTermCommand", function()
  local funcs = require("myStuff.myFuncs")
  local last_command = funcs.get_last_zsh_command()
  if last_command then
    vim.g.termCommand = funcs.get_last_zsh_command()
    print("Term Command set to " .. last_command)
  else
    print("No command found")
  end
end, {})
