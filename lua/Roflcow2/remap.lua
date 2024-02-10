-- Set leader
vim.g.mapleader = " "

-- remaps

--File Exploration
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cd', ':Sex!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '~', ':buffers<CR>:b', {noremap=true})

--Move text up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv'")

--Keep cursor position when...
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yoinking and pasting maps
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--Forbidden key (don't know why ask Primeagen)
vim.keymap.set("n", "Q", "<nop>")

--Substitue selected word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

--Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent=true  })
