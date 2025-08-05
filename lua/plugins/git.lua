-- Git access

vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { desc = 'Open Git Log' })

return {
    'tpope/vim-fugitive',
    event = 'BufWinEnter',
    
    config = function()
        -- Disable legacy commands for cleaner setup
        vim.g.fugitive_legacy_commands = 0
        
        -- Autocommand to ensure status window is always in focus when opened
        vim.api.nvim_create_autocmd('BufWinEnter', {
          pattern = 'fugitive://*',
          callback = function()
            vim.cmd('wincmd p') -- Focus on the Fugitive window
          end,
        })

    end,
}