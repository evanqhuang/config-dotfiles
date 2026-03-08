" =============================================================================
" General
" =============================================================================
set nocompatible
set encoding=UTF-8
let mapleader = " "

" =============================================================================
" Indentation
" =============================================================================
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" =============================================================================
" UI
" =============================================================================
set number
set ruler
set background=dark
"set termguicolors
set laststatus=2
set title
syntax on
filetype indent plugin on

"display full filepath all the time and line/col num
set statusline+=%F\ %l\:%c

" =============================================================================
" Key Mappings
" =============================================================================

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Run Python file with <space>r
autocmd FileType python nnoremap <leader>r :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 python "%"<CR>

" =============================================================================
" Plugin Manager (vim-plug)
" =============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Utility
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'benmills/vimux'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'

" Linting
Plug 'dense-analysis/ale'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Generic Programming Support
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'janko-m/vim-test'

"auto close tag for html
"Plug 'alvan/vim-closetag'
"let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
"let g:closetag_filetypes = 'html,xhtml,phtml'

"auto parenthese etc
"Plug 'jiangmiao/auto-pairs'
"let g:AutoPairsShortcutToggle = '<C-k>'

" Python
Plug 'vim-python/python-syntax'

" Markdown
Plug 'tpope/vim-markdown'

" Git Support
Plug 'tpope/vim-fugitive'
"Plug 'jaxbot/github-issues.vim'

" Metrics
Plug 'wakatime/vim-wakatime'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

call plug#end()

" =============================================================================
" Plugin Config
" =============================================================================

" Python syntax
let g:python_highlight_all = 1

" Deepspace
let g:deepspace_italics=1

" Theme
colorscheme onehalfdark

" Cursor line
set cursorline
hi CursorLineNr   term=bold ctermfg=167 gui=bold guifg=#d75f5f
hi CursorLine term=None ctermfg=none ctermbg=none
"set cursorlineopt=number
