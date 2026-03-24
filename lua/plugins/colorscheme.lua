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

-- stylua: ignore
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "CustomHighlight",
  pattern = light_themes,
  callback = function()
    local normal_bg = "#f7f9fa"
    vim.g.theme_type = "light"
    vim.api.nvim_set_hl(0, "Normal"           , { bg = normal_bg })
    vim.api.nvim_set_hl(0, "NormalNC"         , { bg = normal_bg })
    vim.api.nvim_set_hl(0, "NormalSB"         , { bg = normal_bg })
    vim.api.nvim_set_hl(0, "NormalFloat"      , { bg = normal_bg })
    vim.api.nvim_set_hl(0, "NeoTreeNormal"    , { bg = normal_bg })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC"  , { bg = normal_bg })
    vim.api.nvim_set_hl(0, "Comment"          , { fg = "#b0b0b0" })
    vim.api.nvim_set_hl(0, "WinSeparator"     , { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "LineNr"           , { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "StatusLine"       , { bg = "#ffffff" })
    vim.api.nvim_set_hl(0, "CursorLineNr"     , { fg = "#6688cc", bg = "#f6f7f0" })
    vim.api.nvim_set_hl(0, "CursorLine"       , { bg = "#f6f7f0" })
    vim.api.nvim_set_hl(0, "LspReferenceRead" , { bg = "#f7f7f7" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#f4f4f4" })
    vim.api.nvim_set_hl(0, "LspReferenceText" , { bg = "#f4f4f4" })
    vim.api.nvim_set_hl(0, "Search"           , { bg = "#e4f8f8" })
    vim.api.nvim_set_hl(0, "CurSearch"        , { bg = "#c4f8f8" })
  end,
})

-- stylua: ignore
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "CustomHighlight",
  callback = function(args)
    local name = args.match
    if not vim.tbl_contains(light_themes, name) then
      vim.g.theme_type = "dark"
      local normal_bg = "none"
      local border_fg = "#505060"
      local winSep_fg = "#404667"
      if vim.g.neovide then
        normal_bg = "#0c1017"
        winSep_fg = "#282838"
        vim.api.nvim_set_hl(0, "Cursor", { fg = "#101015", bg = "#a6e3a1" }) -- normal (green)
      end
      vim.api.nvim_set_hl(0, "Normal"                           , { bg = normal_bg, fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, "NormalNC"                         , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "NormalSB"                         , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "NormalFloat"                      , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "TroubleNormal"                    , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "NeoTreeNormal"                    , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC"                  , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "EndOfBuffer"                      , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "FloatBorder"                      , { bg = normal_bg, fg = border_fg })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder"               , { bg = normal_bg, fg = border_fg })
      vim.api.nvim_set_hl(0, "StatusLine"                       , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "StatusLineTerm"                   , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "Pmenu"                            , { bg = normal_bg                 })
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator"              , { bg = normal_bg, fg = "#505a60" })
      vim.api.nvim_set_hl(0, "TabLineFill"                      , { bg = normal_bg, fg = "#2c2c2c" })
      vim.api.nvim_set_hl(0, "TabLine"                          , { bg = normal_bg, fg = "#606060" })
      vim.api.nvim_set_hl(0, "TabLineSel"                       , { bg = "#1a1a1a", fg = "#74b2ff", italic = true })
      vim.api.nvim_set_hl(0, "LineNr"                           , { fg = "#404040"                 })
      vim.api.nvim_set_hl(0, "WinSeparator"                     , { fg = winSep_fg                 })
      vim.api.nvim_set_hl(0, "Comment"                          , { fg = "#505050"                 })
      vim.api.nvim_set_hl(0, "CursorLineNr"                     , { bg = "#10130f", fg = "#8cc85f" })
      vim.api.nvim_set_hl(0, "CursorLine"                       , { bg = "#232300"                 })
      vim.api.nvim_set_hl(0, "QuickFixLine"                     , { bg = "#202020"                 })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn"        , { fg = "#555540"                 })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError"       , { fg = "#664444"                 })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint"        , { fg = "#51807e"                 })
      vim.api.nvim_set_hl(0, "LspReferenceRead"                 , { bg = "#2b2b2b"                 })
      vim.api.nvim_set_hl(0, "LspReferenceWrite"                , { bg = "#2b2b2b"                 })
      vim.api.nvim_set_hl(0, "LspReferenceText"                 , { bg = "#2b2b2b"                 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline"   , { fg = border_fg                 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder"          , { fg = border_fg                 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch"    , { fg = border_fg                 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline"   , { fg = border_fg                 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput"     , { fg = border_fg                 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderFilter"    , { fg = border_fg                 })
      vim.api.nvim_set_hl(0, "NoiceCmalinePopupBorderCalculator", { fg = border_fg                 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSendToTerm", { fg = border_fg                 })
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
      -- colorscheme = "gruber-darker",
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
