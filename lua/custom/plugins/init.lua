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
}

