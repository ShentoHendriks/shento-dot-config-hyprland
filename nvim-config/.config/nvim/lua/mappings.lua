require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Nvim Tree
map("n", "<leader>ee", "<cmd> NvimTreeToggle <CR>", { desc = "nvimtree Toggle File explorer" })
map("n", "<leader>ef", "<cmd> NvimTreeFindFile <CR>", { desc = "nvimtree Toggle File explorer opened file" })

-- Save on Ctrl S
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
