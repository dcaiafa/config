require("which-key").setup({
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = {
    "<silent>",
    "<cmd>",
    "<Cmd>",
    "<cr>",
    "<CR>",
    "call",
    "lua",
    "require",
    "^:",
    "^ ",
  }, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

require("which-key").register({
  ["0"] = { "<cmd>BufExplorer<cr>", "Buffer Explorer" },
  ["1"] = { "<cmd>Terminal 1<cr>", "Open terminal 1" },
  ["2"] = { "<cmd>Terminal 2<cr>", "Open terminal 2" },
  ["3"] = { "<cmd>Terminal 3<cr>", "Open terminal 3" },
  ["4"] = { "<cmd>Terminal 4<cr>", "Open terminal 4" },
  ["5"] = { "<cmd>Terminal 5<cr>", "Open terminal 5" },
  ["6"] = { "<cmd>Terminal 6<cr>", "Open terminal 6" },
  ["7"] = { "<cmd>Terminal 7<cr>", "Open terminal 7" },
  ["8"] = { "<cmd>Terminal 8<cr>", "Open terminal 8" },
  ["9"] = { "<cmd>Terminal 9<cr>", "Open terminal 9" },
  ["e"] = { "<cmd>Explore<cr>", "Explore" },
  ["d"] = { "<cmd>Bdelete<cr>", "Delete current buffer" },
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Find files in git repo" },
    r = { "<cmd>Telescope git_files<cr>", "Find files in git repo" },
    g = { "<cmd>Telescope live_grep<cr>", "Find using live grep" },
    b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
    s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Find workspace symbols (LSP)" },
    t = { "<cmd>Telescope treesitter<cr>", "Find symbols from treesitter" },
  },
}, { prefix = "<leader>", mode = {"n", "i", "t"}, { silent = true } })

require("which-key").register({
  y = {
    name = "Yank (copy)",
    f = { "<cmd>YankFilename<cr>", "Yank current buffer's filename" }
  }
}, { prefix = "<leader>", mode = {"n", "i"}, { silent = true } })

