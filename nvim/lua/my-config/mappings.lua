local default_options = { silent = true }

local map = function(mode, lhs, rhs, opts) 
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', default_options, opts or {}))
end

map({'i', 't'}, '<leader>\\', '\\', { noremap = true })

-- Deal with visual line wraps.
map('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true})
map('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true})

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

local modes = { 'i', 'n', 't' }
map(modes, '<leader>0', '<cmd>BufExplorer<cr>')
map(modes, '<leader>1', '<cmd>Terminal 1<cr>')
map(modes, '<leader>2', '<cmd>Terminal 2<cr>')
map(modes, '<leader>3', '<cmd>Terminal 3<cr>')
map(modes, '<leader>4', '<cmd>Terminal 4<cr>')
map(modes, '<leader>5', '<cmd>Terminal 5<cr>')
map(modes, '<leader>6', '<cmd>Terminal 6<cr>')
map(modes, '<leader>7', '<cmd>Terminal 7<cr>')
map(modes, '<leader>8', '<cmd>Terminal 8<cr>')
map(modes, '<leader>9', '<cmd>Terminal 9<cr>')
map(modes, '<leader>d', '<cmd>Bdelete<cr>')
map(modes, '<leader>e', '<cmd>Explore<cr>')
map(modes, '<leader>fb', '<cmd>Telescope buffers<cr>')
map(modes, '<leader>ff', '<cmd>Telescope find_files<cr>')
map(modes, '<leader>fg', '<cmd>Telescope live_grep<cr>')
map(modes, '<leader>fh', '<cmd>Telescope help_tags<cr>')
map(modes, '<leader>fr', '<cmd>Telescope git_files<cr>')
map(modes, '<leader>fs', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
map(modes, '<leader>ft', function() require('telescope.builtin').lsp_document_symbols({symbols = {"method", "function", "struct"}}) end)

map('n', 'yf', '<cmd>YankFilename<cr>')

-- N.B. it must use ':' instead of <cmd> for the visual mode to work.
map({'n', 'v'}, 'yr', ':YankFileReference<cr>')
