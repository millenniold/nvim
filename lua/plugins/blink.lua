-- In a separate file or within your main Neovim configuration
local blink_enabled_status = true -- Initial state, can be set based on your preference

function ToggleBlinkCmp()
    blink_enabled_status = not blink_enabled_status
    vim.b.completion = blink_enabled_status
end


-- Create a Neovim command to easily toggle
vim.api.nvim_create_user_command("ToggleBlinkCmp", ToggleBlinkCmp, { desc = "Toggle Blink.cmp completion" })
vim.keymap.set('i', '<C-p>', ToggleBlinkCmp)

-- This does code autocompletion...super fucking annoying

-- -- Create a module-level variable to track the toggle state
-- local blink_cmp_menu_enabled = false

-- -- Define a toggle function
-- function ToggleBlinkCmpMenu()
--   blink_cmp_menu_enabled = not blink_cmp_menu_enabled

--   require("blink.cmp").setup({
--     snippets = { preset = "luasnip" },
--     signature = { enabled = true },
--     appearance = {
--       use_nvim_cmp_as_default = false,
--       nerd_font_variant = "normal",
--     },
--     sources = {
--       default = { "lsp", "path", "snippets", "buffer" },
--       providers = {
--         cmdline = {
--           min_keyword_length = 2,
--         },
--       },
--     },
--     keymap = {
--       ["<C-f>"] = {},
--     },
--     cmdline = {
--       enabled = false,
--       completion = { menu = { auto_show = true } },
--       keymap = {
--         ["<CR>"] = { "accept_and_enter", "fallback" },
--       },
--     },
--     completion = {
--       menu = {
--         enabled = blink_cmp_menu_enabled,
--         border = nil,
--         scrolloff = 1,
--         scrollbar = false,
--         draw = {
--           columns = {
--             { "kind_icon" },
--             { "label", "label_description", gap = 1 },
--             { "kind" },
--             { "source_name" },
--           },
--         },
--       },
--       documentation = {
--         window = {
--           border = nil,
--           scrollbar = false,
--           winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
--         },
--         auto_show = true,
--         auto_show_delay_ms = 500,
--       },
--     },
--   })

--   vim.notify("Blink.CMP menu " .. (blink_cmp_menu_enabled and "enabled" or "disabled"))
-- end

-- vim.keymap.set("n", "<leader>r", ToggleBlinkCmpMenu, { desc = "Toggle Blink.CMP menu" })

-- local blink_cmp_menu_enabled = false

-- function ScottTest()
--     blink_cmp_menu_enabled = not blink_cmp_menu_enabled
--     vim.b.completion = blink_cmp_menu_enabled
--     -- require("blink.cmp").hide()
--     print("ScottTest")
-- end

-- vim.keymap.set("n", "<leader>r", ScottTest, { desc = "Toggle Blink.CMP menu" })

-- return {
--     { "L3MON4D3/LuaSnip", keys = {} },
--     {
--         "saghen/blink.cmp",
--         dependencies = {
--             "rafamadriz/friendly-snippets",
--         },
--         version = "*",
--         config = function()
--             require("blink.cmp").setup({
--                 snippets = { preset = "luasnip" },
--                 signature = { enabled = true },
--                 appearance = {
--                     use_nvim_cmp_as_default = false,
--                     nerd_font_variant = "normal",
--                 },
--                 sources = {
--                     default = { "lsp", "path", "snippets", "buffer" },
--                     providers = {
--                         cmdline = {
--                             min_keyword_length = 2,
--                         },
--                     },
--                 },
--                 keymap = {
--                     ["<C-f>"] = {},
--                 },
--                 cmdline = {
--                     enabled = false,
--                     completion = { menu = { auto_show = true } },
--                     keymap = {
--                         ["<CR>"] = { "accept_and_enter", "fallback" },
--                     },
--                 },
--                 completion = {
--                     menu = {
--                         -- I don't want the menu so I turned it off
--                         enabled=blink_cmp_menu_enabled,
--                         border = nil,
--                         scrolloff = 1,
--                         scrollbar = false,
--                         draw = {
--                             columns = {
--                                 { "kind_icon" },
--                                 { "label",      "label_description", gap = 1 },
--                                 { "kind" },
--                                 { "source_name" },
--                             },
--                         },
--                     },
--                     documentation = {
--                         window = {
--                             border = nil,
--                             scrollbar = false,
--                             winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
--                         },
--                         auto_show = true,
--                         auto_show_delay_ms = 500,
--                     },
--                 },
--             })

--             require("luasnip.loaders.from_vscode").lazy_load()
--         end,
--     },
-- }
-- return {
--     "saghen/blink.cmp",
--     dependencies = 'folke/snacks.nvim',
--     opts = function(_, opts)
--         local completion_toggle = Snacks.toggle({
--             name = "Completion",
--             get = function()
--                 return vim.b.completion
--             end,
--             set = function(state)
--                 vim.b.completion = state
--             end,
--         })

--         local function toggle_completion()
--             require("blink.cmp").hide()
--             completion_toggle:toggle()
--         end

--         vim.keymap.set({ "i", "n" }, "<C-p>", toggle_completion, { desc = "Toggle Completion" })
--         opts.enabled = function()
--             return vim.b.completion
--         end

--         return opts
--     end,
-- }

-- return {
--     "saghen/blink.cmp",
--     dependencies = 'folke/snacks.nvim',    
--     opts = function(_, opts)
--         local completion_toggle = Snacks.toggle({
--             name = "Completion",
--             get = function()
--                 return vim.b.completion
--             end,
--             set = function(state)
--                 vim.b.completion = state
--             end,
--         })

--         local function toggle_completion()
--             require("blink.cmp").hide()
--             completion_toggle:toggle()
--         end

--         vim.keymap.set({ "i", "n" }, "<C-p>", toggle_completion, { desc = "Toggle Completion" })
--         opts.enabled = function()
--             return vim.b.completion
--         end

--         return opts
--     end,
-- }

-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/blink-cmp.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/blink-cmp.lua

-- HACK: blink.cmp updates | Remove LuaSnip | Emoji and Dictionary Sources | Fix Jump Autosave Issue
-- https://youtu.be/JrgfpWap_Pg

-- completion plugin with support for LSPs and external sources that updates
-- on every keystroke with minimal overhead

-- https://www.lazyvim.org/extras/coding/blink
-- https://github.com/saghen/blink.cmp
-- Documentation site: https://cmp.saghen.dev/

-- NOTE: Specify the trigger character(s) used for luasnip
local trigger_text = ";"

return {
  "saghen/blink.cmp",
  enabled = true,
  -- In case there are breaking changes and you want to go back to the last
  -- working release
  -- https://github.com/Saghen/blink.cmp/releases
  -- version = "v0.13.1",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "Kaiser-Yang/blink-cmp-dictionary",
  },
  opts = function(_, opts)
    -- I noticed that telescope was extremeley slow and taking too long to open,
    -- assumed related to blink, so disabled blink and in fact it was related
    -- :lua print(vim.bo[0].filetype)
    -- So I'm disabling blink.cmp for Telescope
    opts.enabled = function()
      -- Get the current buffer's filetype
      local filetype = vim.bo[0].filetype
      -- Disable for Telescope buffers
      if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
        return false
      end
      return true
    end

    -- NOTE: The new way to enable LuaSnip
    -- Merge custom sources with the existing ones from lazyvim
    -- NOTE: by default lazyvim already includes the lazydev source, so not adding it here again
    opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
      default = { "lsp", "path", "snippets", "buffer", "dictionary" },
      providers = {
        lsp = {
          name = "lsp",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          --kind = "LSP",
          min_keyword_length = 2,
          -- When linking markdown notes, I would get snippets and text in the
          -- suggestions, I want those to show only if there are no LSP
          -- suggestions
          --
          -- Enabled fallbacks as this seems to be working now
          -- Disabling fallbacks as my snippets wouldn't show up when editing
          -- lua files
          -- fallbacks = { "snippets", "buffer" },
          score_offset = 90, -- the higher the number, the higher the priority
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 25,
          -- When typing a path, I would get snippets and text in the
          -- suggestions, I want those to show only if there are no path
          -- suggestions
          fallbacks = { "snippets", "buffer" },
          -- min_keyword_length = 2,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
        },
        buffer = {
          name = "Buffer",
          enabled = true,
          max_items = 3,
          module = "blink.cmp.sources.buffer",
          min_keyword_length = 2,
          score_offset = 15, -- the higher the number, the higher the priority
        },
        snippets = {
          name = "snippets",
          enabled = true,
          max_items = 15,
          min_keyword_length = 2,
          module = "blink.cmp.sources.snippets",
          score_offset = 85, -- the higher the number, the higher the priority
          -- Only show snippets if I type the trigger_text characters, so
          -- to expand the "bash" snippet, if the trigger_text is ";" I have to
          should_show_items = function()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
            -- NOTE: remember that `trigger_text` is modified at the top of the file
            return before_cursor:match(trigger_text .. "%w*$") ~= nil
          end,
          -- After accepting the completion, delete the trigger_text characters
          -- from the final inserted text
          -- Modified transform_items function based on suggestion by `synic` so
          -- that the luasnip source is not reloaded after each transformation
          -- https://github.com/linkarzu/dotfiles-latest/discussions/7#discussion-7849902
          -- NOTE: I also tried to add the ";" prefix to all of the snippets loaded from
          -- friendly-snippets in the luasnip.lua file, but I was unable to do
          -- so, so I still have to use the transform_items here
          -- This removes the ";" only for the friendly-snippets snippets
          transform_items = function(_, items)
            local line = vim.api.nvim_get_current_line()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = line:sub(1, col)
            local start_pos, end_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
            if start_pos then
              for _, item in ipairs(items) do
                if not item.trigger_text_modified then
                  ---@diagnostic disable-next-line: inject-field
                  item.trigger_text_modified = true
                  item.textEdit = {
                    newText = item.insertText or item.label,
                    range = {
                      start = { line = vim.fn.line(".") - 1, character = start_pos - 1 },
                      ["end"] = { line = vim.fn.line(".") - 1, character = end_pos },
                    },
                  }
                end
              end
            end
            return items
          end,
        },
        -- https://github.com/Kaiser-Yang/blink-cmp-dictionary
        -- In macOS to get started with a dictionary:
        -- cp /usr/share/dict/words ~/github/dotfiles-latest/dictionaries/words.txt
        --
        -- NOTE: For the word definitions make sure "wn" is installed
        -- brew install wordnet
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          score_offset = 20, -- the higher the number, the higher the priority
          -- https://github.com/Kaiser-Yang/blink-cmp-dictionary/issues/2
          enabled = true,
          max_items = 8,
          min_keyword_length = 3,
          opts = {
            -- -- The dictionary by default now uses fzf, make sure to have it
            -- -- installed
            -- -- https://github.com/Kaiser-Yang/blink-cmp-dictionary/issues/2
            --
            -- Do not specify a file, just the path, and in the path you need to
            -- have your .txt files
            dictionary_directories = { vim.fn.expand("~/github/dotfiles-latest/dictionaries") },
            -- Notice I'm also adding the words I add to the spell dictionary
            dictionary_files = {
              vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add"),
              vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/es.utf-8.add"),
            },
            -- --  NOTE: To disable the definitions uncomment this section below
            --
            -- separate_output = function(output)
            --   local items = {}
            --   for line in output:gmatch("[^\r\n]+") do
            --     table.insert(items, {
            --       label = line,
            --       insert_text = line,
            --       documentation = nil,
            --     })
            --   end
            --   return items
            -- end,
          },
        },
        -- -- Third class citizen mf always talking shit
        -- copilot = {
        --   name = "copilot",
        --   enabled = true,
        --   module = "blink-cmp-copilot",
        --   kind = "Copilot",
        --   min_keyword_length = 6,
        --   score_offset = -100, -- the higher the number, the higher the priority
        --   async = true,
        -- },
      },
    })

    opts.cmdline = {
      enabled = true,
    }

    opts.completion = {
        
      -- accept = {
      --   auto_brackets = {
      --     enabled = true,
      --     default_brackets = { ";", "" },
      --     override_brackets_for_filetypes = {
      --       markdown = { ";", "" },
      --     },
      --   },
      -- },
      --   keyword = {
      --     -- 'prefix' will fuzzy match on the text before the cursor
      --     -- 'full' will fuzzy match on the text before *and* after the cursor
      --     -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
      --     range = "full",
      --   },
      menu = {
        border = "single",
      },
      documentation = {
        auto_show = true,
        window = {
          border = "single",
        },
      },

    }

    -- opts.fuzzy = {
    --   -- Disabling this matches the behavior of fzf
    --   use_typo_resistance = false,
    --   -- Frecency tracks the most recently/frequently used items and boosts the score of the item
    --   use_frecency = true,
    --   -- Proximity bonus boosts the score of items matching nearby words
    --   use_proximity = false,
    -- }

    opts.snippets = {
      preset = "luasnip", -- Choose LuaSnip as the snippet engine
    }

    -- -- To specify the options for snippets
    -- opts.sources.providers.snippets.opts = {
    --   use_show_condition = true, -- Enable filtering of snippets dynamically
    --   show_autosnippets = true, -- Display autosnippets in the completion menu
    -- }

    -- The default preset used by lazyvim accepts completions with enter
    -- I don't like using enter because if on markdown and typing
    -- something, but you want to go to the line below, if you press enter,
    -- the completion will be accepted
    -- https://cmp.saghen.dev/configuration/keymap.html#default
    opts.keymap = {
      preset = "default",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    }

    return opts
  end,
}

