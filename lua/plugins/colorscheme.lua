local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
    -- vim.api.nvim_set_hl(0, "Normal", { fg = "#dddddd", bg = "#12141a", bold = true })
    vim.api.nvim_set_hl(0, "Normal", { fg = "#dddddd", bg = "#12141a", bold = true })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#585858" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#404040" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8cc85f", bg = "#1c1d23" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1d23" })
    vim.api.nvim_set_hl(0, "MoonFlyWhite", { fg = "#cfcfcf" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#405090" })
    vim.api.nvim_set_hl(0, "AvanteSidebarNormal", { bg = "#1b1b1b" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#555540" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#664444" })
    -- transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8cc85f", bg = "#10130f" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#000910" })
    vim.api.nvim_set_hl(0, "WinSeparator", { link = "MoonFlyGrey23" })
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#74b2ff", bg = "#1a1a1a", italic = true })
    vim.api.nvim_set_hl(0, "TabLine", { fg = "#606060", bg = "none" })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#2c2c2c" })
  end,
  group = custom_highlight,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_terminal",
  callback = function()
    vim.cmd("setlocal winhighlight=Normal:NormalFloat")
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.cmd("hi NormalFloat guibg=#0f0f0f")
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
