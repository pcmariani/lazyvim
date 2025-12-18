vim.api.nvim_create_augroup("CustomHighlight", { clear = true })

local light_themes = {
  "github_light",
  "github_light_colorblind",
  "github_light_default",
  "github_light_high_contrast",
  "github_light_tritanopia",
  "tokyonight-day",
  "catppuccin-latte",
}

vim.api.nvim_create_autocmd("ColorScheme", {
  group = "CustomHighlight",
  pattern = light_themes,
  callback = function()
    vim.g.theme_type = "light"
    vim.api.nvim_set_hl(0, "Normal", { bg = "#f7f9fa" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#f7f9fa" })
    vim.api.nvim_set_hl(0, "NormalSB", { bg = "#f7f9fa" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#f7f9fa" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#f7f9fa" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#f7f9fa" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#b0b0b0" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#ffffff" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#6688cc", bg = "#f6f7f0" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#f6f7f0" })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#f7f7f7" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#f4f4f4" })
    vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#f4f4f4" })
    vim.api.nvim_set_hl(0, "Search", { bg = "#e4f8f8" })
    vim.api.nvim_set_hl(0, "CurSearch", { bg = "#c4f8f8" })
  end,
})

-- stylua: ignore
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "CustomHighlight",
  callback = function(args)
    local name = args.match
    if not vim.tbl_contains(light_themes, name) then
      vim.g.theme_type = "dark"
      -- vim.api.nvim_set_hl(0, "Normal"                    , { bg = "none"   , fg = "#c0c0c0" })
      vim.api.nvim_set_hl(0, "Normal"                          , { bg = "none"    , fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, "NormalNC"                        , { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalSB"                        , { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat"                     , { bg = "none" })
      vim.api.nvim_set_hl(0, "TroubleNormal"                   , { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeNormal"                   , { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC"                 , { bg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer"                     , { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder"                     , { bg = "none"   , fg = "#505060" })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder"              , { bg = "none"   , fg = "#505060" })
      vim.api.nvim_set_hl(0, "StatusLine"                      , { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineTerm"                  , { bg = "none" })
      vim.api.nvim_set_hl(0, "Pmenu"                           , { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator"             , { bg = "none"   , fg = "#505a60" })
      vim.api.nvim_set_hl(0, "TabLineFill"                     , { bg = "none"   , fg = "#2c2c2c" })
      vim.api.nvim_set_hl(0, "TabLine"                         , { bg = "none"   , fg = "#606060" })
      vim.api.nvim_set_hl(0, "TabLineSel"                      , { bg = "#1a1a1a", fg = "#74b2ff", italic = true })
      vim.api.nvim_set_hl(0, "LineNr"                          , { fg = "#404040" })
      vim.api.nvim_set_hl(0, "WinSeparator"                    , { fg = "#404667" })
      vim.api.nvim_set_hl(0, "Comment"                         , { fg = "#505050" })
      vim.api.nvim_set_hl(0, "CursorLineNr"                    , { bg = "#10130f", fg = "#8cc85f" })
      vim.api.nvim_set_hl(0, "CursorLine"                      , { bg = "#232300" })
      vim.api.nvim_set_hl(0, "QuickFixLine"                    , { bg = "#202020" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn"       , { fg = "#555540" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError"      , { fg = "#664444" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint"       , { fg = "#51807e" })
      vim.api.nvim_set_hl(0, "LspReferenceRead"                , { bg = "#2b2b2b" })
      vim.api.nvim_set_hl(0, "LspReferenceWrite"               , { bg = "#2b2b2b" })
      vim.api.nvim_set_hl(0, "LspReferenceText"                , { bg = "#2b2b2b" })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline"  , { fg = "#405070" })
    end
  end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = "CustomHighlight",
--   pattern = {
--     "github_dark*",
--   },
--   callback = function()
--     vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "none" })
--   end,
-- })

return {
  { "bluz71/vim-moonfly-colors" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "moonfly",
      -- colorscheme = "tokyonight",
      -- colorscheme = "github_dark_default",
      -- colorscheme = "vague",
    },
  },
}

-- local dark_themes = {
--   "moonfly",
--   "tokyonight",
--   "tokyonight-moon",
--   "tokyonight-night",
--   "tokyonight-storm",
--   "catppuccin",
--   "catppuccin-mocha",
--   "catppuccin-frappe",
--   "catppuccin-macchiato",
--   "github_dark*",
--   "default",
--   "habamax",
--   "lunaperche",
--   "slate",
--   "sorbet",
--   "vague",
--   "elflord",
--   "minicyan",
--   "minischeme",
-- }

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "snacks_terminal",
--   callback = function()
--     vim.cmd("setlocal winhighlight=Normal:NormalFloat")
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     -- vim.cmd("hi NormalFloat guibg=#0f0f0f")
--   end,
-- })
