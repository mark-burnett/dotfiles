set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'cespare/vim-bclose'
" Plugin 'vim-syntastic/syntastic'
Plugin 'sjbach/lusty'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'ekalinin/Dockerfile.vim'
" Plugin 'cespare/vim-toml'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'vimwiki/vimwiki'

Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'

call vundle#end()

filetype plugin indent on

" nmap r :NextColorScheme<CR>
nmap <F9> :PrevColorScheme<CR>


" ----------------------------------------------------------------------------
" - Initial configuration                                                    -
" ----------------------------------------------------------------------------

" Store swap and backup files in a less obnoxious location
let tempdir = expand("/tmp/$USER-vim-temp")
if (!isdirectory(tempdir))
    call mkdir(tempdir, "p")
endif
let &directory = tempdir
let &backupdir = tempdir


" Map a leader
let mapleader=','
let maplocalleader=','

" Basic UI features
set number
set nocompatible
set ruler
set showcmd
set showmode

set lazyredraw

set wildmenu
set lazyredraw
set mouse=a
set wildignore=*.rs.bk,__pycache__,*.pyc,*.o

set ttyfast

" More intuitive backspace
set backspace=indent,eol,start

" More intuitive split orientation -- not sure I care about this.
set splitbelow
set splitright


" ----------------------------------------------------------------------------
" - File explorer configuration                                              -
" ----------------------------------------------------------------------------
" Ignore some files in the file explorer
let g:netrw_list_hide='\.swp$,\.bk$,\.pyc$,\(^\|\s\s\)\zs\.\S\+'


" ----------------------------------------------------------------------------
" - History configuration                                                    -
" ----------------------------------------------------------------------------
set history=50


" ----------------------------------------------------------------------------
" - Search configuration                                                     -
" ----------------------------------------------------------------------------
set hlsearch
set incsearch
nmap <silent> <space> :nohlsearch<CR>


" ----------------------------------------------------------------------------
" - Window configuration                                                     -
" ----------------------------------------------------------------------------
" Window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


" ----------------------------------------------------------------------------
" - Buffer configuration                                                     -
" ----------------------------------------------------------------------------
" Keep buffer open when closing a file
set hidden
" Command to keep window open, but delete buffer
nmap <Leader>x :Kwbd<CR>


" ----------------------------------------------------------------------------
" - Default indentation                                                      -
" ----------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
" Let backspace erase 4 spaces to the last tabstop
set softtabstop=4

set autoindent
set sm


" ----------------------------------------------------------------------------
" - Plugin configuration                                                     -
" ----------------------------------------------------------------------------

" Gundo provides an ascii art view of the undo tree.
nmap <silent> U :GundoToggle<CR>
let g:gundo_width = 40
let g:gundo_preview_bottom = 1

" Fugitive is a git plugin.
" Automatically delete hidden fugitive buffers.
autocmd BufReadPost fugitive://* set bufhidden=delete

let g:syntastic_html_tidy_ignore_errors=["proprietary attribute"]

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsSnippetDir = "$HOME/.vim/UltiSnips"

let g:vimwiki_list = [{'auto_toc': 1}]
let g:vimwiki_table_mappings = 0

" ----------------------------------------------------------------------------
" - Colors                                                                   -
" ----------------------------------------------------------------------------

" Syntax hilighting
syntax enable

" Colors
set background=dark
" 256-jungle bvemu distinguished Monokai Monokai-chris
" devbox-dark-256 kellys
" obsidian
" 256-grayvim
silent! colorscheme 256-grayvim

" g:landscape_highlight_url ?


" ----------------------------------------------------------------------------
" - File Formatting                                                          -
" ----------------------------------------------------------------------------

" Show unwanted white space
highlight ExtraWhitespace ctermbg=Red guibg=Red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
set list listchars=tab:»·,trail:·,precedes:«,extends:»

" Highlight too-wide lines
" augroup vimrc_autocmds
"     autocmd BufEnter * highlight OverLength ctermbg=magenta ctermfg=white
"     autocmd BufEnter * match OverLength /\%81v./
" augroup END

" Remove unwanted white space
nnoremap <silent> <Leader>w :%retab<Bar>:let _s=@/<Bar>:%s/\s\+$//e<Bar>
            \:let @/=_s<Bar>:nohl<CR> <C-O>

" Make Q auto-reformat paragraphs
nmap <silent> Q gqap


" ----------------------------------------------------------------------------
" - Filetype detection                                                       -
" ----------------------------------------------------------------------------
" Force *.md to be for markdown, not modula...
autocmd BufNewFile,BufRead *.md set ft=markdown

autocmd Filetype json setlocal sw=2 sts=2 ts=2
autocmd Filetype markdown setlocal sw=2 sts=2 ts=2 spell
autocmd Filetype puppet setlocal sw=2 sts=2 ts=2
autocmd Filetype ruby setlocal sw=2 sts=2 ts=2
autocmd Filetype vimwiki setlocal sw=2 sts=2 ts=2 spell
autocmd Filetype yaml setlocal sw=2 sts=2 ts=2

autocmd Filetype rst set spell


" ----------------------------------------------------------------------------
" - Status line                                                              -
" ----------------------------------------------------------------------------

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" ----------------------------------------------------------------------------
" - Misc scripts and configuration                                           -
" ----------------------------------------------------------------------------
" Make Y work like D and C
nmap <silent> Y y$

" Use F2 to turn on and off paste mode
set pastetoggle=<F2>

" From Bram:
"   " When editing a file, always jump to the last known cursor position.
"   " Don't do it when the position is invalid or when inside an event handler
"   " (happens when dropping a file on gvim).
"   " DF - Also do not do this if the file resides in the $TEMP directory,
"   "      chances are it is a different file with the same name.
"   " This comes from the $VIMRUNTIME/vimrc_example.vim file
autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g`\"" |
    \     let b:doopenfold = 1 |
    \   endif |
    \ endif
" Need to postpone using "zv" until after reading the modelines.
autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   unlet b:doopenfold |
    \   exe "normal zv" |
    \ endif
