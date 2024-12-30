-- Map Ctrl+S in insert mode to save and return to visual mode
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>gv", { noremap = true, silent = true })

-- Map Ctrl+S in normal mode to save
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Map Ctrl+S in visual mode to save
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>gv", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center search results when navigating with 'n' and 'N'
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

vim.keymap.set("x", "<leader>p", '"_dp')

-- Map <Leader>y to copy to the system clipboard
vim.keymap.set('n', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<Leader>y', '"+y', { noremap = true, silent = true })
