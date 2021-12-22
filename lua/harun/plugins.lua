-- plugins via packer


return require("packer").startup {
  function(use)
    -- tpope
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"

    -- markdown
    use "ellisonleao/glow.nvim"
    use { "iamcco/markdown-preview.nvim", run = "cd app && npm install" }

    -- json pathing
    use "mogelbrod/vim-jsonpath"
    
    -- stablize neovim when opening buffers/splits
    use { "luukvbaal/stabilize.nvim", config = function() require("stabilize").setup() end }
    
    -- better ui api with neovim 0.6
    use { "stevearc/dressing.nvim" }

    -- themes
    use "whatsthatsmell/codesmell_dark.vim"

    -- comments
    use {
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end
    }
		-- ui
		use "lukas-reineke/indent-blankline.nvim"
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
    -- utilities
    use "wbthomason/packer.nvim"
		use {
			'nvim-telescope/telescope.nvim',
			requires = { {'nvim-lua/plenary.nvim'} }
		}
    use "cljoly/telescope-repo.nvim"
    use { "nvim-telescope/telescope-bookmarks.nvim" }
    use {
			"AckslD/nvim-neoclip.lua",
			config = function()
				require('neoclip').setup()
			end,
    }

		-- @TODO: organize these in some way...

    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
		use {
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require('todo-comments').setup {}
			end
		}
    use "jvgrootveld/telescope-zoxide"
    use "andymass/vim-matchup"
    use "windwp/nvim-autopairs"
    use "nvim-lua/lsp_extensions.nvim"
    use "p00f/nvim-ts-rainbow"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "folke/lua-dev.nvim"
		use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"
    use "ray-x/lsp_signature.nvim"
    use "nvim-treesitter/nvim-treesitter-refactor"
    use "nvim-treesitter/playground"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "David-Kunz/treesitter-unit"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "simrat39/rust-tools.nvim"
		use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
		use "jose-elias-alvarez/null-ls.nvim"
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
			config = function()
				require("harun.treesitter")
			end
    }
    use {
    'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function()
				require("harun.nvim-tree")
			end
    }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "f3fora/cmp-spell" },
        { "tamago324/cmp-zsh" },
      },
      config = function()
        require "harun.completion"
      end,
    }
		use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require "harun.statusline"
      end,
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    }
  end
}
