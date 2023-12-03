-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- Lsp for php projects
	{
		'phpactor/phpactor',
		opt = true,
		ft = {'php'},
		run = 'composer install --no-dev -o'
	},

	-- Laravel plugin
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>la", ":Laravel artisan<cr>" },
			{ "<leader>lr", ":Laravel routes<cr>" },
			{ "<leader>lm", ":Laravel related<cr>" },
			{
				"<leader>lt",
				function()
					require("laravel.tinker").send_to_tinker()
				end,
				mode = "v",
				desc = "Laravel Application Routes",
			},
		},
		event = { "VeryLazy" },
		config = function()
			require("laravel").setup()
			require("telescope").load_extension "laravel"
		end,
	}
}

