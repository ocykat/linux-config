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
Plug 'chriskempson/base16-vim'

" SYNTAX-HIGHLIGHTING
Plug 'sheerun/vim-polyglot'

" AUTOCOMPLETION
Plug 'Valloric/YouCompleteMe'

" GUI ENHANCEMENTS
" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
"if exists('+colorcolumn')
  "set colorcolumn=80
"else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif
set colorcolumn=80

" COPY AND PASTE
" Make vim use the system clipboard
"set clipboard=unnamed     " for Windows
set clipboard=unnamedplus " for Linux

" REMOVE TRAILING WHITESPACES
autocmd BufWritePre *.py :%s/\s\+$//e

" ERROR BELLS
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" SET LATEX FILETYPE TO latex ONLY
let g:tex_flavor='latex'

" ============= Customize: PLUGINS     ============
" YOUCOMPLETEME
" Encoding
set encoding=utf-8
" Global
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostics_ui = 0
" C, C++, Obj-C
let g:ycm_global_ycm_extra_conf = "~/.vim/custom/ycm/.ycm_extra_conf.py"
" Python
let g:ycm_python_binary_path = '/usr/bin/python3'
" Closing unnecessary windows
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" INDENTLINE
let g:indentLine_char='┆'

" POLYGLOT
let g:polyglot_disabled = ['latex']


" ============= Customize: GUI        ============
" TERMINAL VIM
"if filereadable(expand("~/.vimrc_background"))
  "let base16colorspace=256
  "source ~/.vimrc_background
"endif

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" COLORSCHEME
syntax on
" Light
set background=light
colorscheme muse
let g:airline_theme='papercolor'
" Dark
"set background=dark
"colorscheme solarized8
"let g:airline_theme='solarized'

" GVIM
if has('gui_running')
  " THEME
  " Light/Dark
  set background=light

  " Theme
  colorscheme xcode-default

  " Airline
  let g:airline_theme='edocx'

  " MAXIMIZE WINDOW
  set lines=999 columns=999

  " FONT
  set guifont=Inconsolata:h16
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


" INDENT KEEPING SELECTION
vmap < <gv
vmap > >gv

" RELOAD VIMRC
map <F12> :source $MYVIMRC<CR>

" OPEN MY THEME
map <c-s-o> :vsplit ~/.vim/colors/muse.vim<CR>

" ======== SPECIFIC LANGUAGE SETTINGS =========
function! SmallIndent()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal expandtab
endfunction

function! LangHtml()
  call SmallIndent()
endfunction
autocmd FileType html     call LangHtml()

function! LangMarkdown()
  call SmallIndent()
  let b:indentLine_enabled=0
endfunction
autocmd FileType markdown call LangMarkdown()

function! LangPascal()
  call SmallIndent()
endfunction
autocmd FileType pascal   call LangPascal()

function! LangTex()
  call SmallIndent()
  setlocal tw=79
  hi Error NONE
  hi ErrorMsg NONE
  nmap <F9> :w<CR>:!latexmk<space>-pdf<space>main.tex<CR>
endfunction
let g:tex_flavor = "latex"
autocmd FileType tex      call LangTex()
autocmd FileType latex    call LangTex()
autocmd FileType plaintex call LangTex()

function! LangVim()
  call SmallIndent()
endfunction
autocmd FileType vim      call SmallIndent()
