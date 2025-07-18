return {
  "akinsho/toggleterm.nvim",
  enabled = false,
  version = "*",
  opts = {
    direction = "vertical",
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    start_in_insert = true,
    -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
    insert_mappings = false, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true,
    -- terminal_mappings = false,
    autochdir = true,
    close_on_exit = true, -- close the terminal window when the process exits
  },
}
