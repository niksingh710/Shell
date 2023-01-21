local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- autoreloading plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use("folke/tokyonight.nvim") -- theme

		use("nvim-lua/plenary.nvim") -- most plugins use fn from this.

		-- tmux & split window navigation
		use("christoomey/vim-tmux-navigator")

		use("szw/vim-maximizer") -- maximize and restores current window

		use("numToStr/Comment.nvim") -- For commenting

		use("nvim-tree/nvim-tree.lua") -- File manager

		use("kyazdani42/nvim-web-devicons") -- icons

		use("lewis6991/impatient.nvim") -- faster nvim loading

		use("tamton-aquib/staline.nvim") -- statusline

		-- telescope
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use("nvim-telescope/telescope.nvim")
		use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions

		-- autocompletioins
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")

		-- snippets
		use("L3MON4D3/LuaSnip") -- snippet engine
		use("saadparwaiz1/cmp_luasnip") -- for autocompletion
		use("rafamadriz/friendly-snippets") -- useful snippets

		-- managing & installing lsp servers, linters & formatters
		use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
		use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

		-- configuring lsp servers
		use("neovim/nvim-lspconfig") -- easily configure language servers
		use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
		use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
		use("glepnir/lspsaga.nvim")

		-- formatting & linting
		use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
		use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

		-- treesitter configuration
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})

		-- auto closing
		use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

		-- git integration
		use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

		use({
			"akinsho/bufferline.nvim",
			requires = {
				"nvim-tree/nvim-web-devicons",
				"moll/vim-bbye",
			},
		})
		use("folke/which-key.nvim")
		use({ "akinsho/toggleterm.nvim", tag = "*" })

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
