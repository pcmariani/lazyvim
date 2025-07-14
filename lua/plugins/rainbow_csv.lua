return {
  "mechatroner/rainbow_csv",
  ft = {
    "csv",
    "tsv",
    "csv_semicolon",
    "csv_whitespace",
    "csv_pipe",
    "rfc_csv",
    "rfc_semicolon",
  },
  cmd = {
    "RainbowDelim",
    "RainbowDelimSimple",
    "RainbowDelimQuoted",
    "RainbowMultiDelim",
  },
  keys = {
    {
      "=r",
      function()
        require("myStuff.myFuncs").ToggleRainbow()
      end,
      { desc = "Toggle Rainbow CSV Alignment" },
    },
  },
}
