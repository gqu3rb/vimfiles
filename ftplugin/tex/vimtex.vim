" refer from: https://github.com/lervag/vimtex/issues/1585
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" prevent from Error:219 Missing {.
set isfname-={,}
set conceallevel=1
let g:vimtex_quickfix_mode=2
let g:tex_conceal='abdmg'

" Eanble XeLaTex
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

" --------------- key mapping --------------- "
let maplocalleader = ";" 

" first		meannings
" [		last
" ]		next
" second
" [		start of section	
" ]		end of section
" e		start of environment
" E		end of environment
" m		start of math (original: item)
" M		end of math (original: item)
" i		item
nnoremap [e <plug>(vimtex-[m)
xnoremap [e <plug>(vimtex-[m)
onoremap [e <plug>(vimtex-[m)

nnoremap ]e <plug>(vimtex-]m)
xnoremap ]e <plug>(vimtex-]m)
onoremap ]e <plug>(vimtex-]m)

nnoremap [E <plug>(vimtex-[M)
xnoremap [E <plug>(vimtex-[M)
onoremap [E <plug>(vimtex-[M)

nnoremap ]m <plug>(vimtex-]n)
xnoremap ]m <plug>(vimtex-]n)
onoremap ]m <plug>(vimtex-]n)

nnoremap ]M <plug>(vimtex-]N)
xnoremap ]M <plug>(vimtex-]N)
onoremap ]M <plug>(vimtex-]N)

" Use `am` and `im` for the inline math text object
onoremap am <Plug>(vimtex-a$)
xnoremap am <Plug>(vimtex-a$)
onoremap im <Plug>(vimtex-i$)
xnoremap im <Plug>(vimtex-i$)

" Use `ai` and `ii` for the item text object
onoremap ai <Plug>(vimtex-am)
xnoremap ai <Plug>(vimtex-am)
onoremap ii <Plug>(vimtex-im)
xnoremap ii <Plug>(vimtex-im)

noremap <leader>wc <Cmd>VimtexCountWords<CR>
" --------------- key mapping --------------- "
