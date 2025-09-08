set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua << EOF
require('gitsigns').setup()
require('scrollview.contrib.gitsigns').setup({
    enabled = true,
    only_first_line = false,
    hide_full_add = false,
})
require('scrollview.contrib.coc').setup({
    enabled = true,
    severities = { 'error', 'warn' },
})
EOF
