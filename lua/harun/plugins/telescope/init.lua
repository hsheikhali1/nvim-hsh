local telescope = require('telescope')


telescope.setup{
 extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg", "svg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
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
