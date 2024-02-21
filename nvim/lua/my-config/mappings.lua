local map = vim.keymap.set
local default_options = { silent = true }

local map = function(mode, lhs, rhs, opts) 
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', default_options, opts or {}))
end

map({'i', 't'}, '<leader>\\', '\\', { noremap = true })

-- Deal with visual line wraps.
map('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true})
map('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true})

--[[
map('n', '<C-H>', '<C-W>h')
map('n', '<C-J>', '<C-W>j')
map('n', '<C-K>', '<C-W>k')
map('n', '<C-L>', '<C-W>l')
--]]

vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

-- Disable search highlight when pressing <ESC>.
map('n', '<ESC>', ':nohlsearch<Bar>:echo<CR>')

-- Starlite mappings.
map('n', '*', function() return require('starlite').star() end)
map('n', 'g*', function() return require('starlite').g_star() end)
map('n', '#', function() return require('starlite').hash() end)
map('n', 'g#', function() return require('starlite').g_hash() end)

-- Terminal.
map('t', '<ESC><ESC>', '<C-\\><C-n>')
map('t', '<C-h>', '<C-\\><C-n><C-w>h')
map('t', '<C-j>', '<C-\\><C-n><C-w>j')
map('t', '<C-k>', '<C-\\><C-n><C-w>k')
map('t', '<C-l>', '<C-\\><C-n><C-w>l')
map('t', '<C-r>a', '<C-\\><C-n>"aPi')
map('t', '<C-r>b', '<C-\\><C-n>"bPi')
map('t', '<C-r>c', '<C-\\><C-n>"cPi')
map('t', '<C-r>d', '<C-\\><C-n>"dPi')
map('t', '<C-r>e', '<C-\\><C-n>"ePi')
map('t', '<C-r>x', '<C-\\><C-n>"xPi')
map('t', '<C-r>y', '<C-\\><C-n>"yPi')
map('t', '<C-r>+', '<C-\\><C-n>"+Pi')
map('t', '<C-r><C-r>', '<C-r>')
