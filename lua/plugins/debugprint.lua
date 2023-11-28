return {
  "andrewferrier/debugprint.nvim",
  opts = {
    create_keymaps = true,
    create_commands = true,
    display_counter = false,
    print_tag = "#DEBUG",
    filetypes = {
      groovy = {
        left = 'println "',
        right = '"',
        mid_var = '" + ',
        right_var = "",
      },
    },
  },
  version = "*",
}
