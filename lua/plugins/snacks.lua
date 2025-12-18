local pre_number, pre_signcolumn, pre_tmux_statusbar

return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    dashboard = { enabled = false },
    zen = {
      toggles = {
        dim = false,
      },
      on_open = function()
        pre_number = vim.wo.number
        pre_signcolumn = vim.wo.signcolumn
        pre_tmux_statusbar = vim.fn.system("tmux show -v status"):gsub("%s+", "")
        vim.fn.system("tmux set status off")
        vim.wo.number = false
        vim.wo.signcolumn = "no"
      end,
      on_close = function()
        vim.wo.number = pre_number
        vim.wo.signcolumn = pre_signcolumn
        vim.fn.system("tmux set status " .. pre_tmux_statusbar)
      end,
    },
    terminal = {
      win = {
        wo = {
          winbar = "",
        },
      },
    },
    -- styles = {
    --   float = {
    --     border = "rounded",
    --   },
    -- },
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
