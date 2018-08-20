" =================== vimplug ====================
call plug#begin('~/.vim/plugged')

" THEMES
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'

" SYNTAX-HIGHLIGHTING
Plug 'sheerun/vim-polyglot'

" AUTOCOMPLETION
Plug 'Valloric/YouCompleteMe'

" GUI ENHANCEMENTS
" Vim tabbar
"Plug 'drmingdrmer/vim-tabbar'
" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vim-workspace
"Plug 'bagrat/vim-workspace'

" EDITOR
" NerdCommenter for quick commenting
Plug 'scrooloose/nerdcommenter'
" indentLine for indent lines
Plug 'Yggdroot/indentLine'


call plug#end()


" ============== Customize: Editor ===============
" FILE TYPE DETECTION
filetype on
filetype plugin on
filetype indent on


" TERMINAL COLOR
syntax enable
set t_Co=256
set term=screen-256color


" LINE NUMBER - ON
set nu


" INDENTATION
" Global
set autoindent     " indents like the previous line
"set smartindent   " add one level of indentation in some cases
set tabstop=4      " hard tab stop
set shiftwidth=4   " when indenting with '>', add 4 spaces
set softtabstop=4  " soft tab stop
set expandtab      " on pressing tab, insert 4 spaces


" BACKSPACE PROBLEM FIX
set backspace=indent,eol,start


" BACKUP FILES - OFF
set nobackup
no backup files
set nowritebackup
set noswapfile
set noundofile


" WINDOW SPLITTING - to the right and bottom for new buffer
set splitright
set splitbelow


" 80-column layout
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


" ERROR BELLS
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


" CONCEAL
set conceallevel=0


" ============= Customize: LANGUAGES  ============
function! SETUP_LANG_HTML()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction
autocmd FileType html     call SETUP_LANG_HTML()

function! SETUP_LANG_PASCAL()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction
autocmd FileType pas     call SETUP_LANG_PASCAL()

function! SETUP_LANG_TEX()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction
autocmd FileType tex      call SETUP_LANG_TEX()
autocmd FileType latex    call SETUP_LANG_TEX()
autocmd FileType plaintex call SETUP_LANG_TEX()

function! SETUP_LANG_VERILOG()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction
autocmd FileType verilog  call SETUP_LANG_VERILOG()

function! SETUP_LANG_VIM()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction
autocmd FileType vim      call SETUP_LANG_VIM()

function! SETUP_LANG_TXT()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction
autocmd FileType text     call SETUP_LANG_TXT()


" ============= Customize: PLUGINS     ============
" YOUCOMPLETEME
" Encoding
set encoding=utf-8
" Global
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostics_ui = 0
" C, C++, Obj-C
let g:ycm_global_ycm_extra_conf = "~/.vim/custom/.ycm_extra_conf.py"
" Python
let g:ycm_python_binary_path = '/usr/bin/python3'
" Closing unnecessary windows
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1


" INDENTLINE
" Disable
let g:indentLine_enable = 0


" ============= Customize: GUI        ============
colorscheme onedark
let g:airline_theme='onedark'

if has('gui_running')
  " THEME
  " Light/Dark
  "set background=light
  set background=dark

  " Theme
  "colorscheme mylight
  colorscheme onedark
  "colorscheme solarized8
  "colorscheme molokai
  "colorscheme monokai
  "colorscheme gruvbox

  " Airline
  "let g:airline_theme='papercolor'
  "let g:airline_theme='onedark'
  let g:airline_theme='solarized'
  "let g:airline_theme='gruvbox'
  "let g:airline_theme='molokai'

  " MAXIMIZE WINDOW
  set lines=999 columns=999

  " FONT
  set guifont=Monospace\ Regular\ 11
  "set guifont=Ubuntu\ Mono\ 11

  " HIDE UNNECESSARY GUI FEATURES
  set guioptions-=m  "menu bar
  set guioptions-=T  "toolbar
  set guioptions-=r  "right scrollbar
  set guioptions-=L  "left scrollbar
endif

