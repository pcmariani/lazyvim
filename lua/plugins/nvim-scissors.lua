return {
  "chrisgrieser/nvim-scissors",
  enabled = false,
  dependencies = { "nvim-telescope/telescope.nvim", "garymjr/nvim-snippets" },
  opts = {
    snippetDir = vim.fn.stdpath("config") .. "/snippets",
  },
}
