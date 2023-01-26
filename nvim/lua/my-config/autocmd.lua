local api = vim.api

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
    require("which-key").register({
      h = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch between header/implementation" }
    }, { prefix = "g", mode = "n", { silent = true } })
  end
})
