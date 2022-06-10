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
telescope.load_extension("project")

vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true })

vim.api.nvim_set_keymap(
    'n',
    '<leader>p',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)
