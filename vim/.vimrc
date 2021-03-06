" =================== vimplug ====================
call plug#begin('~/.vim/plugged')

" THEMES
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'Addisonbean/Vim-Xcode-Theme'
Plug 'cohlin/vim-colorschemes'
Plug 'romainl/flattened'
Plug 'chriskempson/base16-vim'
Plug 'ocykat/muse.vim'

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
" Aligning equal signs
Plug 'godlygeek/tabular'
" indentLine for indent lines
" Plug 'Yggdroot/indentLine'

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

" WORD WRAPPING
set wrap
set linebreak

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
autocmd BufWritePre * %s/\s\+$//e

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
let g:ycm_confirm_extra_conf = 0
" Closing unnecessary windows
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"" INDENTLINE
"let g:indentLine_char='┆'

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
"colorscheme solarized
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

" VIETNAMESE
let s:VietnameseKeymapON = 0

function! ToggleVietnameseKeymap()
  if s:VietnameseKeymapON
    set keymap=
    let s:VietnameseKeymapON = 0
  else
    set keymap=vietnamese-vni_utf-8
    let s:VietnameseKeymapON = 1
  endif
endfunction

map <F8> :call ToggleVietnameseKeymap()<CR>

" ======== SPECIFIC LANGUAGE SETTINGS =========
function! SetIndentSize(indentsize)
  let &l:tabstop = a:indentsize
  let &l:shiftwidth = a:indentsize
  let &l:softtabstop = a:indentsize
endfunction

function! SetDocMovement()
  vmap <C-j> gj
  vmap <C-k> gk
  vmap <C-4> g$
  vmap <C-0> g^
  nmap <C-j> gj
  nmap <C-k> gk
  nmap <C-4> g$
  nmap <C-0> g^
endfunction

function! LangHtml()
  call SetIndentSize(2)
endfunction
autocmd FileType html     call LangHtml()

function! LangMarkdown()
  call SetIndentSize(2)
  call SetDocMovement()
endfunction
autocmd FileType markdown call LangMarkdown()

function! LangPascal()
  call SetIndentSize(2)
endfunction
autocmd FileType pascal   call LangPascal()

function! LangTex()
  call SetIndentSize(2)
  call SetDocMovement()
  " setlocal textwidth=79
  hi Error NONE
  hi ErrorMsg NONE
  nmap <F9> :w<CR>:!latexmk<space>-pdf<space>main.tex<CR>
endfunction
let g:tex_flavor = "latex"
autocmd FileType tex      call LangTex()
autocmd FileType latex    call LangTex()
autocmd FileType plaintex call LangTex()

function! LangVim()
  call SetIndentSize(2)
endfunction
autocmd FileType vim      call LangVim()
