return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "groovy",
        "awk",
        "org",
        "xml",
        "csv",
        "tsv",
        "org",
        "sql",
      },
      highlight = { enable = true, disable = { "csv", "tsv", "groovy" } },
    },
    keys = {
      { "<Leader>ch", "<cmd>TSBufToggle highlight<cr>", desc = "TS Toggle highlight" },
    },
  },
}
