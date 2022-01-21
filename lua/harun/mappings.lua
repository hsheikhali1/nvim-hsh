local merge = function(...)
  return vim.tbl_deep_extend('force', ...)
end

local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = merge(options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap=true, silent=true }

-- map jk to esc
map("i", "jk", "<Esc>", opts)

-- map <esc> to clear highlighting for search
map("n", "<Esc>", ":nohl<CR>", opts)

-- Nvimtree mappings
map("n", "<leader>a", ":NvimTreeToggle<CR>", opts)


-- telescope mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "fb", ":Telescope buffers<CR>", opts)

-- Trouble bindings
map("n", "<leader>xx", ":TroubleToggle<CR>", opts)
map("n", "<leader>xf", ":TroubleToggle quickfix<CR>", opts)

-- bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- lazygit
map("n", "<leader>gg", ":LazyGit<CR>", opts)
