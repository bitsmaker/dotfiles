set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'pwntester/nvim-lsp'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

set nocompatible                " choose no compatibility with legacy vi
syntax on
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set history=1000
set cursorline
hi CursorLine ctermbg=15 ctermfg=8 "8 = dark gray, 15 = white
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

"" Whitespace
set nowrap                      " don't wrap lines
set autoindent                  " Indent at the same level of the previous line
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...

set hidden
set nobackup
set noswapfile


set background=dark
colorscheme solarized

set spell
set visualbell
set mouse=v

if executable('rg')
   set grepprg=rg\ -i\ --vimgrep
endif

autocmd BufNewFile,BufRead *.txt setfiletype text
autocmd BufNewFile,BufRead *.log setfiletype text
autocmd BufRead,BufNewFile *.ts setfiletype typescript
autocmd BufRead,BufNewFile *.md setfiletype markdown
autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc setfiletypes json

autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak

autocmd FileType typescript :set makeprg=tsc
autocmd FileType sh,c,cc,cpp,python,typescript,go,control setlocal number
autocmd FileType sh,c,cc,cpp,python,typescript,go,control set foldmethod=syntax

autocmd BufWritePost .vimrc source $MYVIMRC
autocmd BufWritePre * %s/\s\+$//e

nnoremap ,oc :e %<.cc<CR>
nnoremap ,oC :e %<.cpp<CR>
nnoremap ,oh :e %<.h<CR>

nnoremap ,gb :Buffers<CR>

nnoremap ,mf :GFiles?<CR>
nnoremap ,gib :Git blame<CR>
nnoremap ,gsh :Git show %<CR>
nnoremap ,ld :w !diff % -

nnoremap ,sw :grep! "<C-R><C-W>"<CR>:cw<CR>
nnoremap ,sd :grep! "<C-R><C-W>"<CR>:cw %:p:h/*<CR>

nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>
nnoremap ,fb <cmd>Telescope buffers<cr>
nnoremap ,fh <cmd>Telescope help_tags<cr>

map <F12> :Vexplore<CR>

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

set guicursor=

set exrc
set secure
set nofoldenable
