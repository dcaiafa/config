
local fn = vim.fn

-- Bootstrap packer if not installed.
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  use { "wbthomason/packer.nvim" }

  use { 
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      require'lspconfig'.clangd.setup{
        capabilities = capabilities,
        filetypes = { "c", "cpp", "cc", "objc", "objcpp" },
        on_attach = require("my-config.lsp_on_attach"),
      }
      require'lspconfig'.gopls.setup{
        capabilities = capabilities,
        cmd = {'gopls'},
        settings = {
          gopls = {
            analyses = {
              unusedparams = false,
              shadow = true,
           },
           staticcheck = true,
          },
        },
        on_attach = require("my-config.lsp_on_attach"),
      }
      -- npm install -g typescript typescript-language-server
      require'lspconfig'.ts_ls.setup{
        on_attach = require("my-config.lsp_on_attach"), 
      }
    end,
  }

  use { 
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function() 
      require "nvim-treesitter.configs".setup {
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "go",
          "lua",
          "python",
          "rust",
        },
        sync_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]]"] = "@function.outer",
            },
            goto_previous_start = {
              ["[["] = "@function.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      }
    end,
  }

  use {
    'simrat39/rust-tools.nvim',
    after = 'nvim-lspconfig',
    requires = 'neovim/nvim-lspconfig',
    config = function()
      require("rust-tools").setup{
        server = {
          on_attach = require("my-config.lsp_on_attach"),
          settings = {
            ['rust-analyzer'] = {
              diagnostics = {
                experimental = { enable = true }
              }
            }
          }

        }
      }
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'neovim/nvim-lspconfig',
  }

  use { "ironhouzi/starlite-nvim" }
  use { 'nvim-lua/plenary.nvim' }

  use { 
    'nvim-telescope/telescope.nvim',
    requires = { 
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    ensure_dependencies = true,
    config = function() 
      local telescope_actions = require("telescope.actions")
      require("telescope").setup{
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = telescope_actions.close
            }
          }
        }
      }
    end,
  }

  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }

  use { 'tpope/vim-fugitive' }
  use {
    'jlanzarotta/bufexplorer',
    setup = function()
      vim.g.bufExplorerDefaultHelp = 0
      vim.g.bufExplorerDisableDefaultKeyMapping = 1
    end,
  }
  use { 'junegunn/fzf' }
  use { 'nanotee/zoxide.vim' }
  use { 'BurntSushi/ripgrep' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'ekalinin/Dockerfile.vim' }
  use { 'ngg/vim-gn' }
  use { 'hashivim/vim-terraform' }
  use { 'lepture/vim-jinja' }
  use { 'dylon/vim-antlr' }

  -- Copied from https://astronvim.com/acknowledgements.
  use { 'famiu/bufdelete.nvim' }
  use { 'mrjones2014/smart-splits.nvim' }

  --[[
  use { 
    "folke/which-key.nvim", 
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = 'require("my-config.which-key-config")'
  }
  --]]

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    ensure_dependencies = true,
    config = 'require("my-config.lualine-config")'
  }

  use { 'kyazdani42/nvim-web-devicons' }
  --use { 'dcaiafa/vim-nitro' }
  use { '~/src/my/vim-nitro' }
  --use { 'dcaiafa/vim-lox' }
  use { '~/src/my/vim-lox' }

  --[[
  use {
    '~/src/my/go.nvim',
    ft = "go",
    config = function() 
      require 'go'.setup()
    end
  }
  --]]

  use { 'fatih/vim-go' }

  -- https://github.com/ellisonleao/gruvbox.nvim
  use { 'ellisonleao/gruvbox.nvim' }

  use { 'terrastruct/d2-vim' }
end)
