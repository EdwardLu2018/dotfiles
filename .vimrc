call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'juanedi/predawn.vim'
Plug 'mhinz/vim-startify'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/matchit'
Plug 'luochen1990/rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-visual-multi'
Plug 'github/copilot.vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
call plug#end()

set rtp+=~/.vim/plugged/fzf

set t_Co=256 "256 color
set bg=dark

colorscheme gruvbox

" Deal with TMUX
if !has('nvim')
    if &term =~ '^screen'
        if has("mouse_sgr")
            set ttymouse=sgr
        else
            set ttymouse=xterm2
        end
    endif
endif

" Key remappings
let mapleader = ';'
command W w
command Wq wq
command WQ wq
command Q q

" Use leader-s for saving
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>

" Use CTRL-q with confirmation prompt
noremap <C-Q> :confirm qa<CR>

" Use line cursor when in insert mode and block cursor everywhere else
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

" Swapping between buffers
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
" nnoremap <Leader>w :bfirst<CR>
" nnoremap <Leader>s :blast<CR>
nnoremap <Leader>a :bprev<CR>
nnoremap <Leader>d :bnext<CR>
nnoremap <Leader>x :bprev<CR>:bdelete #<CR>

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
set history=1000  "Store more history
set nobackup  "No backup files
set equalalways  "Split windows equal size
set ruler  "Show bottom ruler
set colorcolumn=120
set formatoptions=croq  "Enable comment line auto formatting
set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set nowrap  "No line wrapping
set sidescroll=1  "Scroll horizontally one column at a time
set lazyredraw  "Don't redraw while running macros (faster)
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set signcolumn=yes "Always show sign column
set nostartofline "Vertical movement preserves horizontal position
set autoread  "Auto read file changes
set updatetime=100
set ttimeoutlen=0

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" Set filetypes
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.vs,*.fs,*.gs,*.vsh,*.fsh,*.gsh,*.vshader,*.fshader,*.gshader,*.vert,*.frag,*.geom,*.tesc,*.tese,*.comp,*.glsl set filetype=glsl

" Set colors
" set termguicolors
hi LineNr term=bold cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=Gray guibg=NONE
hi SpellBad ctermbg=1 guibg=#FF0000 ctermfg=black guifg=black
hi clear SignColumn
hi GitGutterAdd guifg=#009900 ctermfg=2
hi GitGutterChange guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guifg=#ff2222 ctermfg=1

let g:airline_theme="gruvbox"
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number
let g:airline#extensions#tabline#formatter = 'short_path' " show directory/filename
let g:airline#extensions#tabline#enabled = 1  " show buffer list
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Enable rainbow parentheses
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['goldenrod', 'darkorchid', 'dodgerblue'],
\	'ctermfgs': ['darkyellow', 'magenta', 'lightblue'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'nerdtree': 0,
\	}
\}

" Better c++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

" Make '-' git gutter the minus sign
let g:gitgutter_sign_removed = '-'

" Disable preview window
set completeopt-=preview

let g:NERDCreateDefaultMappings = 1  " Create default mappings
let g:NERDSpaceDelims = 1  " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1  " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'  " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_python = 1  " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }  " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1  " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1  " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDTreeMinimalUI = 1  " Start NERDTree in minimal UI mode (No help lines)
let g:NERDTreeShowHidden = 1  " Show hidden files
let g:NERDTreeWinPos = "left"  " Set NERDTree window position

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <silent> <C-B> :NERDTreeToggle<CR>

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use shift-tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<S-Tab>" :
      \ coc#refresh()

" fzf commands
nmap <silent> <C-f> :Rg<CR>
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>b :Buffers<CR>

" Disable Copilot for large files
autocmd BufReadPre *
    \ let f=getfsize(expand("<afile>"))
    \ | if f > 100000 || f == -2
    \ | let b:copilot_enabled = v:false
    \ | endif
