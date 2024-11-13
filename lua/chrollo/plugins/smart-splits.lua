return {
	"mrjones2014/smart-splits.nvim",
	config = function()
		vim.keymap.set("n", "<A-h>", '<CMD>lua require("smart-splits").resize_left()<CR>')
		vim.keymap.set("n", "<A-j>", '<CMD>lua require("smart-splits").resize_down()<CR>')
		vim.keymap.set("n", "<A-k>", '<CMD>lua require("smart-splits").resize_up()<CR>')
		vim.keymap.set("n", "<A-l>", '<CMD>lua require("smart-splits").resize_right()<CR>')
		vim.keymap.set("n", "<C-h>", '<CMD>lua require("smart-splits").move_cursor_left()<CR>')
		vim.keymap.set("n", "<C-j>", '<CMD>lua require("smart-splits").move_cursor_down()<CR>')
		vim.keymap.set("n", "<C-k>", '<CMD>lua require("smart-splits").move_cursor_up()<CR>')
		vim.keymap.set("n", "<C-l>", '<CMD>lua require("smart-splits").move_cursor_right()<CR>')
		vim.keymap.set("n", "<C-\\>", '<CMD>lua require("smart-splits").move_cursor_previous()<CR>')
	end,
}
