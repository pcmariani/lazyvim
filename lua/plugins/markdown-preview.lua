return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>cp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    -- load mermaid theme JSON
    local theme_file = vim.fn.stdpath("config") .. "/mermaid-theme.json"
    local theme_vars = {}

    if vim.fn.filereadable(theme_file) == 1 then
      theme_vars = vim.fn.json_decode(vim.fn.readfile(theme_file))
    end

    -- set markdown-preview options to use the theme
    -- vim.g.mkdp_preview_options = {
    --   mermaid = {
    --     theme = "default",
    --     themeVariables = theme_vars.themeVariables or {},
    --   },
    --   -- disable_dark_mode = 1,
    -- }

    -- trigger FileType autocommands for markdown-preview
    vim.cmd([[do FileType]])
  end,
}
