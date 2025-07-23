local icons = LazyVim.config.icons

local colors = {
  color0 = "#0f0f0f",
  color1 = "#ff5189",
  color2 = "#c6c6c6",
  color3 = "#303030",
  color6 = "#9e9e9e",
  color7 = "#3EFFDC",
  color8 = "#ae81ff",
  color9 = "#111111",
}

local my_theme = {
  replace = {
    a = { fg = colors.color0, gui = "bold" },
    b = { fg = colors.color2 },
  },
  inactive = {
    a = { fg = colors.color6, gui = "bold" },
    b = { fg = colors.color6 },
    c = { fg = colors.color6 },
  },
  normal = {
    a = { fg = colors.color7, gui = "bold" },
    b = { fg = colors.color2 },
    c = { fg = colors.color2 },
  },
  visual = {
    a = { fg = colors.color8, gui = "bold" },
    b = { fg = colors.color2 },
  },
  insert = {
    a = { fg = colors.color2, gui = "bold" },
    b = { fg = colors.color2 },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      -- theme = custom_moonfly,
      theme = my_theme,
      component_separators = { left = " ", right = " " },
      section_separators = { left = " ", right = " " },
    },
    sections = {
      lualine_a = { "%{toupper(mode())} " },
      lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        {
          function()
            local buftype = vim.bo.buftype
            if buftype == "terminal" then
              return "~terminal~"
            end

            local filename = vim.fn.expand("%:.") or "[No Name]"
            local home = vim.env.HOME
            if filename:sub(1, #home) == home then
              filename = "~" .. filename:sub(#home + 1)
            end

            local modified = vim.bo.modified
            local readonly = vim.bo.readonly
            local newfile = (filename == "") and vim.bo.modified

            local symbol = ""
            if modified then
              symbol = " +"
            elseif readonly then
              symbol = " 🔒"
            elseif newfile then
              symbol = " ✱"
            end
            return filename .. symbol
          end,
        },
      },
      lualine_z = { "" },
    },
  },
}
