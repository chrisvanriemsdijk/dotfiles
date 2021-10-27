-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
require('packer').init({display = {auto_clean = false}})
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'onsails/lspkind-nvim'
	use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzy-native.nvim'}
  use 'nvim-telescope/telescope-project.nvim'
  use 'sainnhe/gruvbox-material'

end)
