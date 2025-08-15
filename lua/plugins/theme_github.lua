return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    options = {
      -- transparent = true,
      dim_inactive = true,
      darken = { -- Darken floating windows and sidebar-like windows
        floats = true,
        sidebars = {
          enable = false,
          list = {}, -- Apply dark background to specific windows
        },
      },
    },
  },
}
