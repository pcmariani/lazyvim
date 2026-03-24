return {
  "akinsho/bufferline.nvim",
  enabled = function()
    return vim.g.neovide == true
  end,
  opts = {
    options = {
      separator_style = "slant",
      always_show_bufferline = true,
      -- diagnostics = "nvim_lsp",
    },
  },
}
