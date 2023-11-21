return {

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
                     __                  
       .-----.--.--.|__|.--------.       
       |     |  |  ||  ||        |       
_  ___ |__|__|\___/ |__||__|__|__| ___  _
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
      -- { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
      -- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
  },

  {
    -- local custom_codedark = require("lualine.themes.codedark")
    -- custom_codedark.inactive.a.fg = "#222222"
    -- custom_codedark.inactive.b.fg = "#222222"
    "nvim-lualine/lualine.nvim",
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")

      return {
        options = {
          -- theme = "custom_codedark",
          -- theme = "codedark",
          component_separators = "|",
          section_separators = "",
          globalstatus = false,
        },
        -- sections = {
        --   lualine_a = { { "mode", color = { gui = "inverse" } } },
        --   lualine_z = { { "location", color = { gui = "reverse" } } },
        -- },
        sections = {
          lualine_a = { { "mode", color = { gui = "inverse" } } },
          lualine_y = {
            { "progress", separator = " " },
          },
          lualine_z = {
            { "location", padding = { left = 0, right = 1 }, color = { gui = "inverse" } },
          },
        },
      }
    end,
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        -- Animation rule for scope's first drawing. A function which, given
        -- next and total step numbers, returns wait time (in ms). See
        -- |MiniIndentscope.gen_animation| for builtin options. To disable
        -- animation, use `require('mini.indentscope').gen_animation.none()`.
        animation = function(s, n)
          return 8
        end,
      },
      -- symbol = "▏",
      symbol = "│",
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline",
        format = {
          -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          -- view: (default is cmdline view)
          -- opts: any options passed to the view
          -- icon_hl_group: optional hl_group for the icon
          -- title: set to anything or empty string to hide
          cmdline = { pattern = "^:", icon = ":", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
          input = {}, -- Used by input()
          -- lua = false, -- to disable a format, set to `false`
        },
      },
    },
  },
}
