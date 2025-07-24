return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    dashboard = { enabled = false },
    terminal = {
      win = {
        wo = {
          winbar = "",
        },
      },
    },
  },
  keys = {
    {
      "<leader>ot",
      function()
        Snacks.terminal(nil, { win = { position = "left" } })
      end,
      { silent = true, desc = "Terminal Left" },
    },
    {
      "<leader>oo",
      function()
        Snacks.terminal(nil, { win = { position = "right" } })
      end,
      { silent = true, desc = "Terminal Right" },
    },
    { "<leader><C-space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
  },
}
