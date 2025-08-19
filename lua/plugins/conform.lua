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
          "-style=" .. [[{
              BasedOnStyle: llvm,
              IndentWidth: 4,
              ColumnLimit: 0,
              AllowShortEnumsOnASingleLine: true,
              BreakBeforeBraces: Custom,
              BraceWrapping: { AfterFunction: true },
            }]],
        },
      },
      shfmt = {
        prepend_args = { "-i", "4", "-ci", "-bn" },
      },
    },
  },
}

--
-- # Function call arguments
-- BinPackArguments: false,
-- AllowAllArgumentsOnNextLine: false,
-- AlignAfterOpenBracket: AlwaysBreak,
-- PenaltyBreakArgument: 1,
--
-- # Function parameters (optional, remove if you don’t want this)
-- BinPackParameters: false,
-- AllowAllParametersOfDeclarationOnNextLine: false,
-- PenaltyBreakParameter: 1
