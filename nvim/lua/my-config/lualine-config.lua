local navic = require("nvim-navic")

-- use gitsigns as source info
require("lualine").setup({
  options = {
    theme = "auto",
    icons_enabled = true,
    disabled_filetypes = {},
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {
      {
        "branch"
      }
    },
    lualine_b = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
      },
    },
    lualine_c = {
      {
        "filetype",
        icon_only = true, -- Display only an icon for filetype
      },
      {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename 1: Relative path 2: Absolute pathath
        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        symbols = { modified = "[]", readonly = " " },
      },
      { navic.get_location, cond = navic.is_available },
    },
    lualine_x = {
      "encoding",
      "fileformat",
      "filesize",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "nvim-tree", "toggleterm", "quickfix", "symbols-outline" },
})

