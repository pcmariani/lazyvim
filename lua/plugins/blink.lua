return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
    -- ... Other dependencies
  },
  opts = {
    completion = {
      --   trigger = {
      --     show_in_snippet = false,
      --   },
      ghost_text = {
        show_with_menu = false,
      },
    },
    sources = {
      -- Add 'avante' to the list
      default = { "lsp", "path", "buffer" },
      providers = {
        cmdline = {
          min_keyword_length = function(ctx)
            -- when typing a command, only show when the keyword is 3 characters or longer
            if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
              return 2
            end
            return 0
          end,
        },
      },
    },
    cmdline = {
      keymap = {
        -- recommended, as the default keymap will only show and select the next item
        ["<Tab>"] = { "show", "accept" },
        -- ["<CR>"] = { "accept", "fallback" },
        -- ["<CR>"] = { "accept_and_enter", "fallback" },
      },
      completion = { menu = { auto_show = true } },
      enabled = true,
    },
    keymap = {
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      -- ["<CR>"] = { "accept", "fallback" },
      ["<CR>"] = { "fallback" },
      -- show with a list of providers
      -- ["<C-space>"] = {
      --   function(cmp)
      --     cmp.show({ providers = { "snippets" } })
      --   end,
      -- },
    },
  },
}
