require("my-config.plugins")
require("my-config.options")
require("my-config.mappings")
require("my-config.commands")
require("my-config.autocmd")

-- Enable filetype.lua.
-- The feature is currently opt-in.
vim.g.do_filetype_lua = 1
-- disable filetype.vim
vim.g.did_load_filetypes = 0
