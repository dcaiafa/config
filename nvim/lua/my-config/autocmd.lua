local api = vim.api
local cmd = vim.cmd

local myGroup = api.nvim_create_augroup("myGroups", {}) 
api.nvim_create_autocmd("TermOpen", {
  group = myGroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.iskeyword = { '@', '48-57', '_', '192-255', '#', '.', '-', '/' } 
  end
})

api.nvim_create_autocmd("FileType", {
  group = myGroup,
  pattern = { "c", "cpp" },
  callback = function() 
    require("which-key").add({
      { "gh", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch between implementation and header" },
    })
  end
})

api.nvim_create_autocmd("FileType", {
  group = myGroup,
  pattern = { "go" },
  callback = function() 
    require("which-key").add({
      { "ga", "<cmd>GoAlternate<cr>", desc = "Switch between implementation and test" },
    })
  end
})

api.nvim_create_autocmd("VimResized", {
  group = myGroup,
  callback = function()
    cmd('wincmd =')
  end
})

