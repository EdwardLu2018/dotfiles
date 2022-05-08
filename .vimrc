execute pathogen#infect()
syntax on
filetype plugin indent on

set rtp+=~/.vim/bundle/fzf

set t_Co=256 "256 color
set bg=light

colorscheme predawn

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
set whichwrap+=<,>,h,l,[,]
set showmatch  "Highlight matching braces
set equalalways  "Split windows equal size
set ruler  "Show bottom ruler
set formatoptions=croq  "Enable comment line auto formatting
set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

" set spelllang=en_us
" set spell

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile,BufRead *.md set filetype=markdown

hi LineNr term=bold cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=Gray guibg=NONE
hi SpellBad ctermbg=red guibg=red ctermfg=black guifg=black

let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#buffer_min_count = 2

let NERDTreeShowHidden=1
map <C-B> :NERDTreeToggle<CR>
nmap <silent> <C-f> :Rg<CR>
nmap <silent> <leader>f :Files<CR>

nnoremap <Leader>1 :buffer 1<CR>
nnoremap <Leader>2 :buffer 2<CR>
nnoremap <Leader>3 :buffer 3<CR>
nnoremap <Leader>4 :buffer 4<CR>
nnoremap <Leader>5 :buffer 5<CR>
nnoremap <Leader>6 :buffer 6<CR>
nnoremap <Leader>7 :buffer 7<CR>
nnoremap <Leader>8 :buffer 8<CR>
nnoremap <Leader>9 :buffer 9<CR>

set fillchars=vert:│

" Useful functions
func! s:strfind(s,find,start)
        if type(a:find)==1
                let l:i = a:start
                while l:i<len(a:s)
                        if strpart(a:s,l:i,len(a:find))==a:find
                                return l:i
                        endif
                        let l:i+=1
                endwhile
                return -1
        elseif type(a:find)==3
                " a:find is a list
                let l:i = a:start
                while l:i<len(a:s)
                        let l:j=0
                        while l:j<len(a:find)
                                if strpart(a:s,l:i,len(a:find[l:j]))==a:find[l:j]
                                        return [l:i,l:j]
                                endif
                                let l:j+=1
                        endwhile
                        let l:i+=1
                endwhile
                return [-1,-1]
        endif
endfunc

func! s:strreplace(s,find,replace)
        if len(a:find)==0
                return a:s
        endif
        if type(a:find)==1 && type(a:replace)==1
                let l:ret = a:s
                let l:i = s:strfind(l:ret,a:find,0)
                while l:i!=-1
                        let l:ret = strpart(l:ret,0,l:i).a:replace.strpart(l:ret,l:i+len(a:find))
                        let l:i = s:strfind(l:ret,a:find,l:i+len(a:replace))
                endwhile
                return l:ret
        elseif  type(a:find)==3 && type(a:replace)==3 && len(a:find)==len(a:replace)
                let l:ret = a:s
                let [l:i,l:j] = s:strfind(l:ret,a:find,0)
                while l:i!=-1
                        let l:ret = strpart(l:ret,0,l:i).a:replace[l:j].strpart(l:ret,l:i+len(a:find[l:j]))
                        let [l:i,l:j] = s:strfind(l:ret,a:find,l:i+len(a:replace[l:j]))
                endwhile
                return l:ret
        endif

endfunc
