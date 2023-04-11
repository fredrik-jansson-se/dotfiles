
vim.g.mapleader = " "

vim.cmd [[nnoremap ; :]]
vim.cmd [[nnoremap : ;]]

-- Swap v and CTRL-V
vim.keymap.set("n", "v", "<C-V>")
vim.keymap.set("n", "<C-V>", "v")
vim.keymap.set("v", "v", "<C-V>")
vim.keymap.set("v", "<C-V>", "v")

vim.keymap.set("n", "<F5>", function() 
    vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
    -- vim.opt.cursorcolumn = not vim.opt.cursorcolumn
end)

-- disable Q
vim.keymap.set("n", "Q", "<nop>")
