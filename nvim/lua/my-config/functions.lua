local cmd = vim.cmd
local fn = vim.fn
local api = vim.api

local M = {}

M.open_terminal = function(n) 
  local buf = 't' .. n
  if fn.bufexists(buf) ~= 1 then
    cmd('terminal')
    cmd('file ' .. buf)
    cmd('startinsert')
    return
  end

  -- Switch to buffer and enter insert mode.
  -- There seems to be a bug where sometimes the terminal size is not updated
  -- correctly. Re-entering insert mode fixes this problem, as long as it is
  -- done in a timer.
  cmd('buffer ' .. buf)
  fn.timer_start(100, function() vim.cmd('stopinsert') end)
  fn.timer_start(200, function() vim.cmd('startinsert') end)
end

return M
