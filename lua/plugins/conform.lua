return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      bash = { "shfmt" },
    },
    formatters = {
      clang_format = {
        prepend_args = {
          "-style={BasedOnStyle: llvm, IndentWidth: 4, BreakBeforeBraces: Custom, BraceWrapping: {AfterFunction: true}, ColumnLimit: 0 }",
        },
      },
      shfmt = {
        prepend_args = { "-i", "4", "-ci", "-bn" },
      },
    },
  },
}
