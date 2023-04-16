vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope: Great Fuzzy Finder Like
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1', -- Fuzzy Finder
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Auto Close Tags
  use 'm4xshen/autoclose.nvim'

  -- Auto close HTML tags
  use 'windwp/nvim-ts-autotag'
  -- Theme: Catppuccin
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Treesitter: for great Colors
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Harpoon: for Blazingly fast file navigation
  use 'ThePrimeagen/harpoon'

  -- LSP: LSP-Zero for everything LSP related
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },
      { "rafamadriz/friendly-snippets" },
      use {
        'hrsh7th/nvim-cmp',
        config = function()
          require 'cmp'.setup {
            snippet = {
              expand = function(args)
                require 'luasnip'.lsp_expand(args.body)
              end
            },

            sources = {
              { name = 'luasnip' },
              -- more sources
            },
          }
        end
      },
      use { 'saadparwaiz1/cmp_luasnip' }

    }, -- Required
  }
  -- Snippets!
end)
