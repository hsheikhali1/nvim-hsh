local config = require('harun.config')

local cmd = vim.cmd local opt = vim.opt local g = vim.g

-- default indent
local indent = config.indent

cmd([[
	filetype plugin indent on
	autocmd BufWritePre * :%s/\s\+$//e
]])

cmd([[
  augroup golang
    autocmd!
  augroup END

  autocmd golang FileType go setlocal shiftwidth=4 tabstop=4
]])

cmd([[
  augroup html
    autocmd!
  augroup END

  autocmd html FileType html setlocal shiftwidth=4 tabstop=4
]])

-- useful commands
vim.cmd [[ autocmd FileType help,qf,fugitive,fugitiveblame,netrw, nnoremap <buffer><silent> q :close<CR>]]

-- set markdown FTs
vim.api.nvim_exec(
	[[
	augroup SetMarkdownFt
		autocmd!
		autocmd BufNewFile,BufFilePre,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,*MD, set ft=markdown
]], false)

-- mapleader
g.mapleader = ','

-- misc
opt.backspace = { 'eol', 'start', 'indent' }
opt.clipboard = 'unnamedplus'
opt.encoding = 'utf-8'
opt.syntax = 'enabled'

-- indentation
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent

-- search
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = opt.wildignore + { '*/node_modules/*', '*/.git/*', '*/vendor/*' }
opt.wildmenu = true

-- ui
opt.cursorline = true
opt.laststatus = 2
opt.lazyredraw = true
--opt.list = true
--vim.opt.listchars:append("eol:↴")
opt.mouse = 'a'
opt.number = true
opt.rnu = false
opt.scrolloff = 18
opt.showmode = false
opt.sidescrolloff = 3 -- Lines to scroll horizontally
opt.signcolumn = 'yes'
opt.splitbelow = true -- Open new split below
opt.splitright = true -- Open new split to the right
opt.wrap = true

-- backups
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- autocomplete
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess = opt.shortmess + { c = true }

-- perfomance
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 100

-- theme
opt.termguicolors = true
vim.cmd([[
set background=dark
]])


-- tagalong doesnt have a lua package so need to set settings here
vim.g.tagalong_filetypes = {'html', 'javascriptreact', 'javascript', 'typescript', 'typescriptreact'}
-- nvim blankline
vim.g.indent_blankline_filetype_exclude = { 'NvimTree', 'terminal' }
vim.g.indentLine_bufNameExclude = { 'NvimTree', 'terminal' }
vim.g.indentLine_bufTypeExclude = { 'terminal', 'NvimTree' }

-- globals for deno
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
