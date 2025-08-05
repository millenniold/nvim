vim.g.mapleader = " "
vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })

-- Toggle file explorer popup
vim.keymap.set("n", "<leader>e" , ":NvimTreeToggle<CR>")

-- Change command history mapping (Default is q: in normal mode but is annoying)
vim.keymap.set('n', '<leader>ch', 'q:', { noremap = true })
vim.keymap.set('n', 'q:', '<Nop>', { noremap = true })

-- Close current buffer (if not modified)
vim.keymap.set("n", "<C-w>"     , ":bd<CR>")

-- Close nvim (if no buffers are modified)
vim.keymap.set('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

-- Save current buffer
vim.keymap.set("n", "<C-s>"     , ":w<CR>")
vim.keymap.set("i", "<C-s>"     , "<ESC>:w<ESC>a")

-- Toggle whitespace view
vim.keymap.set('n', '<leader>w', function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = 'Toggle whitespace visibility' })

-- Enable column select
vim.keymap.set('n', '<C-down>', function()
  vim.api.nvim_feedkeys('v' .. vim.api.nvim_replace_termcodes('<C-q>', true, false, true), 'n', false)
end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-up>', function()
  vim.api.nvim_feedkeys('v' .. vim.api.nvim_replace_termcodes('<C-q>', true, false, true), 'n', false)
end, { noremap = true, silent = true })
vim.keymap.set('i', '<C-Down>', function()
  local keys = vim.api.nvim_replace_termcodes('<Esc>v<C-q>', true, false, true)
  vim.api.nvim_feedkeys(keys, 'n', false)
end, { noremap = true, silent = true })
vim.keymap.set('i', '<C-Up>', function()
  local keys = vim.api.nvim_replace_termcodes('<Esc>v<C-q>', true, false, true)
  vim.api.nvim_feedkeys(keys, 'n', false)
end, { noremap = true, silent = true })

-- Undo/Redo

-- Disable default undo/redo in normal mode
vim.keymap.set('n', 'u', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>', '<Nop>', { noremap = true, silent = true })

-- Turn off Ctrl-Z so it doesn't insert ^Z 
vim.keymap.set('i', '<C-z>', '<Nop>', { noremap = true, silent = true })

-- Remap undo/redo in insert mode
vim.keymap.set('i', '<C-u>', '<Esc>u<ESC>a', { noremap = true, silent = true })       -- Undo
vim.keymap.set('i', '<C-r>', '<Esc><C-r><ESC>a', { noremap = true, silent = true })   -- Redo

-- Create undo breakpoints while in insert mode
vim.api.nvim_create_autocmd("InsertCharPre", {
  pattern = "*",
  callback = function()
    local char = vim.v.char
    if char == '.' or char == ',' or char == '!' or char == '?' or char == ' ' or char == '\r' or char == '\n' then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-g>u', true, false, true), 'n', false)
    end
  end,
})
vim.keymap.set('i', '<CR>', '<C-g>u<CR>', { noremap = true })

