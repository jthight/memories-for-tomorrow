" File: $MYVIMRC
" Author: John Hight
" Description: vimrc for All systems
" Last Modified: October 14, 2021
" Use "/MAIN" to go to GENERAL_CODE
" Normally this if-block is not needed, because `:set nocp` is done
" automatically when .vimrc is found. However, this might be useful
" when you execute `vim -u .vimrc` from the command line.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

" OS_FUNCTIONS:
" Functions to load OS spacific vim code
"
" IOS:
function! IOS_code()
  "" iPad spacific commands
  " "Hello IOS User"
  " Add any system spacific startup vim commands to this file.
  " They will be pulled in a startup
  map <leader>h :echo "Hello IOS World"<CR>
  "____________________________________________________________________________
  " IOS spacific commands
  map <leader>p :iplug update<cr>
  map <leader>P :iplug upgrade<cr>
  " iplug add commands; Installed PlugIns
  " iplug add https://github.com/adelarsq/vim-matchit.git
  " iplug add https://github.com/christoomey/vim-sort-motion.git
  " iplug add https://github.com/christoomey/vim-titlecase.git
  " iplug add https://github.com/honza/vim-snippets.git
  " iplug add https://github.com/jeffkreeftmeijer/vim-numbertoggle.git
  " iplug add https://github.com/junegunn/vim-easy-align.git
  " iplug add https://github.com/kana/vim-textobj-indent.git
  " iplug add https://github.com/preservim/nerdcommenter.git
  " iplug add https://github.com/SirVer/ultisnips.git
  " iplug add https://github.com/tpope/vim-commentary.git
  " iplug add https://github.com/tpope/vim-repeat.git
  " iplug add https://github.com/tpope/vim-surround.git
  " iplug add https://github.com/vim-airline/vim-airline-themes.git
  " iplug add https://github.com/vim-airline/vim-airline.git
  " iplug add https://github.com/vim-scripts/AutoComplPop.git
  " iplug add https://github.com/vim-scripts/ReplaceWithRegister.git
  " iplug add https://github.com/tyru/open-browser.vim.git
  " Colorscheme
  set t_Co=256
  set background=dark
  colorscheme Atelier_HeathDark
  " Set clipboard for IOS
  set clipboard=unnamed
  map <leader>c "+y
  map <leader>v "+gP
  map <leader>x "+x
endfunction
"
" LINUX:
function! LINUX_code()
  " "Hello Linux User"
  " Add any system spacific startup vim commands to this file.
  " They will be pulled in a startup
  map <leader>h :echo "Hello Linux World"<CR>
  "____________________________________________________________________________
  " Linux system spacific stuff
  "
  " Try to load minpac.
  packadd minpac

  if !exists('g:loaded_minpac')
    " minpac is not available.
    map <leader>pu :PlugUpdate<CR>
    " Vim-Plug plugin manager
    call plug#begin()
    Plug 'https://github.com/adelarsq/vim-matchit'
    Plug 'https://github.com/altercation/vim-colors-solarized.git'
    Plug 'junegunn/vim-easy-align'
    Plug 'tyru/open-browser.vim' " opens url in browser
    Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
    Plug 'preservim/nerdcommenter' " Comment test in/out
    Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
    Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle.git'
    Plug 'https://github.com/tpope/vim-repeat.git'
    Plug 'https://github.com/vim-scripts/ReplaceWithRegister.git'
    Plug 'christoomey/vim-titlecase'
    Plug 'christoomey/vim-sort-motion'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    call plug#end()
    " Settings for plugin-less environment.
    
  else
    " minpac is available.
    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    call minpac#add('vim-jp/syntax-vim-ex')
    call minpac#add('adelarsq/vim-matchit')
    call minpac#add('altercation/vim-colors-solarized')
    call minpac#add('junegunn/vim-easy-align')
    call minpac#add('tyru/open-browser.vim') " opens url in browser
    call minpac#add('tpope/vim-surround') " Surrounding ysw)
    call minpac#add('preservim/nerdcommenter') " Comment test in/out
    call minpac#add('tpope/vim-commentary') " For Commenting gcc & gc
    call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('vim-scripts/ReplaceWithRegister')
    call minpac#add('christoomey/vim-titlecase')
    call minpac#add('christoomey/vim-sort-motion')
    call minpac#add('vim-scripts/AutoComplPop')
    call minpac#add('SirVer/ultisnips')
    call minpac#add('honza/vim-snippets')
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')
    call minpac#add('chriskempson/base16-vim')
    " Additional plugins here.

    " Plugin commands
    map <leader>pu :call minpac#update()<CR>
    map <leader>pc :call minpac#clean()<CR>
    map <leader>ps :call minpac#status()<CR>

  endif

  " Color scheme (terminal)
  set t_Co=256
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  colorscheme solarized
  " Run Python3 with <F9>
  autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
  " load .vimrc-sys if present
  if !empty(glob("~/.vimrc-sys"))
    source ~/.vimrc-sys
  endif
endfunction
"
" WINDOWS:
function! WIN_coce()
  " "Hello Windows User"
  " Add any system spacific startup vim commands to this file.
  " They will be pulled in a startup
  map <leader>h :echo "Hello Windows World"<CR>
  "____________________________________________________________________________
  " windows spacific commands
  "
  " Try to load minpac.
  packadd minpac

  if !exists('g:loaded_minpac')
    " minpac is not available.
    map <leader>pu :PlugUpdate<CR>
    " Vim-Plug plugin manager
    call plug#begin()
    Plug 'https://github.com/adelarsq/vim-matchit'
    Plug 'https://github.com/altercation/vim-colors-solarized.git'
    Plug 'junegunn/vim-easy-align'
    Plug 'tyru/open-browser.vim' " opens url in browser
    Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
    Plug 'preservim/nerdcommenter' " Comment test in/out
    Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
    Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle.git'
    Plug 'https://github.com/tpope/vim-repeat.git'
    Plug 'https://github.com/vim-scripts/ReplaceWithRegister.git'
    Plug 'christoomey/vim-titlecase'
    Plug 'christoomey/vim-sort-motion'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'chriskempson/base16-vim' " Color package for vim
    call plug#end()
    " Settings for plugin-less environment.
    
  else
    " minpac is available.
    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    call minpac#add('vim-jp/syntax-vim-ex')
    call minpac#add('adelarsq/vim-matchit')
    call minpac#add('altercation/vim-colors-solarized')
    call minpac#add('junegunn/vim-easy-align')
    call minpac#add('tyru/open-browser.vim') " opens url in browser
    call minpac#add('tpope/vim-surround') " Surrounding ysw)
    call minpac#add('preservim/nerdcommenter') " Comment test in/out
    call minpac#add('tpope/vim-commentary') " For Commenting gcc & gc
    call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('vim-scripts/ReplaceWithRegister')
    call minpac#add('christoomey/vim-titlecase')
    call minpac#add('christoomey/vim-sort-motion')
    call minpac#add('vim-scripts/AutoComplPop')
    call minpac#add('SirVer/ultisnips')
    call minpac#add('honza/vim-snippets')
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')
    call minpac#add('chriskempson/base16-vim')
    " Additional plugins here.

    " Plugin commands
    map <leader>pu :call minpac#update()<CR>
    map <leader>pc :call minpac#clean()<CR>
    map <leader>ps :call minpac#status()<CR>

  endif

  " Run Python3 with <F9>
  autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
  " OPEN_FILE_IN_BROWSER:
  " Open the current file in the default browser`
  command! OpenBrowserCurrent execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')
  " Color scheme (terminal)
  highlight Normal guifg=white guibg=black
  colorscheme base16-gruvbox-dark-medium
  let base16colorspace=256  " Access colors present in 256 colorspace
  set termguicolors
  if has("gui_win32")
    set guifont=lucida_console:h12:cANSI
    set lines=50 columns=150
    set linespace=4
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    highlight Cursor guifg=red guibg=gray
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
  endif
  " Set clipboard for Windows 
  set clipboard=unnamed
  map <leader>c "+y
  map <leader>v "+gP
  map <leader>x "+x
  set pythonthreehome=C:\bin\python3
  set pythonthreedll=C:\bin\python3\python39.dll
  " Check to avoid UltiSnips Deprecation Warning imp module is deprecated
  if has('python3')
    silent! python3 1
  endif
  " load _vimrc-sys if present
  if !empty(glob("~/_vimrc-sys"))
    source ~/_vimrc-sys
  endif
endfunction

" MAIN_GENERAL_CODE:
" Turn on syntax highlighting
syntax enable
filetype plugin on
filetype plugin indent on

" Search and fins files
set path+=**
set wildmenu " Tab through menu
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list
set complete+=kspell
set completeopt=menuone,longest

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
if has("win32") || has("linux")
  let g:netrw_list_hide=netrw_gitignore#Hide()
endif
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set nowrap
set textwidth=80
set colorcolumn=80
set signcolumn=no " Show error indicators on left column
set formatoptions=tcqrn1
set tabstop=2
autocmd FileType python setlocal tabstop=2
autocmd FileType yaml setlocal tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=8
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" leader key mapping
"
" Pick a leader key
let mapleader = " "
" leader key strokes
map <leader><space> :let @/=''<cr> " clear search
map <leader>sw :set wrap<cr>
map <leader>nw :set nowrap<cr>
map <leader>vr :source $MYVIMRC<cr>
map <leader>ve :tabedit $MYVIMRC<cr>
map <leader>c :tabc<cr>
map <leader>f /<C-R><C-W><cr>
" Formatting
map <leader>q gqip
map <leader>1 :tab help <C-R><C-W><CR> " mapped to :help
map <leader>z :setlocal spell spelllang=en_us<CR> " Spellcheck
map <leader>Z :set nospell<CR> " Turn Off Spellcheck
if has("IOS")
  map <leader>7 :UltiSnipsEdit!<CR> "Edit snippets
else
  map <leader>7 :UltiSnipsEdit<CR> "Edit snippets
endif
map <leader>8 :UltiSnipsEdit!<CR> "Edit snippets
" map jk as <esc> key when in insert mode
inoremap jk <esc>
" Change a word to upper CASE in insert mode
inoremap <C-U> <esc>viwUea

" Map Function Keys <FN> 
" <F1> mapped to :help by default

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" NERDTree Like with netrw
" Toggle Vexplore with Ctrl-E
" from https://stackoverflow.com/questions/5006950/setting-netrw-like-nerdtree/5636941
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec 'wincmd w'
      let g:netrw_winsize = 30
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-G> :call ToggleVExplorer()<CR>

" Load system spacific vim directives and PlugIns
if has("IOS")
  call IOS_code()
endif
if has("win32")
  call WIN_coce()
endif
if has("linux")
  call LINUX_code()
endif
" NERDcommenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Sort Motion.vim 'christoomey/vim-sort-motion' 
let g:sort_motion_flags = 'ui'
let g:sort_motion_visual_block_command = 'Vissort'

"SNIPPS:
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsListSnippets="<C-L>"
let g:UltiSnipsSnippetsDirectories=["UltiSnips"]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEnableSnipMate=1
let g:snips_author="John Hight"
let g:snips_email="john@hight.net"
let g:snips_github="https://github.com/jthight"
" Key to activate snipps
" let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype

" Support code for Plugs
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Status bar look
let g:airline_theme='apprentice'

