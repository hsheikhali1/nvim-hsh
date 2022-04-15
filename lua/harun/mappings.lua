config = require('harun.config')

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

-- lsp mappings


-- lines to show above and below definition
local context_before = 3
local context_after = 10

local function preview_location_callback(_, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  local range = result[1].targetRange or result[1].range
  range.start.line = (range.start.line - context_before)
  range['end'].line = (range['end'].line + context_after)
  vim.lsp.util.preview_location(result[1])
end

local function peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

--map("n", "<leader>p", peek_definition, opts)
vim.keymap.set("n", "<leader>p", peek_definition, opts)
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- map jk to esc
map("i", "jk", "<Esc>", opts)

-- map <esc> to clear highlighting for search
map("n", "<Esc>", ":nohl<CR>", opts)

-- Nvimtree mappings
--map("n", "<leader>a", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>a", ":Neotree toggle<CR>", opts)
map("n", "<leader>fa", ":Neotree float toggle<CR>", opts)


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

-- floaterm
float_term_string = "--wintype=" .. config.float_term.position .. "<CR>"
map("n", "<leader>fn", ":FloatermNew " .. float_term_string, opts)
map("n", "<leader>ft", ":FloatermToggle<CR>", opts)
map("n", "<leader>fh", ":FloatermHide!<CR>", opts)

-- lazygit
map("n", "<leader>gg", ":LazyGit<CR>", opts)

