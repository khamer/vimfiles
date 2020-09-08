"   ____  ___  ____ _   __(_)___ ___
"  / __ \/ _ \/ __ \ | / / / __ `__ \
" / / / /  __/ /_/ / |/ / / / / / / /
"/_/ /_/\___/\____/|___/_/_/ /_/ /_/

""" Plugins
call plug#begin(stdpath('data') . '/plugged')

""" Essential
Plug 'editorconfig/editorconfig-vim'            " Indent handling
Plug 'junegunn/fzf.vim'                         " Opening files
Plug 'kamykn/spelunker.vim'                     " Much better spell checking
Plug 'mattn/emmet-vim'                          " Essential shorthand for html/css
Plug 'mhinz/vim-startify'                       " Very nice launch screen
Plug 'mileszs/ack.vim'                          " Much better than :grep
Plug 'neoclide/coc.nvim', {'branch': 'release'} " The best option for completion in 2020
Plug 'sheerun/vim-polyglot'                     " More filetype support
Plug 'tpope/vim-sensible'                       " Better defaults

""" Sometimes useful
Plug 'itchyny/lightline.vim'                    " More visual modes - just trying it out
Plug 'liuchengxu/vim-clap'                      " Only here because :Clap colors has previews
Plug 'liuchengxu/vim-which-key'                 " Just for fun
Plug 'simnalamburt/vim-mundo'                   " Better undo, I don't use this much.
Plug 'voldikss/vim-floaterm'                    " Cool terminal within vim

""" Colorschemes
Plug 'ajh17/Spacegray.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'jaredgorski/spacecamp'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'chuling/ci_dark'
Plug 'ayu-theme/ayu-vim'
Plug 'jacoborus/tender.vim'

call plug#end()

""" Additional path for color themes
set rtp+=~/Code/base16-builder-php/templates/vim

""" Basic Settings
set number ignorecase smartcase undofile list formatoptions+=nj
set fillchars=vert:\ ,fold:\  listchars=tab:⎸\ ,nbsp:⎕
set linebreak showbreak=↪\  breakindent breakindentopt=shift:-2
set backupdir=~/.vim/backup directory=~/.vim/swap
set wildmode=longest:full

set termguicolors
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_italic_comments = 1
let g:deepspace_italics = 1
let g:gruvbox_italic = 1
let g:onedark_terminal_italics = 1
let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1

"colorscheme base16-horizon-terminal-dark
colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }

" Base16 Specific
hi Comment cterm=italic gui=italic

set guifont=Input\ Regular\ 9 " This is actually Input Medium, with bold showing as Input Black
set guioptions-=mrLtT
set mouse=a

" Tweaking netrw; still not happy with it.
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
autocmd User Startified setlocal buflisted
autocmd User Startified nmap <buffer> f <leader>f
let g:startify_fortune_use_unicode = 1



" Floaterm
let g:floaterm_position = 'center'
let g:floaterm_width = 0.9



runtime keybindings.vim
