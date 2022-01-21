local telescope = require('telescope')


telescope.setup{
  pickers = {
    find_files = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    }
  }
}

telescope.load_extension("git_worktree")

vim.api.nvim_set_keymap('n', '<C-T>', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true })
