return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- keep existing settings
    opts.inlay_hints = { enabled = false }

    -- merge diagnostics config instead of replacing LazyVim defaults
    opts.diagnostics = opts.diagnostics or {}
    opts.diagnostics.float = opts.diagnostics.float or {}
    opts.diagnostics.float.border = "rounded"

    -- ensure lua_ls table exists
    opts.servers = opts.servers or {}
    opts.servers.lua_ls = opts.servers.lua_ls or {}

    local lua_ls = opts.servers.lua_ls

    -- ensure diagnostics knows about the global `vim` without overriding existing config
    lua_ls.settings = lua_ls.settings or {}
    lua_ls.settings.Lua = lua_ls.settings.Lua or {}
    lua_ls.settings.Lua.diagnostics = lua_ls.settings.Lua.diagnostics or {}

    local globals = lua_ls.settings.Lua.diagnostics.globals or {}
    if not vim.tbl_contains(globals, "vim") then
      table.insert(globals, "vim")
    end
    lua_ls.settings.Lua.diagnostics.globals = globals
  end,
}
