-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
	use('cohama/lexima.vim') -- Auto close parenthenses
	use('tpope/vim-commentary') -- Comment code
	use('editorconfig/editorconfig-vim') -- Editor config

	use('projekt0n/github-nvim-theme') -- Theme

	-- Debugging
	use('mfussenegger/nvim-dap')
	use('rcarriga/nvim-dap-ui')
	use('theHamsta/nvim-dap-virtual-text')

	-- Syntax highlighting
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	-- Toggle Terminal
	use{'akinsho/toggleterm.nvim', tag = 'v2.*'}

	-- LSP
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	  }
	}

	-- Version Control
	use('tpope/vim-fugitive')

	-- Formatting
	use('jose-elias-alvarez/null-ls.nvim')
	use('MunifTanjim/prettier.nvim')

	use('nvim-lua/plenary.nvim')
	use({'nvim-telescope/telescope-fzf-native.nvim',  run = 'make' })

	-- fuzzy finder
	use('nvim-telescope/telescope.nvim') 
	use('kyazdani42/nvim-web-devicons')
end)