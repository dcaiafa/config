require("which-key").register({
  h = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch between header/implementation" }
}, { prefix = "g", mode = "n", { silent = true } })
