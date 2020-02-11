""" Keybindings

let mapleader="\<space>"

" window and tab switching.
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-pageup> :tabprevious<CR>
nnoremap <c-pagedown> :tabnext<CR>

" Better indenting.
vnoremap > >gv
vnoremap < <gv

" Close all buffers, panes, etc.
nnoremap <silent> <leader>1 :bufdo bd<CR>:Startify<CR>

" Text objects
vnoremap i/ :<C-u>silent! normal! T/vt/<CR>
omap i/ :normal vi/<CR>

vnoremap a/ :<C-u>silent! normal! T/vf/<CR>
omap a/ :normal va/<CR>

vnoremap i_ :<C-U>silent! normal! T_vt_<CR>
omap i_ :normal vi_<CR>

vnoremap a_ :<C-U>silent! normal! T_vf_<CR>
omap a_ :normal va_<CR>

runtime indent-text-object.vim

runtime upload.vim

command! -nargs=1 Note :exec "e ~/Documents/notes/" . strftime("%Y-%m-%d-") . "<args>.md"


" FZF
function! s:Find_root()
    let dir = finddir('.git/..', ';')
    if !empty(dir)
        call fzf#vim#gitfiles('. -co --exclude-standard')
    else
        execute 'FZF' dir
    endif
endfunction

nnoremap <silent> <Leader><Space> :nohlsearch<CR>
nnoremap <leader>f :call <sid>Find_root()<CR>
nnoremap <leader>F :Files<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>n :Files ~/Documents/notes<CR>
nnoremap <silent> <leader>p :call fzf#run({'dir': '$HOME/Code', 'source': 'find . -maxdepth 1 -type d -printf "%f\n" \| sort -r', 'sink': 'cd'})<CR>
nnoremap <leader>c :Colors<CR>
"nnoremap <leader>t :NERDTreeToggle<CR>
"nnoremap <leader>t :Lex<CR>
nnoremap <leader>t :Defx -split=vertical -winwidth=30 -direction=topleft -toggle<CR>
"nnoremap <leader>x :exec 'NERDTree ' . stdpath('config')<CR>
"nnoremap <leader>x :exec 'Lex ' . stdpath('config')<CR>
nnoremap <leader>x :Defx -split=vertical -winwidth=30 -direction=topleft ~/.config/nvim/ -toggle<CR>


" which-key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {
    \ 'p': 'open project',
    \ '1': 'close all files',
    \ 'f': 'open file',
    \ 'F': 'open any file',
    \ 'r': 'upload file',
    \ 'R': 'upload directory',
    \ 'T': 'upload project',
    \ 'n': 'open note',
    \ 'c': 'change colorscheme',
    \ 't': 'toggle sidebar',
    \ 'x': 'settings'
    \ }
