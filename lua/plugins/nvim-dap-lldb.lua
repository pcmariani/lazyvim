return {
  "julianolf/nvim-dap-lldb",
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    -- codelldb_path = "/path/to/codelldb"
    configurations = {
      c = {
        name = "Launch debugger",
        type = "lldb",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = function()
          -- Build with debug symbols
          local out = vim.fn.system({ "make", "debug" })
          -- Check for errors
          if vim.v.shell_error ~= 0 then
            vim.notify(out, vim.log.levels.ERROR)
            return nil
          end
          -- Return path to the debuggable program
          return vim.fn.getcwd() .. "/build/my_program"
        end,
      },
    },
  },
}
