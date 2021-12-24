-- plugins via packer
local packer = require("packer")
local use = packer.use


return require("packer").startup(
  function()
    -- packer, so it manages itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'
    use 'nvim-lua/plenary.nvim'

    -- tpope plugins
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"

    -- lsp plugins
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("harun.plugins.lspconfig")
      end
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("harun.plugins.lsp-kind")
      end
    }
    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("harun.plugins.lsp-signature")
      end
    }
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "simrat39/rust-tools.nvim"
    use "nvim-lua/lsp_extensions.nvim"
    use "nvim-lua/lsp-status.nvim"

    -- utility/ease-of-use
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function()
        require("harun.plugins.nvim-tree")
      end
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("harun.plugins.treesitter")
      end
    }
    use({
      'hrsh7th/nvim-cmp',
      config = function()
        require('harun.plugins.nvim-cmp')
      end,
      requires = {
        {
          'L3MON4D3/LuaSnip',
          config = function()
            require('harun.plugins.luasnip')
          end,
          requires = {
            'rafamadriz/friendly-snippets',
          },
        },
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        {
          'windwp/nvim-autopairs',
          config = function()
            require('nvim-autopairs').setup{}
          end,
          after = 'nvim-cmp',
        },
      },
      event = 'InsertEnter',
    })
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("harun.plugins.indent-blankline")
      end
    }
    use "folke/trouble.nvim"
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup {
          'css';
          'javascript';
          'typescript';
          html = {
            mode = 'foreground';
          }
        }
      end
    }
    -- telescope plugins
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "cljoly/telescope-repo.nvim"
    use {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("harun.plugins.null-ls")
      end
    }

    -- ui
    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        -- @TODO add configuration for lualine.
        require("harun.plugins.lualine")
      end
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("harun.plugins.gitsigns")
      end
    }
    -- stablize neovim when opening buffers/splits
    use { "luukvbaal/stabilize.nvim", config = function() require("stabilize").setup() end }
    -- better ui api with neovim 0.6
    use { "stevearc/dressing.nvim" }
    use "p00f/nvim-ts-rainbow"
  	use {
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require('todo-comments').setup {}
			end
		}

    -- language specific plugins --
    -- markdown
    use "ellisonleao/glow.nvim"
    -- json pathing
    use "mogelbrod/vim-jsonpath"

    -- themes
    use "whatsthatsmell/codesmell_dark.vim"
    use "bluz71/vim-moonfly-colors"
    use "sainnhe/everforest"
  end)
