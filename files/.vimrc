" File: .vimrc
" Author: John Hight
" Description: vimrc for Linux systems
" Last Modified: September 29, 2021
"
" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax enable
filetype plugin on

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
let g:netrw_list_hide=netrw_gitignore#Hide()
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
autocmd FileType python setlocal tabstop=4
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
map <leader>w :set wrap<cr>
map <leader>e :set nowrap<cr>
map <leader>s :source ~/.vimrc<cr>
map <leader>p :PlugUpdate<cr>
" Formatting
map <leader>q gqip
map <leader>z :setlocal spell spelllang=en_us<CR> " Spellcheck
map <leader>Z :set nospell<CR> " Turn Off Spellcheck
map <leader>7 :UltiSnipsEdit<CR> "Edit snippets

" Map Function Keys <FN> 
" <F1> mapped to :help by default

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

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
" Run Python3 with <F9>
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

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
map <silent> <C-E> :call ToggleVExplorer()<CR>

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
"____________________________________________________________________________
" Linux system spacific stuff
"
" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" ~/.vimrc-sys contains system spacific vim directives
" load .vimrc-sys if present
if !empty(glob("~/.vimrc-sys"))
  source ~/.vimrc-sys
endif

