local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local builtin = require('telescope.builtin')

-- View Git commits but prohibit selecting and changing them
local function safe_git_commits()
  builtin.git_commits({
    attach_mappings = function(_, map)
      -- Override <CR> to do nothing
      map('i', '<CR>', function()
        print("Selection disabled.")
      end)
      map('n', '<CR>', function()
        print("Selection disabled.")
      end)
      return true
    end,
  })
end

-- View Git branches but prohibit selecting and changing them
local function safe_git_branches()
  builtin.git_branches({
    attach_mappings = function(_, map)
      -- Override <CR> to do nothing
      map('i', '<CR>', function()
        print("Selection disabled.")
      end)
      map('n', '<CR>', function()
        print("Selection disabled.")
      end)
      return true
    end,
  })
end

-- Keymaps
vim.keymap.set('n', '<leader>gc', safe_git_commits            , { desc = 'See git commits ' })
vim.keymap.set('n', '<leader>gb', safe_git_branches           , { desc = 'See git branches ' })
vim.keymap.set('n', '<leader>f' , ':Telescope find_files<CR>' , { desc = 'Telescopes find files dialog' })
vim.keymap.set('n', '<leader>t' , ':Telescope live_grep<CR>'  , { desc = 'Telescopes live grep dialog' })
vim.keymap.set('n', '<leader>b' , ':Telescope buffers<CR>'    , { desc = 'Telescopes buffers' })
vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>' , { desc = 'See git status' })
vim.keymap.set('n', '<leader>c' , ':Telescope colorscheme<CR>', { desc = 'See available colorschemes' })

return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require('telescope').setup{
          defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            layout_strategy = 'vertical',
            layout_config = {
              vertical = {
                mirror = false,
                prompt_position = 'top',
                preview_height = 0.5,  -- Adjust this to control preview size
                results_height = 0.5,  -- Optional: control results size
              },
            },
            sorting_strategy = 'ascending',
            prompt_prefix = '🔍 ',
            selection_caret = '➤ ',
            preview_cutoff = 0,
            mappings = {
              i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
              }
            }
          },
          pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
          },
          extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
          }
        }
    end,
}

