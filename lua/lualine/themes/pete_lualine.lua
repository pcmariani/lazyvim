-- moonfly color scheme for lualine
--
-- URL:     github.com/bluz71/vim-moonfly-colors
-- License: MIT (https://opensource.org/licenses/MIT)

-- stylua: ignore
local colors = {
  color0   = '#0f0f0f',
  color1   = '#ff5189',
  color2   = '#c6c6c6',
  color3   = '#303030',
  color6   = '#9e9e9e',
  color7   = '#3EFFDC',
  color8   = '#ae81ff',
  color9   = '#111111',
}

return {
  replace = {
    a = { fg = colors.color0, bg = colors.color1, gui = "bold" },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  inactive = {
    a = { fg = colors.color6, bg = colors.color3, gui = "bold" },
    b = { fg = colors.color6, bg = colors.color3 },
    c = { fg = colors.color6, bg = colors.color3 },
  },
  normal = {
    a = { fg = colors.color7, bg = colors.color0, gui = "bold" },
    b = { fg = colors.color2, bg = colors.color0 },
    c = { fg = colors.color2, bg = colors.color0 },
  },
  visual = {
    a = { fg = colors.color8, bg = colors.color0, gui = "bold" },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  insert = {
    a = { fg = colors.color2, bg = colors.color0, gui = "bold" },
    b = { fg = colors.color2, bg = colors.color0 },
  },
}
