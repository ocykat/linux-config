" =================== vimplug ====================
call plug#begin('~/.vim/plugged')

" THEMES
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'endel/vim-github-colorscheme'
Plug 'rakr/vim-one'
Plug 'Addisonbean/Vim-Xcode-Theme'
Plug 'cohlin/vim-colorschemes'
Plug 'romainl/flattened'

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


" COPY AND PASTE
" Make vim use the system clipboard
"set clipboard=unnamed     " for Windows
set clipboard=unnamedplus " for Linux


" ERROR BELLS
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


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
let g:indentLine_char='┆'

" POLYGLOT
let g:polyglot_disabled = ['latex', 'python']


" ============= Customize: GUI        ============
" TERMINAL VIM
" Dark selection
set background=light
colorscheme xcode-default
let g:airline_theme='edocx'

" Light selection
"set background=dark
"colorscheme onedark
"let g:airline_theme='onedark'


" GVIM
if has('gui_running')
  " THEME
  " Light/Dark
  set background=dark

  " Theme
  colorscheme onedark

  " Airline
  let g:airline_theme='onedark'

  " MAXIMIZE WINDOW
  set lines=999 columns=999

  " FONT
  set guifont=Inconsolata \12
  "set guifont=Ubuntu\ Mono\ 11

  " HIDE UNNECESSARY GUI FEATURES
  set guioptions-=m  "menu bar
  set guioptions-=T  "toolbar
  set guioptions-=r  "right scrollbar
  set guioptions-=L  "left scrollbar
endif


" ============= Customize: KEY-BINDING     ============
" SYNTAX-HIGHLIGHTING GROUP DETECTING
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" ENTER PASTE MODE
set pastetoggle=<F3>


" ============= Customize: LANGUAGES  ============
function! SET_INDENTATION_2()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction

function! SETUP_LANG_HTML()
  call SET_INDENTATION_2()
endfunction
autocmd FileType html      call SETUP_LANG_HTML()

function! SETUP_LANG_MARKDOWN()
  call SET_INDENTATION_2()
  let indentLine_enabled=0
  set conceallevel=0
endfunction
autocmd FileType markdown call SETUP_LANG_MARKDOWN()

function! SETUP_LANG_PASCAL()
  call SET_INDENTATION_2()
endfunction
autocmd FileType pas      call SETUP_LANG_PASCAL()

function! SETUP_LANG_TEX()
  call SET_INDENTATION_2()
  let indentLine_enabled=0
  set conceallevel=0
  nmap <F9> :!pdflatex main.tex<CR>
endfunction
autocmd FileType tex      call SETUP_LANG_TEX()
autocmd FileType latex    call SETUP_LANG_TEX()
autocmd FileType plaintex call SETUP_LANG_TEX()

function! SETUP_LANG_VERILOG()
  call SET_INDENTATION_2()
endfunction
autocmd FileType verilog  call SETUP_LANG_VERILOG()

function! SETUP_LANG_VIM()
  call SET_INDENTATION_2()
endfunction
autocmd FileType vim      call SETUP_LANG_VIM()

function! SETUP_LANG_TXT()
  call SET_INDENTATION_2()
endfunction
autocmd FileType text     call SETUP_LANG_TXT()
