local icons = LazyVim.config.icons

local colors = {
  almostBlack = "#0f0f0f",
  tackyPink = "#ff00ff",
  tackyYellow = "#ffff00",
  tackyCyan = "#3EFFDC",
  grey = "#707070",
  scarlet = "#ff5189",
  blue = "#74c7ec",
  green = "#a6e3a1",
}

local styles = {
  fg = {
    root_dir = colors.blue,
    -- z = colors.green,
    z = colors.blue,
  },
  gui = {
    root_dir = "italic",
    a = "bold",
    b = "italic",
    c = "italic",
    x = "italic",
    z = "italic",
  },
}

local my_theme = {
  normal = {
    a = { fg = colors.tackyCyan, gui = styles.gui.a },
    b = { fg = colors.grey, gui = styles.gui.b },
    c = { fg = colors.scarlet, gui = styles.gui.c },
    x = { fg = colors.grey, gui = styles.gui.x },
    y = { fg = colors.scarlet },
    z = { fg = styles.fg.z, gui = styles.gui.z },
  },
  visual = {
    a = { fg = colors.tackyPink, gui = styles.gui.a },
    z = { fg = styles.fg.z, gui = styles.gui.z },
  },
  insert = {
    a = { fg = colors.tackyYellow, gui = styles.gui.a },
    z = { fg = styles.fg.z, gui = styles.gui.z },
  },
}

local my_light_theme = {
  normal = {
    a = { fg = colors.almostBlack, gui = styles.gui.a },
    b = { fg = colors.grey, gui = styles.gui.b },
    c = { fg = colors.scarlet, gui = styles.gui.c },
    x = { fg = colors.grey, gui = styles.gui.x },
    y = { fg = colors.scarlet },
    z = { fg = styles.fg.z, gui = styles.gui.z },
  },
  visual = {
    a = { fg = colors.tackyPink, gui = styles.gui.a },
    z = { fg = styles.fg.z, gui = styles.gui.z },
  },
  insert = {
    a = { fg = colors.tackyYellow, gui = styles.gui.a },
    z = { fg = styles.fg.z, gui = styles.gui.z },
  },
}

local function buffer_name()
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
end

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
      lualine_a = {
        { "%{toupper(mode())} ", padding = { left = 2 } },
      },
      lualine_b = {
        { "branch", padding = { left = 2, right = 2 } },
      },
      lualine_c = {
        LazyVim.lualine.root_dir({ icon = "", color = { fg = styles.fg.root_dir, gui = styles.gui.root_dir } }),
        -- {
        --   "filetype",
        --   icon_only = true,
        --   separator = "",
        --   padding = { left = 1, right = 0 },
        -- },
        { buffer_name, padding = { left = 1, right = 1 } },

        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      },

      lualine_x = {
        -- Snacks.profiler.status(),
        -- stylua: ignore
        -- {
        --   function() return require("noice").api.status.command.get() end,
        --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
        --   color = function() return { fg = Snacks.util.color("Statement") } end,
        -- },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = function() return { fg = Snacks.util.color("Constant") } end,
        },
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = function() return { fg = Snacks.util.color("Debug") } end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return { fg = Snacks.util.color("Special") } end,
        },
        {

          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
          padding = { left = 2, right = 2 },
        },
        { "filetype", icons_enabled = false, padding = { right = 2 } },
      },

      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 1 } },
        { "location", padding = { left = 1, right = 1 } },
      },

      lualine_z = {
        {
          function()
            --   return " " .. os.date("%R")
            return vim.g.tmux_info or ""
          end,
          padding = { left = 2, right = 1 },
        },
      },
    },
  },
}

-- paleGreen = "#a6d189",
-- dimGreen = "#77aa88",
-- _blue = "#89b4fa",
-- _dimPaleGreen = "#94d2e5",
-- _palerGreen = "#b7efb2",
-- _orange = "#fab387",
-- _paleYellow = "#f9e2af",
-- cyan = "#40FFFF",
