-- Customizes the bottom status bar
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
          options = {
            icons_enabled = true,
            theme = 'auto', -- or 'catppuccin', 'onedark', etc.
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
              'alpha',
              'NvimTree',
              'Outline',
            },
            always_last_status = true,
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'},
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {},
          },
          tabline = {},
          extensions = {},
        })
    end,
}