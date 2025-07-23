return {
  "folke/which-key.nvim",
  opts = {
    preset = "classic",
    -- preset = "modern",
    spec = {
      { mode = { "n", "v" }, { "<leader>a", group = "avante" } },
      { mode = { "n", "v" }, { "<leader>o", group = "open" } },
      { mode = { "n", "v" }, { "<leader>ot", group = "terminal" } },
      { mode = { "n", "v" }, { "<leader>t", group = "toggle" } },
    },
  },
}
