" =================== vimplug ====================
call plug#begin('~/.config/nvim/plugged')

" THEMES
Plug 'cohlin/vim-colorschemes'
Plug 'crusoexia/vim-monokai'
Plug 'joshdick/onedark.vim'

" AUTOCOMPLETION
Plug 'Shougo/deoplete.nvim'

" SNIPPETS
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" SYNTAX-HIGHLIGHTING
Plug 'sheerun/vim-polyglot'

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


" ============= Customize: PLUGINS     ============
" PYTHON SUPPORT
let g:python_host_prog = '/home/nhat/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/nhat/.pyenv/versions/neovim3/bin/python'

" DEOPLETE
" enable at startup
let g:deoplete#enable_at_startup = 1
" set autocompletion with Tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" custom snippet directory
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" NEOSNIPPET
" key mapping
imap <s-tab> <Plug>(neosnippet_expand_or_jump)
smap <s-tab> <Plug>(neosnippet_expand_or_jump)
xmap <s-tab> <Plug>(neosnippet_expand_target)

" INDENTLINE
let g:indentLine_char='┆'

" POLYGLOT
let g:polyglot_disabled = ['latex', 'python']


" ============= Customize: GUI        ============
" TERMINAL VIM
set background=light
"colorscheme xcode-default
colorscheme monday-rain
let g:airline_theme='edocx'


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
map <c-s-o> :vsplit ~/.config/nvim/colors/monday-rain.vim<CR>


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
  let b:indentLine_enabled=0
endfunction
autocmd FileType markdown call SETUP_LANG_MARKDOWN()

function! SETUP_LANG_PASCAL()
  call SET_INDENTATION_2()
endfunction
autocmd FileType pas      call SETUP_LANG_PASCAL()

function! SETUP_LANG_TEX()
  call SET_INDENTATION_2()
  let b:indentLine_enabled=0
  hi Error NONE
  hi ErrorMsg NONE
  nmap <F9> :w<CR>:!./make.sh<CR>
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


" ============== Customize: Editor ===============
" FILE TYPE DETECTION
filetype on
filetype plugin on
filetype indent on


" TERMINAL COLOR
syntax enable
set t_Co=256


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


" 80-COLUMN
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


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


" FIX WEIRD CHARACTER IN NVIM
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
let $VTE_VERSION="100" 
" export VTE_VERSION="100" in the terminal may also solve the problem
set guicursor=
