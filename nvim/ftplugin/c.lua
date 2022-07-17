require("which-key").register({
  c = {
    name = "Coding",
    h = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch between header/implementation" },
  }
}, { prefix = "<leader>", mode = "n", { silent = true } })
