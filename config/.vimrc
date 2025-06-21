" ========================================
" Vim Configuration for Coding (Arch i3 Style)
" ========================================

" General Settings
set nocompatible              " Disable compatibility with vi
filetype off                  " Required for plugin loading

" ========================================
" Plugin Manager (vim-plug)
" ========================================
" Auto-install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File Explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Syntax Highlighting & Language Support
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" Dark Theme (Arch i3 Compatible)
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Code Completion & IntelliSense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Code Formatting
Plug 'editorconfig/editorconfig-vim'

" File Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()

" ========================================
" Basic Settings
" ========================================
filetype plugin indent on    " Enable file type detection
syntax enable                 " Enable syntax highlighting

" Interface
set number                    " Show line numbers
set relativenumber           " Show relative line numbers
set cursorline               " Highlight current line
set showcmd                  " Show command in bottom bar
set wildmenu                 " Visual autocomplete for command menu
set lazyredraw               " Redraw only when necessary
set showmatch                " Highlight matching brackets

" Search
set incsearch                " Show search results as you type
set hlsearch                 " Highlight search results
set ignorecase               " Case insensitive searching
set smartcase                " Case sensitive if search contains uppercase

" Indentation
set autoindent               " Auto indent
set smartindent              " Smart indent
set tabstop=4                " Tab width
set shiftwidth=4             " Indent width
set expandtab                " Use spaces instead of tabs
set softtabstop=4            " Soft tab stop

" Performance
set updatetime=300           " Faster completion
set timeoutlen=500           " Faster key response
set laststatus=2             " Always show status line

" Backup and Swap
set nobackup                 " No backup files
set nowritebackup           " No backup before overwriting
set noswapfile              " No swap files

" ========================================
" Theme Configuration (Dark - i3 Style)
" ========================================
set termguicolors            " Enable true color support
set background=dark

" Set colorscheme (Gruvbox matches i3 aesthetic well)
try
    colorscheme gruvbox
catch
    colorscheme default
endtry

" Make background transparent (matches terminal)
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE

" ========================================
" Plugin Configurations
" ========================================

" NERDTree Configuration
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 35
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']

" Auto-open NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline Configuration
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" GitGutter Configuration
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

" ALE (Linting) Configuration
let g:ale_enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" CoC Configuration
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-clangd',
  \ 'coc-go',
  \ 'coc-rust-analyzer'
  \]

" FZF Configuration
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \}

" ========================================
" File Type Specific Settings
" ========================================
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType markdown setlocal wrap linebreak

" ========================================
" Custom Commands
" ========================================
" Toggle NERDTree
command! Explorer NERDTreeToggle

" Quick file search
command! Files FZF

" Search in files
command! -nargs=* Search Rg <args>

" ========================================
" Key Mappings
" ========================================
" Toggle NERDTree with Ctrl+B
nnoremap <C-b> :NERDTreeToggle<CR>

" ========================================
" Auto Commands
" ========================================
" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Highlight yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" ========================================
" Status Line Info
" ========================================
" Show git branch, file info, and linting status
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P 