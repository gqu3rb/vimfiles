" ---------------Global Setting (Start)---------------
" function
set clipboard=unnamed

" appearence
set number
set hlsearch
set ai
set linebreak
set showtabline=2
syntax on
set ruler
set showcmd
set laststatus=2
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&fenc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
set scrolloff=3

language en_US

" refer to https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f
set backupdir=~/vimfiles/backup_files/
set noswapfile
set undodir=~/vimfiles/undo_files/

" search
set ignorecase
set smartcase
set incsearch

" typing
set backspace=indent,eol,start " refer from: https://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi

" complete menu
set completeopt=menuone
set shortmess+=c " refer from: https://youtu.be/2f8h45YR494?t=479
 " refer from: https://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set complete-=i " refer from: https://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
inoremap <expr><C-J> pumvisible() ? "\<C-n>" : "\<C-J>"
inoremap <expr><C-K> pumvisible() ? "\<C-p>" : "\<C-K>"
" type <Tab> to make autocompletion
set wildcharm=<Tab>
inoremap <expr><Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

set splitbelow
set splitright

" key-mapping

let mapleader=","
 " refer from Practical Vim P.140
noremap \ ,

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

 " reload vimrc
nnoremap <F3> :source $MYVIMRC<CR>:call UltiSnips#RefreshSnippets()<CR>
 " select all
nnoremap yA gg<S-v>Gy<C-o><C-o>
nnoremap dA gg<S-v>Gd<C-o><C-o>
nnoremap vA gg<S-v>G

" encoding settings for editing files with a different encodings
" see ':h usr_45' for details
if has("multi_byte") "from https://blog.gtwang.org/tips/vim-working-with-unicode/
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8

  " setting the encoding list used for writing files.
  " see ':h fileencodings' and ':h encoding-names' for details
  set fileencodings=ucs-bom,utf-8,taiwan,chinese,ansi
endif

" filetype
filetype on
filetype plugin on
filetype plugin indent on

" display line numbers in help files
autocmd FileType help  setlocal number

" file indent. refer from: https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim#:~:text=Within%20Vim%2C%20type%20a%20colon,have%20to%20type%20them%20once.
filetype plugin indent on
" show existing tab with 4 spaces width
autocmd filetype c,cpp,tex,snippets,verilog set tabstop=4
" when indenting with '>', use 4 spaces width
autocmd filetype c,cpp,tex,snippets,verilog set shiftwidth=4
" On pressing tab, insert 4 spaces
autocmd filetype c,cpp,tex,snippets,verilog set expandtab

" save file actions
autocmd BufWritePre * :%s/\s\+$//e " clear spaces in the end of each line
autocmd BufWritePre * :retab " replace the tab character by spaces

" If the Python version in the computer is updated, this line must be modified.
" And all the plugins using Python scripts should be reinstalled after you modify this line.
" The plugins have been known using Python scripts are:
" ultisnips
let &pythonthreedll = 'C:\Users\great\AppData\Local\Programs\Python\Python39\python39.dll'

" Editing XeLaTeX rapidly
cnoremap latex NERDTree d:\nb\Desktop\Regis\tex_test01\test01.tex<CR>/test01.tex<CR><CR>ko

" let NERDTree move to the specified folder rapidly
" cnoremap reg NERDTree d:\nb\Desktop\Regis\
cnoremap regis NERDTree d:\nb\Desktop\Regis\
cnoremap doc NERDTree d:\nb\Documents\
cnoremap nbdoc NERDTree d:\nb\Documents\
cnoremap pcdoc NERDTree d:\PC\文件(含桌面內容、OnDrive)\

" auto brackets completion
autocmd filetype verilog,c,cpp,vim,autohotkey,snippets inoremap ( ()<C-[>i
autocmd filetype verilog,c,cpp,vim,autohotkey,snippets inoremap () ()<C-[>i
autocmd filetype verilog,c,cpp,vim,autohotkey,snippets inoremap [ []<C-[>i
autocmd filetype verilog,c,cpp,vim,autohotkey,snippets inoremap [] []<C-[>i
autocmd filetype verilog,c,cpp,vim,autohotkey,snippets inoremap { {}<C-[>i
autocmd filetype verilog,c,cpp,vim,autohotkey,snippets inoremap {} {}
autocmd filetype verilog,c,cpp,vim,autohotkey,snippets inoremap {<CR> {<CR>}<C-[>O
autocmd filetype verilog,c,cpp,autohotkey,tex inoremap " ""<C-[>i
autocmd filetype verilog,c,cpp,autohotkey,tex inoremap "" ""<C-[>i
autocmd filetype c,cpp,vim,autohotkey inoremap ' ''<C-[>i
autocmd filetype verilog,c,cpp,vim,autohotkey inoremap '' ''<C-[>i

" Plugin
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/AutoComplPop'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

" Initialize plugin system
call plug#end()

" Global setting used by NERDTree
cnoremap nerd NERDTree

" Global setting used by UltiSnips
" refer from: https://ejmastnak.github.io/tutorials/vim-latex/ultisnips.html#:~:text=in%20this%20article.-,First%20steps%3A%20snippet%20trigger%20and%20tabstop%20navigation%20keys,-After%20installing%20UltiSnips
" let g:UltiSnipsExpandTrigger       = 'jk'    " use jk to expand snippets
" let g:UltiSnipsJumpForwardTrigger  = 'jk'    " use jk to move forward through tabstops
" let g:UltiSnipsJumpBackwardTrigger = 'kj'  " use kj to move backward through tabstops
" The three lines above can cause a lag when pressing the 'j' key to go down a
" line in normal mode.

let g:UltiSnipsSnippetDirectories=[$HOME.'/vimfiles/UltiSnips']
" ---------------Global Setting (End)--------------- "

