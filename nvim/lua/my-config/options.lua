vim.opt.backup = false
vim.opt.completeopt = { "menu", "preview", "menuone" }
vim.opt.equalalways = false
vim.opt.expandtab = true
vim.opt.formatoptions = "cq"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.timeoutlen = 400
vim.opt.ttimeoutlen = 0
vim.opt.virtualedit = "all"
vim.opt.wildignore:append { "*.swp", "*.bak", "*.pyc" }
vim.opt.wildmode = { "longest:full" }

vim.g.mapleader = ","

vim.cmd('colorscheme nightfox')
