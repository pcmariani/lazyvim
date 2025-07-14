local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { fg = "#dddddd", bg = "#13141a", bold = true })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#585858" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#404040" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8cc85f", bg = "#1c1d23" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1d23" })
    vim.api.nvim_set_hl(0, "MoonFlyWhite", { fg = "#cfcfcf" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#204080" })
    vim.api.nvim_set_hl(0, "AvanteSidebarNormal", { bg = "#1b1b1b" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#555540" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#664444" })
  end,
  group = custom_highlight,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_terminal",
  callback = function()
    vim.cmd("setlocal winhighlight=Normal:NormalFloat")
    vim.cmd("hi NormalFloat guibg=#030008")
  end,
})

return {
  { "bluz71/vim-moonfly-colors" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },
}
