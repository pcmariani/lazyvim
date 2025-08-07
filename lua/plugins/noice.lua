return {
  "folke/noice.nvim",
  opts = {
    routes = {
      { filter = { find = "more" }, view = "mini" },
      { filter = { find = "fewer" }, view = "mini" },
      { filter = { find = "yanked" }, view = "mini" },
      { filter = { find = "indented" }, view = "mini" },
      { filter = { find = "Enabled" }, view = "mini" },
      { filter = { find = "Disabled" }, view = "mini" },
      { filter = { find = "num of fields" }, skip = true },
      { filter = { find = "Col " }, view = "mini" },
      -- { filter = { find = "E162" }, view = "mini" },
      -- { filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
      -- { filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
      -- { filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
      -- { filter = { event = "emsg", find = "E23" }, skip = true },
      -- { filter = { event = "emsg", find = "E20" }, skip = true },
      -- { filter = { find = "No signature help" }, skip = true },
      -- { filter = { find = "E37" }, skip = true },
    },
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
        },
        size = {
          width = 80,
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
