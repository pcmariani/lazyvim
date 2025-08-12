vim.api.nvim_create_augroup("CustomHighlight", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = "CustomHighlight",
  pattern = {
    "github_light*",
    "tokyonight-day",
    "catppuccin-frappe",
  },
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#ffffff" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#b0b0b0" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#ffffff" })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#f7f7f7" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#f4f4f4" })
    vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#f4f4f4" })
    vim.api.nvim_set_hl(0, "Search", { bg = "#e4f8f8" })
    vim.api.nvim_set_hl(0, "CurSearch", { bg = "#c4f8f8" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#6688cc", bg = "#f6f7f0" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#f6f7f0" })
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = "CustomHighlight",
  pattern = {
    "moonfly",
    "tokyonight",
    "tokyonight-moon",
    "catppuccin",
    "catppuccin-mocha",
    "catppuccin-frappe",
    "catppuccin-frappe",
    "catppuccin-macchiato",
    "github_dark*",
    "default",
    "habamax",
    "lunaperche",
    "slate",
    "sorbet",
  },
  callback = function()
    -- vim.api.nvim_set_hl(0, "MoonFlyWhite", { fg = "#cfcfcf" })
    -- vim.api.nvim_set_hl(0, "AvanteSidebarNormal", { bg = "#1b1b1b" })
    -- transparent background
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#2c2c2c" })
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#74b2ff", bg = "#1a1a1a", italic = true })
    vim.api.nvim_set_hl(0, "TabLine", { fg = "#606060", bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#404040" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#404040" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#585858" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8cc85f", bg = "#10130f" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#000910" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#555540" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#664444" })
  end,
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
      -- colorscheme = "moonfly",
      colorscheme = "catppuccin-frappe",
      -- colorscheme = "tokyonight",
    },
  },
}
