require("nvim-treesitter.configs").setup {
	highlight = { enable = true, additional_vim_regex_highlighting = true },
	incremental_selection = {
		enable = true,
	},
  indent = { enable = true },
  matchup = { enable = true },
  autopairs = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters
    max_file_lines = 1000,
  },
}
