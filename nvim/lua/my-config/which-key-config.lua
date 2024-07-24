require("which-key").setup({})

require("which-key").add({
  {
    mode = { "i", "n", "t" },
    { "<leader>0", "<cmd>BufExplorer<cr>", desc = "Buffer Explorer" },
    { "<leader>1", "<cmd>Terminal 1<cr>", desc = "Open terminal 1" },
    { "<leader>2", "<cmd>Terminal 2<cr>", desc = "Open terminal 2" },
    { "<leader>3", "<cmd>Terminal 3<cr>", desc = "Open terminal 3" },
    { "<leader>4", "<cmd>Terminal 4<cr>", desc = "Open terminal 4" },
    { "<leader>5", "<cmd>Terminal 5<cr>", desc = "Open terminal 5" },
    { "<leader>6", "<cmd>Terminal 6<cr>", desc = "Open terminal 6" },
    { "<leader>7", "<cmd>Terminal 7<cr>", desc = "Open terminal 7" },
    { "<leader>8", "<cmd>Terminal 8<cr>", desc = "Open terminal 8" },
    { "<leader>9", "<cmd>Terminal 9<cr>", desc = "Open terminal 9" },
    { "<leader>d", "<cmd>Bdelete<cr>", desc = "Delete current buffer" },
    { "<leader>e", "<cmd>Explore<cr>", desc = "Explore" },
    { "<leader>f", group = "Find" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files in git repo" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find using live grep" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
    { "<leader>fr", "<cmd>Telescope git_files<cr>", desc = "Find files in git repo" },
    { "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find workspace symbols (LSP)" },
    { "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Find symbols from treesitter" },
  },
  {
    mode = { "n", "i" },
    { "y", group = "Yank (copy)" },
    { "yf", "<cmd>YankFilename<cr>", desc = "Yank current buffer's filename" },
  }
})
