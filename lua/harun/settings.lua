-- Neovim Settings & Options - Lua
local opt = vim.opt

-- go to last location when opening a buffer
vim.cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]]

-- vimdows to close with 'q'
vim.cmd [[autocmd FileType help,qf,fugitive,fugitiveblame,netrw nnoremap <buffer><silent> q :close<CR>]]

-- @TODOUA: try to get a lot of this buffer switching logic moved somewhere better
-- handle darkening terminal buffers & highlighting active term buffer, set default isSplit = 0. Will be set as needed
vim.cmd [[au TermOpen,TermEnter * let b:isSplit=0 | setlocal nonu nornu winhighlight=Normal:DarkenedTerm,NormalNC:DarkenedTermNC | execute 'keepalt' 'file' fnamemodify(getcwd() . '   '. bufnr('%'), ':t')]]

-- when leaving terminal buffer in split, unlist it (if specified in b:isSplit)
vim.cmd [[
	augroup UnlistSplitTerms
	  autocmd!
    autocmd BufLeave * if &buftype == 'terminal' && b:isSplit  | setlocal nobuflisted | endif
  augroup end
]]

-- if buftype is terminal and isSplit then turn off bn/bp maps & alert
vim.cmd [[
	augroup UnsetBufTermSwitchMaps
	  autocmd!
    autocmd BufEnter * if &buftype == 'terminal' && b:isSplit  | nnoremap <buffer><silent><localleader><left> :echom 'No buffer switching (bn/bp maps) in this split terminal! See isSplit or buflisted.'<CR> | nnoremap <buffer><silent><localleader><right> :echom 'No buffer switching (bn/bp maps) in this split terminal! Toggle isSplit or set buflisted.'<CR> | endif
  augroup end
]]

-- auto exit insert mode
-- vim.api.nvim_exec(
--   [[
--   augroup AutoExitInsertMode
--     autocmd!
--     autocmd CursorHoldI * stopinsert
--   augroup end
-- ]],
--   false
-- )

-- set markdown FTs
vim.api.nvim_exec(
  [[
  augroup SetMarkdownFt
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,*.MD  set ft=markdown
  augroup end
]],
  false
)

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- turn on cursorline, cursorcolumn when searching, sync with hlsearch
vim.api.nvim_exec(
  [[
augroup nvim-incsearch-cursorline
	autocmd!
	autocmd CmdlineEnter /,\? :set cursorline cursorcolumn hlsearch
augroup END
]],
  false
)

vim.cmd [[
" header files should be treated like .c files
autocmd BufRead,BufNewFile *.h set filetype=c

" Options in VimL form
set termguicolors
" syntax highlight only to 1K instead of default 3K
set synmaxcol=1000

let &packpath=&runtimepath
set dictionary+=/usr/share/dict/words
set wildignore+=*/node_modules/*,*/coverage/*
" set guicursor=
set clipboard=unnamedplus
set undodir=~/.config/nvim/undodir
set undofile
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m
]]

-- THEME stuff
vim.cmd "set fillchars+=vert:│"
vim.cmd "colorscheme codesmell_dark"
vim.cmd "filetype plugin indent on"

-- Options/Settings **
-- Window scope
-- @TODO: Change these to be using `opt`
vim.wo.number = true
vim.wo.relativenumber = false

-- Global scope
vim.o.completeopt = "menu,menuone,preview,noselect,noinsert"
vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 1
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showcmd = false
-- @TODO: consider using the global `cursorhold_updatetime` from FixCursorHold
vim.o.updatetime = 2000
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.pumblend = 5
vim.cmd [[hi PmenuSel blend=0]]

-- autocomplete
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess = opt.shortmess + { c = true }

-- Global Vim vars that are on a solo-ish mission **
-- vim.g.fzf_gh_website = 1
vim.g.matchup_matchparen_deferred = 1
-- * Colorizer *
-- auto color fts
vim.g.colorizer_auto_filetype = "yaml,zsh,zsh-theme,lua,vim,json"
-- keep colorizing on bufleave
vim.g.colorizer_disable_bufleave = 1

-- vim-test settings (JavaScript only)
-- NOTE: I don't have any of these configured. Just adding it for the future
-- https://github.com/vim-test/vim-test
-- @TODOUA: Need to figure out how to setlocal in ftplugin
-- -- I really don't want these globals
vim.g.coverage_sign_uncovered = ""
-- Specify the path to `coverage.json` file relative to your current working directory.
vim.g.coverage_json_report_path = "coverage/coverage-final.json"
-- @TODOUA: if we have to keep these global then finish Luatizing
vim.api.nvim_exec(
  [[
" Define the symbol display for covered lines
let g:coverage_sign_covered = ''

" Define the interval time of updating the coverage lines
let g:coverage_interval = 3000

" Do not display signs on covered lines
let g:coverage_show_covered = 0

" Display signs on uncovered lines
let g:coverage_show_uncovered = 1

let g:test#runner_commands = ['Jest']
]],
  false
)
-- * End of vim-test settings * --

-- indent-blankline (& list) settings
-- https://github.com/lukas-reineke/indent-blankline.nvim
-- g:indent_blankline_disable_with_nolist not working for me (19-Nov-2021)
vim.opt.list = false
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "trail:"

require("indent_blankline").setup {
  --space_char_blankline = " ",
  buftype_exclude = { "terminal", "help", "telescope", "NvimTree"},
  show_current_context = true,
  use_treesitter = true,
  enabled = true,
  -- in theme
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
}

local M = {}
-- boolify strings!
-- TODO: don't think I need this anymore ...
local toBool = {
  ["1"] = true,
  ["0"] = false,
}

-- toggle search crosshairs
function M.toggle_crosshairs()
  local current_win = vim.api.nvim_get_current_win()
  vim.api.nvim_set_option("hlsearch", not vim.api.nvim_get_option "hlsearch")
  vim.cmd [[windo :lua vim.api.nvim_win_set_option(0, 'cursorline', vim.api.nvim_get_option 'hlsearch')
]]
  vim.cmd [[windo :lua vim.api.nvim_win_set_option(0, 'cursorcolumn', vim.api.nvim_get_option 'hlsearch')
]]
  vim.api.nvim_set_current_win(current_win)
end

return M
