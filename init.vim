"   ____  ___  ____ _   __(_)___ ___
"  / __ \/ _ \/ __ \ | / / / __ `__ \
" / / / /  __/ /_/ / |/ / / / / / / /
"/_/ /_/\___/\____/|___/_/_/ /_/ /_/

""" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-sensible'

Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-startify'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'

Plug 'kkoomen/vim-doge'

Plug 'arcticicestudio/nord-vim'

call plug#end()

""" Basic Settings
set number ignorecase smartcase undofile list formatoptions+=nj
set fillchars=vert:\ ,fold:\  listchars=tab:⎸\ ,nbsp:⎕
set linebreak showbreak=↪\  breakindent breakindentopt=shift:-2
set backupdir=~/.vim/backup directory=~/.vim/swap

set termguicolors
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_italic_comments = 1
colorscheme nord

set guifont=Source\ Code\ Pro\ 11
set guioptions-=mrLtT
set mouse=a

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_hide = 1
autocmd FileType netrw set nolist

" Preserve clipboard on exit.
autocmd VimLeave * call system("xsel -ib", getreg("+"))


""" Plugin settings
runtime coc-recommended.vim


" Emmet
let g:user_emmet_leader_key = '<c-e>'


" Ack and ripgrep
let g:ackprg = 'rg --vimgrep --no-heading'

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" Doge
let g:doge_filesystem_aliases = {'javascript': ['vue']}


" Startify
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1



runtime keybindings.vim

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> l defx#do_action('drop')
    nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d defx#do_action('remove')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> <backspace> defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
    nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction
