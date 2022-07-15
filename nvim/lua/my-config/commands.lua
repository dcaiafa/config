local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

api.nvim_create_user_command('Cdf', function() 
  cmd('cd ' .. fn.expand("%:p:h"))
end, {})

api.nvim_create_user_command('YankFilename', function() 
  fn.setreg('d', fn.expand('%:p'))
end, {})
