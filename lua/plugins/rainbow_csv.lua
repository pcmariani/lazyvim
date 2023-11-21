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
    { "=ra", "<cmd>RainbowAlign<cr>", desc = "RainbowCsv Align" },
    { "=rs", "<cmd>RainbowShrink<cr>", desc = "RainbowCsv Shrink" },
    { "=rd", "<cmd>RainbowDelim<cr>", desc = "RainbowCsv Delim" },
    { "=rn", "<cmd>RainbowNoDelim<cr>", desc = "RainbowCsv NoDelim" },
  },
}
-- return {
--   "cameron-wags/rainbow_csv.nvim",
--   config = true,
--   ft = {
--     "csv",
--     "tsv",
--     "csv_semicolon",
--     "csv_whitespace",
--     "csv_pipe",
--     "rfc_csv",
--     "rfc_semicolon",
--   },
--   cmd = {
--     "RainbowDelim",
--     "RainbowDelimSimple",
--     "RainbowDelimQuoted",
--     "RainbowMultiDelim",
--   },
-- }
