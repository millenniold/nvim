vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣', space = '.', eol = '↴' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.winborder = "solid" -- https://neovim.io/doc/user/options.html#'winborder'

-- Global tab settings
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- Display width of a tab character
vim.opt.shiftwidth = 4        -- Indent width for <<, >>, etc.
vim.opt.softtabstop = 4       -- Number of spaces inserted when pressing <Tab>