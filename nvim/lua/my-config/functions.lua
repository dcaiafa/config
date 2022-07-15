local cmd = vim.cmd
local fn = vim.fn

local M = {}

M.open_terminal = function(n) 
  local buf = 't' .. n
  if fn.bufexists(buf) ~= 1 then
    cmd('terminal')
    cmd('file ' .. buf)
    if fn.mode() == 'n' then
      cmd('normal i')
    end
    return
  end
  cmd('buffer ' .. buf)
  if fn.mode() == 'n' then
    cmd('normal i')
  end
end

return M
