-- https://codecompanion.olimorris.dev/usage/events.html
-- https://github.com/olimorris/dotfiles/blob/main/.config/nvim/lua/plugins/coding.lua
return {
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  opts = {

    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:bw get notes 'Gemini API Key'",
          },
        })
      end,
      openrouter = function()
        local openrouter = require("myStuff.cc-openrouter")
        return require("codecompanion.adapters").extend(openrouter, {
          name = "openrouter",
          formatted_name = "Open Router",
          env = {
            url = "https://openrouter.ai/api",
            api_key = "cmd:bw get notes 'OpenRouter API Key'",
          },
          schema = {
            model = {
              default = "z-ai/glm-4.5",
            },
          },
        })
      end,
      -- openrouter = function()
      --   return require("codecompanion.adapters").extend("openai_compatible", {
      --     env = {
      --       url = "https://openrouter.ai/api",
      --       api_key = "cmd:bw get notes 'Gemini API Key'",
      --       chat_url = "/v1/chat/completions",
      --     },
      --     schema = {
      --       model = {
      --         default = "openai/gpt-oss-20b:free",
      --         choices = {
      --           ["openai/gpt-oss-20b:free"] = { opts = { can_reason = true, has_vision = true } },
      --           ["deepseek/deepseek-r1:free"] = { opts = { can_reason = true, has_vision = true } },
      --           ["moonshotai/kimi-k2:free"] = { opts = { can_reason = false, has_vision = true } },
      --           ["mistralai/mistral-7b-instruct:free"] = { opts = { can_reason = false, has_vision = true } },
      --           ["openai/o4-mini"] = { opts = { can_reason = true, has_vision = true } },
      --           ["deepseek/deepseek-r1-0528"] = { opts = { can_reason = true, has_vision = true } },
      --           ["moonshotai/kimi-k2"] = { opts = { can_reason = false, has_vision = true } },
      --           ["qwen/qwen3-coder"] = { opts = { can_reason = false, has_vision = true } },
      --           ["z-ai/glm-4.5"] = { opts = { can_reason = true, has_vision = false } },
      --         },
      --       },
      --     },
      --   })
      -- end,
      -- anthropic = function()
      --   return require("codecompanion.adapters").extend("anthropic", {
      --     env = {
      --       api_key = "cmd:op read op://personal/Anthropic_API/credential --no-newline",
      --     },
      --     schema = {
      --       extended_thinking = {
      --         default = true,
      --       },
      --     },
      --   })
      -- end,
      -- deepseek = function()
      --   return require("codecompanion.adapters").extend("deepseek", {
      --     env = {
      --       api_key = "cmd:op read op://personal/DeepSeek_API/credential --no-newline",
      --     },
      --   })
      -- end,
      -- ollama = function()
      --   return require("codecompanion.adapters").extend("ollama", {
      --     schema = {
      --       model = {
      --         default = "qwen3:latest",
      --       },
      --       num_ctx = {
      --         default = 20000,
      --       },
      --     },
      --   })
      -- end,
      -- openai = function()
      --   return require("codecompanion.adapters").extend("openai", {
      --     opts = {
      --       stream = true,
      --     },
      --     env = {
      --       api_key = "cmd:op read op://personal/OpenAI_API/credential --no-newline",
      --     },
      --     schema = {
      --       model = {
      --         default = function()
      --           return "gpt-4.1"
      --         end,
      --       },
      --     },
      --   })
      -- end,
      -- xai = function()
      --   return require("codecompanion.adapters").extend("xai", {
      --     env = {
      --       api_key = "cmd:op read op://personal/xAI_API/credential --no-newline",
      --     },
      --   })
      -- end,
    },

    strategies = {
      chat = {
        adapter = "gemini",
        roles = {
          user = "Petrovski",
        },
        keymaps = {
          send = {
            modes = {
              i = { "<C-cr>", "<C-s" },
            },
          },
          completion = {
            modes = {
              i = { "<C-x" },
            },
          },
        },
        slash_commands = {
          ["buffer"] = {
            keymaps = {
              modes = {
                i = "<C-b>",
              },
            },
          },
        },
      },
      inline = {
        adapter = "gemini",
      },
    },

    display = {
      action_palette = {
        provider = "snacks",
      },
      chat = {
        -- show_references = true,
        -- show_header_separator = false,
        -- show_settings = false,
        icons = {
          tool_success = "󰸞 ",
        },
        fold_context = true,
      },
      diff = {
        provider = "mini_diff",
      },
    },
    -- opts = {
    --   log_level = "DEBUG",
    -- },
    extensions = {
      spinner = {},
    },
  },

  keys = {
    {
      "<Leader>tc",
      "<cmd>CodeCompanionActions<CR>",
      desc = "Open the action palette",
      mode = { "n", "v" },
    },
    {
      "<Leader>ta",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "Toggle a chat buffer",
      mode = { "n", "v" },
    },
    {
      "<Leader>aa",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "Add code to a chat buffer",
      mode = { "v" },
    },
  },

  init = function()
    vim.cmd([[cab cc CodeCompanion]])

    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanion*",
      group = group,
      callback = function(request)
        if request.match == "CodeCompanionInlineFinished" then
          -- Format the buffer after the inline request has completed
          require("conform").format({ bufnr = request.buf })
        end
        if request.match == "CodeCompanionChatCreated" then
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = "yes"
        end
      end,
    })
  end,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "codecompanion" },
      },
      ft = { "markdown", "codecompanion" },
    },
    {
      "nvim-mini/mini.diff",
      config = function()
        local diff = require("mini.diff")
        diff.setup({
          -- Disabled by default
          source = diff.gen_source.none(),
        })
      end,
    },
    {
      "franco-ruggeri/codecompanion-spinner.nvim",
    },
  },
}
