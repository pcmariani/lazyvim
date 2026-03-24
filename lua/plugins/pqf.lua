return {
  "yorickpeterse/nvim-pqf",
  name = "pqf",
  event = "VeryLazy",
  config = function()
    require("pqf").setup({
      signs = {
        error = { text = "E", hl = "DiagnosticSignError" },
        warning = { text = "W", hl = "DiagnosticSignWarn" },
        info = { text = "I", hl = "DiagnosticSignInfo" },
        hint = { text = "H", hl = "DiagnosticSignHint" },
      },

      -- By default, only the first line of a multi line message will be shown.
      -- When this is true, multiple lines will be shown for an entry, separated by
      -- a space
      show_multiple_lines = false,

      -- Limit filename length so location column stays aligned
      max_filename_length = 40,

      -- Prefix to use for truncated filenames.
      filename_truncate_prefix = "[...]",
    })
  end,
}
