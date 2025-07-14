vim.api.nvim_create_user_command("SendToTerm", function(opts)
  local funcs = require("config.funcs")

  if #opts.fargs > 0 then
    vim.g.termCommand = table.concat(opts.fargs, " ")
  end
  if vim.g.termCommand ~= nil then
    vim.cmd("w")
    funcs.terminal_send(vim.g.termCommand .. "\n")
    -- vim.cmd('w | TermExec cmd="' .. vim.g.termCommand .. '"')
  else
    vim.fn.feedkeys(":SendToTerm ", "nt")
  end
end, {
  nargs = "*",
  complete = "file",
})
