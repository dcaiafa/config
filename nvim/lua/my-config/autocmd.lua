local api = vim.api

local setupTerminalGroup = api.nvim_create_augroup("SetupTerminalGroup", {}) 
api.nvim_create_autocmd("TermOpen", {
  group = setupTerminalGroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.iskeyword = { '@', '48-57', '_', '192-255', '#', '.', '-', '/' } 
  end
})
