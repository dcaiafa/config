vim.opt.backup = false
vim.opt.completeopt = { "menu", "popup" }
vim.opt.equalalways = false
vim.opt.equalalways = true
vim.opt.eadirection = "hor"
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

if vim.g.neovide then
  vim.opt.guifont = "FiraCode Nerd Font:h9"

  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 10
  vim.g.neovide_padding_left = 10
end

vim.g.mapleader = '\\'

--vim.cmd('colorscheme nightfox')

vim.opt.background = "dark"
vim.cmd([[ colorscheme gruvbox ]])
