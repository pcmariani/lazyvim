-- local Terminal = require("toggleterm.terminal").Terminal
-- local clearTerm = Terminal:new({ cmd = "clear", hidden = true })
--
-- function _clearTerm_toggle()
--   clearTerm:toggle()
-- end
--
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      {
        "<leader>t",
        "<cmd>ToggleTerm direction='vertical' size=80 <cr>",
        -- "<cmd>lua _clearTerm_toggle()<cr>",
        desc = "ToggleTerm",
      },
    },
    opts = {
      autochdir = false,
    },
  },
}
