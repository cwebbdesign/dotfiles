set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'           "Surround things with tags like brackets
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'vim-scripts/AutoClose'        "auto-close brackets
Plugin 'scrooloose/nerdtree'          "File Navigation
Plugin 'pangloss/vim-javascript'
Plugin 'kien/ctrlp.vim'               "Fuzzy Navigation, thank God
Plugin 'scrooloose/syntastic'         "Linting
Plugin 'vim-scripts/vcscommand.vim'   "Git diff
Plugin 'fholgado/minibufexpl.vim'     "Buffer Explorer
Plugin 'guns/vim-clojure-static'      "Clojure
Plugin 'tpope/vim-fireplace'
"Plugin 'mxw/vim-jsx'                 "JSX highlighting
"Bundle 'rstacruz/sparkup'            "Fast html generation

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Make vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Enable line numbers
set number
" Enable syntax highlighting
syntax on

" http://blog.likewise.org/2012/04/how-to-set-up-solarized-color-scheme.html"
" use solarized color scheme. can be light or dark: see https://github.com/altercation/vim-colors-solarized"
set background=dark
" solarized options
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
let g:solarized_termcolors=16
" let g:solarized_termtrans = 1
let w:solarized_style = "dark"
colorscheme solarized


" Toggle solarized background
 function! ToggleBackground()
     if (w:solarized_style=="dark")
     let w:solarized_style="light"
     set background=light
     colorscheme solarized
 else
     let w:solarized_style="dark"
     set background=dark
     colorscheme solarized
 endif
 endfunction
 command! Togbg call ToggleBackground()
" nnoremap <F5> :call ToggleBackground()<CR>
" inoremap <F5> <ESC>:call ToggleBackground()<CR>a
" vnoremap <F5> <ESC>:call ToggleBackground()<CR>
"

" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
if exists("&relativenumber")
  " Use relative line numbers
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>


" Use system clipboard by default; the if is to support both X11 and the Mac
" @See http://ilessendata.blogspot.nl/2012/05/vim-using-system-clipboard.html
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
" }}}

set colorcolumn=80
hi ColorColumn guifg=red
" @See http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set listchars=tab:>-,eol:<           " Cool characters when use set list

" Tab and spaces {{{
"set tabstop=2
" set autoindent
"set smartindent
"set shiftwidth=2
"set softtabstop=2
"set expandtab
" }}}
" Tab and spaces {{{
set tabstop=2
set expandtab
set smartindent
set shiftwidth=2
set softtabstop=2
" }}}

set fileencoding=utf-8                " UTF8!!

" No more Ex mode: http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>


" Persistent undo files {{{
if has('persistent_undo')
  let s:undodir = $HOME . "/.vim/undo"
  if exists("*mkdir")
    try
      call mkdir(s:undodir)
    catch
    endtry
  endif
  execute "set undodir=" . s:undodir
  set undofile
endif
" }}}

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

command! Toglines call NumberToggle()

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|sass)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
" Syntastic Options
let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_javascript_jsxhint_exec='jsx-jshint-wrapper'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
let g:jsx_ext_required = 0 "Allow JSX in normal JS files
