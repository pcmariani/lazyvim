-- local custom_moonfly = require("lualine.themes.moonfly")
-- custom_moonfly.normal.a.bg = "#ff0000"

local icons = LazyVim.config.icons

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      -- theme = custom_moonfly,
      theme = "pete_lualine",
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
        -- { LazyVim.lualine.pretty_path() },
        {
          "filename",
          path = 1, -- 0 = just name, 1 = relative, 2 = absolute
          symbols = {
            modified = "[+]",
            -- readonly = " 🔒",
            -- unnamed = "[No Name]",
            -- newfile = " ✱",
          },
        },
      },
      lualine_z = { "" },
    },
  },
}
