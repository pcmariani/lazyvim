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
  color10 = "#a6d189",
}

local my_theme = {
  normal = {
    a = { fg = colors.color7, gui = "bold" },
    b = { fg = colors.color10, gui = "italic" },
    c = { fg = colors.color2 },
    y = { fg = colors.color2 },
    z = { fg = colors.color10, gui = "italic" },
  },
  visual = {
    a = { fg = colors.color8, gui = "bold" },
    b = { fg = colors.color10, gui = "italic" },
    y = { fg = colors.color2 },
    z = { fg = colors.color10, gui = "italic" },
  },
  insert = {
    a = { fg = colors.color2, gui = "bold" },
    b = { fg = colors.color10, gui = "italic" },
    y = { fg = colors.color2 },
    z = { fg = colors.color10, gui = "italic" },
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
      lualine_a = { "%{toupper(mode())} " },
      lualine_b = {
        { "branch", color = { fg = "#707070" }, padding = { left = 2, right = 2 } },
      },
      lualine_c = {
        LazyVim.lualine.root_dir({ icon = "", color = { fg = "#77aa88" } }),
        -- {
        --   "filetype",
        --   icon_only = true,
        --   separator = "",
        --   padding = { left = 1, right = 0 },
        -- },
        { buffer_name, color = { gui = "bold" }, padding = { left = 1, right = 1 } },

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
        { "filetype", icons_enabled = false, color = { gui = "italic", fg = "#707070" }, padding = { right = 2 } },
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
