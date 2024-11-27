vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "tf" then
			vim.bo.filetype = "terraform"
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.tpl",
	callback = function()
		if vim.bo.filetype == "smarty" then
			vim.bo.filetype = "json"
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
	callback = function()
		vim.bo.filetype = "yaml.docker-compose"
	end,
})
