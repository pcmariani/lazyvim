return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false,
      command_palette = false, -- position the cmdline and popupmenu together
    },

    views = {
      cmdline_popup = {
        border = {
          --   style = "none",
          --   -- padding = { 2, 3 },
          -- text = {
          --   top = " asdf ",
          -- },
        },
        position = {
          row = "80%",
          -- row = "32",
          -- col = "50%",
        },
        size = {
          width = 80,
          -- width = function()
          --   if vim.o.columns < 120 then
          --     return 90
          --   elseif vim.o.columns < 160 then
          --     return 100
          --   elseif vim.o.columns < 200 then
          --     return 120
          --   elseif vim.o.columns < 250 then
          --     return 150
          --   else
          --     return 200
          --   end
          -- end,
          height = "auto",
        },
        -- win_options = {
        --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        -- },
      },
    },
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      -- view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      opts = {
        border = {
          --   style = "none",
          --   -- padding = { 2, 3 },
          text = {
            top = "",
          },
        },
      }, -- global options for the cmdline. See section on views
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        -- title: set to anything or empty string to hide
        cmdline = { pattern = "^:", icon = ":", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "!", lang = "bash" },
        -- lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "lua", lang = "lua" },
        lua = false, -- to disable a format, set to `false`
        -- help = { pattern = "^:%s*he?l?p?%s+", icon = "help" },
        help = false,
        sendToTerm = {
          pattern = "^:%s*SendToTerm%s+",
          icon = string.gsub(vim.fn.getcwd(), "^/Users/petermariani", "~") .. " ❯",
          lang = "bash",
        },
        input = {}, -- Used by input()
      },
    },
  },
}
