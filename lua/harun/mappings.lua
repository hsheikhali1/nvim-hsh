local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- use jk to close
map("i", "jk", "<esc>", { noremap = true, silent = true })

-- nvim tree
map("n", "<leader>a", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


-- treesitter mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope file_browser<CR>", opts)
map("n", "<leader>cs", ":Telescope colorscheme<CR>", opts)


-- defauilt mappings
map("n", "<esc>", ":nohl<CR>", opts)

-- trouble
map("n", "<leader>xx", ":TroubleToggle<cr>", opts)
map("n", "<leader>xf", ":TroubleToggle quickfix<cr>", opts)
