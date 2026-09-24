-- Set <space> as the leader key (must happen before plugins are loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers (hybrid mode: absolute current line, relative others)
vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Tab and Indent configuration (4 spaces)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search settings
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Match case if search contains a capital letter
vim.opt.hlsearch = false  -- Stop highlighting after search is complete

-- UI and Split behavior
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.splitright = true    -- Vertical splits go to the right
vim.opt.splitbelow = true    -- Horizontal splits go below
vim.opt.scrolloff = 8        -- Keep 8 lines above/below cursor when scrolling
