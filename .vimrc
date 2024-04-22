call plug#begin()
Plug 'juanedi/predawn.vim'
Plug 'mhinz/vim-startify'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe'
Plug 'tmhedberg/matchit'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-visual-multi'
Plug 'github/copilot.vim'
call plug#end()

set rtp+=~/.vim/bundle/fzf

set t_Co=256 "256 color
set bg=light

colorscheme predawn

" Deal with TMUX
if &term =~ '^screen'
	if has("mouse_sgr")
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	end
endif

" Key remappings
let mapleader = ';'
command W w
command Wq wq
command WQ wq
command Q q

" Use line cursor when in insert mode and block cursor everywhere else
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

" Swapping between buffers
nnoremap <Leader>1 :buffer 1<CR>
nnoremap <Leader>2 :buffer 2<CR>
nnoremap <Leader>3 :buffer 3<CR>
nnoremap <Leader>4 :buffer 4<CR>
nnoremap <Leader>5 :buffer 5<CR>
nnoremap <Leader>6 :buffer 6<CR>
nnoremap <Leader>7 :buffer 7<CR>
nnoremap <Leader>8 :buffer 8<CR>
nnoremap <Leader>9 :buffer 9<CR>
nnoremap <Leader>w :bfirst<CR>
nnoremap <Leader>s :blast<CR>
nnoremap <Leader>a :bprev<CR>
nnoremap <Leader>d :bnext<CR>

" Make j move cursor up and k move cursor down
nnoremap j gk
nnoremap k gj

set fillchars=vert:│

set nocompatible  "Kill vi-compatibility
set encoding=utf-8 "UTF-8 character encoding

" Indent 4 spaces
set tabstop=4  "4 space tabs
set shiftwidth=4  "4 space shift
set softtabstop=4  "Tab spaces in no hard tab mode
set expandtab  " Expand tabs into spaces
set autoindent  "autoindent on new lines
set smartindent

set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately

set mouse=a
set number
set ic
set confirm
set hidden
set whichwrap+=<,>,h,l,[,]
set showmatch  "Highlight matching braces
set equalalways  "Split windows equal size
set ruler  "Show bottom ruler
set colorcolumn=120
set formatoptions=croq  "Enable comment line auto formatting
set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set nowrap "No line wrapping
set sidescroll=1  "Scroll horizontally one column at a time
set lazyredraw  "Don't redraw while running macros (faster)
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position
set updatetime=100

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile,BufRead *.md set filetype=markdown

hi LineNr term=bold cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=Gray guibg=NONE
hi SpellBad ctermbg=red guibg=red ctermfg=black guifg=black
hi clear SignColumn
hi GitGutterAdd guifg=#009900 ctermfg=2
hi GitGutterChange guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guifg=#ff2222 ctermfg=1

let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#buffer_min_count = 2

" Make remove git gutter the minus sign
let g:gitgutter_sign_removed = '-'

" Do not display documentation on hover
let g:ycm_auto_hover = ''

" Hide annoying text highlighting
let g:ycm_show_diagnostics_ui = 0

" Display documentation on <leader>
nmap <silent> <leader>q <plug>(YCMHover)
" Disable preview window
set completeopt-=preview
" Add borders to documentation popups
let b:ycm_hover = {
\   'command': 'GetDoc',
\   'syntax': &filetype,
\   'popup_params': {
\       'border': [],
\       'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
\   }
\ }

" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_python = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "left"
nmap <silent> <C-B> :NERDTreeToggle<CR>

nmap <silent> <C-f> :Rg<CR>
nmap <silent> <leader>f :Files<CR>

" Disable Copilot for large files
autocmd BufReadPre *
    \ let f=getfsize(expand("<afile>"))
    \ | if f > 100000 || f == -2
    \ | let b:copilot_enabled = v:false
    \ | endif
