local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config({
  store_selection_keys = "<c-s>",
  update_events = "TextChanged,TextChangedI",
})

-- ls.setup({
--   -- Update more often, :h events for more info.
-- })

local date = function()
  return { os.date("%Y-%m-%d") }
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
  },
  groovy = {
    snip({
      trig = "pr",
      namr = "println",
      dscr = "println all the time",
    }, {
      text({ "println " }),
      insert(0),
    }),
    snip("pri", fmt("println {}", { insert(1, "hello") })),
  },
  markdown = {
    snip({
      trig = "link",
      namr = "markdown_link",
      dscr = "Create markdown link [txt](url)",
    }, {
      text("["),
      insert(1),
      text("]("),
      func(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      text(")"),
      insert(0),
    }),
  },
})
