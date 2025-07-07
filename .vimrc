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
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi'
Plug 'github/copilot.vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-grepper'
Plug 'ntpeters/vim-better-whitespace'
Plug 'szw/vim-maximizer'
Plug 'TaDaa/vimade'
call plug#end()

set rtp+=~/.vim/plugged/fzf

" Set FZF options
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore --glob "!.git/*"'

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
set splitbelow
set splitright

" Clear search highlights.
map <Leader><Space> :let @/=''<CR>

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

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
" Use CTRL-s for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Use CTRL-q for quitting with confirmation
noremap <C-Q> :confirm qa<CR>
" Use leader-q for quitting with confirmation
noremap <Leader>q :confirm qa<CR>

" Use leader-t to open a new tab
map <Leader>t :tabnew<CR>

" Use leader-z to toggle maximizer
nmap <Leader>z :MaximizerToggle<CR>
" Use CTRL-wz to toggle maximizer
nnoremap <C-W>z :MaximizerToggle<CR>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew ~/.vimrc<CR>

" Source Vim config file
map <Leader>sv :source ~/.vimrc<CR>

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
nnoremap <Leader>a :bprev<CR>
nnoremap <Leader>d :bnext<CR>
nnoremap <Leader>x :bprev<CR>:bdelete #<CR>
" nnoremap <Leader>w :bfirst<CR>
" nnoremap <Leader>s :blast<CR>

" Set filetypes
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.vs,*.fs,*.gs,*.vsh,*.fsh,*.gsh,*.vshader,*.fshader,*.gshader,*.vert,*.frag,*.geom,*.tesc,*.tese,*.comp,*.glsl set filetype=glsl

let g:airline_theme="gruvbox"
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number
let g:airline#extensions#tabline#formatter = 'short_path' " show directory/filename
let g:airline#extensions#tabline#enabled = 1  " show buffer list
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#buffer_idx_mode = 1

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Grepper settings
let g:grepper={}
let g:grepper.tools=["rg"]
let g:grepper.rg = {
  \ 'grepprg': 'rg --vimgrep --smart-case --hidden --glob "!.git/*"'
\ }

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
    \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Dim inactive windows
let g:vimade = {}
let g:vimade.fadelevel = 0.8

" Strip trailing whitespace
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1

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

" Better C++ highlighting
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
let g:NERDTreeAutoDeleteBuffer=1  " Automatically delete the buffer when closing NERDTree
let g:NERDTreeWinPos = "left"  " Set NERDTree window position

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Close NERDTree if it's the only window open
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

" FZF commands
nmap <silent> <C-f> :Rg<CR>
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>b :Buffers<CR>

" Disable Copilot for large files
autocmd BufReadPre *
    \ let f=getfsize(expand("<afile>"))
    \ | if f > 100000 || f == -2
    \ | let b:copilot_enabled = v:false
    \ | endif

" Set colors
hi LineNr term=bold cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=Gray guibg=NONE
hi SpellBad ctermbg=1 guibg=#FF0000 ctermfg=black guifg=black
hi clear SignColumn
hi GitGutterAdd guifg=#009900 ctermfg=2
hi GitGutterChange guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guifg=#ff2222 ctermfg=1
