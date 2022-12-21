-- Boostrap packer on fresh install
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(function(use)
    -- Plugins
	use "wbthomason/packer.nvim"
	
	use "rafi/awesome-vim-colorschemes"
	use "Yazeed1s/oh-lucy.nvim"
	use "nyoom-engineering/oxocarbon.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	use {"akinsho/toggleterm.nvim"}
	use "gpanders/editorconfig.nvim"
	use "tpope/vim-fugitive"
	use "sindrets/diffview.nvim"

	use "neovim/nvim-lspconfig"
	use "hrsh7th/cmp-vsnip"
	use "hrsh7th/vim-vsnip"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/nvim-cmp"
	
	use "numToStr/Comment.nvim"

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	

	-- Install packer packages on bootstrap
    if packer_boostrap then
		require("packer").sync()
    end
end)
