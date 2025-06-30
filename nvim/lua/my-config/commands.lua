local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local log = require('my-config.log')

api.nvim_create_user_command('Cdf', function() 
  cmd('cd! %:p:h')
end, {})

api.nvim_create_user_command('YankFilename', function() 
  local filename = fn.expand('%:p')
  fn.setreg('+', filename)
  fn.chdir(fn.expand("%:p:h"))
  print(filename)
end, {})

api.nvim_create_user_command('YankFileReference', function(c)
  local filename = fn.expand('%:p')
  local mode = fn.mode()
  local reference
  local start_line = c.line1
  local end_line = c.line2
  
  log.debug("YankFileReference called")
  log.debug("Filename:", filename)
  log.debug("Mode:", mode)
  log.debug("start_line:", start_line, "end_line:", end_line)
  
  if start_line == end_line then
    reference = string.format('@%s#%d', filename, start_line)
  else
    reference = string.format('@%s#%d-%d', filename, start_line, end_line)
  end
  
  log.debug("Reference:", reference)
  fn.setreg('+', reference)
  print(reference)
end, { range = true })

api.nvim_create_user_command('CloseBuffer', function()
  local cur_buf = api.nvim_get_current_buf()
  local bufs = api.nvim_list_bufs()

  local next_buf
  for i, buf in ipairs(bufs) do
    if buf ~= cur_buf then
      next_buf = buf
      break
    end
  end

  if next_buf then
    cmd('buffer ' .. next_buf)
  end

  cmd('bd ' .. cur_buf)
end, {})

api.nvim_create_user_command('Terminal', function(p) 
  local n = tonumber(p.fargs[1])
  assert(n and n >= 1 and n <= 9, "Terminal number must be a number between 1 and 9")

  local buf = 't' .. n
  if fn.bufexists(buf) == 1 then
    cmd('buffer ' .. buf)
  else
    cmd('terminal')
    cmd('file ' .. buf)
  end

  -- Switch to buffer and enter insert mode.
  -- There seems to be a bug where sometimes the terminal size is not updated
  -- correctly. Re-entering insert mode fixes this problem, as long as it is
  -- done in a timer.
  fn.timer_start(100, function() vim.cmd('stopinsert') end)
  fn.timer_start(200, function() vim.cmd('startinsert') end)
end, { nargs=1 })
