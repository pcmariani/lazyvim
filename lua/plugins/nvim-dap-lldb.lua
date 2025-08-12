-- return {
--   "julianolf/nvim-dap-lldb",
--   dependencies = { "mfussenegger/nvim-dap" },
--   opts = {
--     -- codelldb_path = "/path/to/codelldb"
--     configurations = {
--       c = {
--         {
--           name = "Launch debugger",
--           type = "lldb",
--           request = "launch",
--           -- cwd = "${workspaceFolder}",
--           cwd = vim.fn.getcwd(),
--           program = function()
--             -- Build with debug symbols
--             local out = vim.fn.system({ "make", "debug" })
--             -- Check for errors
--             if vim.v.shell_error ~= 0 then
--               vim.notify(out, vim.log.levels.ERROR)
--               return nil
--             end
--             -- Return path to the debuggable program
--             -- return vim.fn.getcwd() .. "/build/my_program"
--             return vim.fn.expand("%:r")
--           end,
--           stopOnEntry = false,
--           args = {},
--           runInTerminal = false,
--         },
--       },
--     },
--   },
-- }

return {
  "julianolf/nvim-dap-lldb",
  dependencies = { "mfussenegger/nvim-dap" },
  enabled = false,
  opts = {
    -- configurations = {
    --   c = {
    --     name = "Launch debugger",
    --     type = "lldb",
    --     request = "launch",
    --     cwd = vim.fn.getcwd(),
    --     program = function()
    --       -- Compile current file with debug symbols
    --       local src = vim.fn.expand("%")
    --       local out_bin = vim.fn.expand("%:r")
    --       local compile_cmd = { "gcc", "-g", src, "-o", out_bin }
    --       local result = vim.fn.system(compile_cmd)
    --
    --       if vim.v.shell_error ~= 0 then
    --         vim.notify(result, vim.log.levels.ERROR)
    --         return nil
    --       end
    --
    --       return out_bin
    --     end,
    --   },
    -- },
  },
}
