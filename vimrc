filetype off                  " required
filetype plugin indent on
set nocompatible              " be iMproved, required
set number
set t_Co=256
syntax on
:let mapleader = "-"
noremap H <NOP>
noremap J <NOP>
noremap K <NOP>
noremap L <NOP>


execute pathogen#infect()
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required " " To ignore plugin indent changes, instead use: " "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line


source /usr/share/vim/google/google.vim
" Auto compelete.
Glug youcompleteme-google
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" Auto format for build.
Glug codefmt
Glug codefmt-google
autocmd FileType bzl,blazebuild AutoFormatBuffer buildifier
"autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"autocmd FileType java AutoFormatBuffer google-java-format
"autocmd FileType jslayout AutoFormatBuffer jslfmt
"autocmd FileType go AutoFormatBuffer gofmt
"autocmd FileType python AutoFormatBuffer pyformat

" ,pd , pf, po
Glug piper plugin[mappings]=',p'
Glug relatedfiles plugin[mappings]='<leader>rf'
Glug g4
" code snippet.
Glug ultisnips-google
" Support code search, current file search.
Glug corpweb plugin[mappings]
noremap <unique> <leader>cs :CorpWebCs<Space>
" -bb, -bt for build and test.
Glug blaze plugin[mappings]='<leader>b'
" :BlazeDepsUpdate to add all deps on the target
Glug blazedeps
" Code index.
Glug grok
" :GoogleOutlineWindow /  :QuickOutline <pattern> <optional filetype>
Glug outline-window
nnoremap <leader>o :GoogleOutlineWindow<CR>
nnoremap <leader>q :QuickOutline
" select -> yank -> cmd -> change -> enter!
Glug refactorer

Glug clang-format plugin[mappings]
" Remap the ultisnip keys
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
noremap <C-K> :pyf /usr/lib/clang-format/clang-format.py<CR>
inoremap <C-K> <C-O>:pyf /usr/lib/clang-format/clang-format.py<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1

