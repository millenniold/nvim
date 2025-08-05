-- File Browser Window
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function open_win_config_func()
    local scr_w = vim.opt.columns:get()
    local scr_h = vim.opt.lines:get()
    local tree_w = 80
    local tree_h = math.floor(tree_w * scr_h / scr_w)
    return {
	border = "rounded",
	relative = "editor",
	width = tree_w,
	height = tree_h,
	col = (scr_w - tree_w) / 2,
	row = (scr_h - tree_h) / 2
    }
end

-- OR setup with some options
return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
          view = {
        	signcolumn = "yes",
        	float = {
        	    enable = true,
        	    open_win_config = open_win_config_func
        	},
        	cursorline = true
          },
          sort = {
            sorter = "case_sensitive",
          },
        --   view = {
        --     width = 30,
        --   },
          disable_netrw = true,
          hijack_netrw = true,
          open_on_tab = false,
          hijack_cursor = false,
          update_cwd = true,
          hijack_directories = {
              enable = true,
              auto_open = true,
          },
          diagnostics = {
              enable = false,
          },
          update_focused_file = {
              enable = true,
              update_cwd = true,
              ignore_list = {},
          },
          git = {
              enable = true,
              ignore = true,
              timeout = 500,
          },
          actions = {
              open_file = {
                quit_on_open = true,
              }
          },
          renderer = {
            highlight_git = true,
            root_folder_modifier = ":t",
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        deleted = "",
                        untracked = "U",
                        ignored = "◌",
                    },
                    folder = {
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                    },
                }
            }  },
          filters = {
            dotfiles = false,
          },
        })
    end,
}