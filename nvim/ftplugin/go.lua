vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

require("which-key").register({
  c = {
    name = "Coding",
    a = { "<cmd>GoAlt<cr>", "Go alternate file" },
    e = { "<cmd>GoIfErr<cr>", "Add if err" },
    b = { "<cmd>GoBuild<cr>", "Build" },
    i = { "<cmd>GoImport<cr>", "Add imports" },
    t = {
      name = "Testing",
      n = { "<cmd>GoTest -n<cr>", "Run nearest test" },
      p = { "<cmd>GoTest -p<cr>", "Run package tests" },
      t = { "<cmd>GoTest -f<cr>", "Run file tests" },
      c = { "<cmd>GoCoverage<cr>", "Test coverage" },
    }
  }
}, { prefix = "<leader>", mode = "n", { silent = true } })

local myGoGroup = vim.api.nvim_create_augroup("MyGoGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require('go.format').goimport()
  end,
  group = myGoGroup,
  buffer = vim.fn.bufnr()
})
