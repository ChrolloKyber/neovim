vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tf",
  callback = function()
    if vim.bo.filetype == "tf" then
      vim.bo.filetype = "terraform"
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.go",
  callback = function()
    vim.o.softtabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = false
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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  callback = function()
    vim.bo.shiftwidth = 2
  end,
})

-- Save cursor position while yanking
local cursorPreYank

vim.keymap.set({ "n", "x" }, "y", function()
  cursorPreYank = vim.api.nvim_win_get_cursor(0)
  return "y"
end, { expr = true })

vim.keymap.set("n", "Y", function()
  cursorPreYank = vim.api.nvim_win_get_cursor(0)
  return "y$"
end, { expr = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    if vim.v.event.operator == "y" and cursorPreYank then
      vim.api.nvim_win_set_cursor(0, cursorPreYank)
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("lazy").update({ show = false })
  end,
})
-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})
