local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

api.nvim_create_user_command('Cdf', function() 
  fn.chdir(fn.expand("%:p:h"))
end, {})

api.nvim_create_user_command('YankFilename', function() 
  local filename = fn.expand('%:p')
  fn.setreg('+', filename)
  fn.chdir(fn.expand("%:p:h"))
  print(filename)
end, {})
