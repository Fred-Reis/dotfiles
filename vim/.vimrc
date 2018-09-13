call plug#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compatibility
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jszakmeister/vim-togglecursor'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'w0rp/ale', { 'do': 'sudo yarn global add prettier eslint --ignore-global' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helpers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-dadbod', { 'on': 'DB' }
Plug 'editorconfig/editorconfig-vim'
Plug 'heavenshell/vim-jsdoc', { 'on': 'JsDoc' }
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'artnez/vim-wipeout', { 'on': 'Wipeout' }
Plug 'brooth/far.vim', { 'on': ['Far', 'Farundo', 'Farp', 'Farundo'] }
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/matchit'
if has('nvim') || ((v:version >= 800) && has("python3"))
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  elseif (v:version >= 800) && has("python3")
    Plug 'Shougo/deoplete.nvim', { 'do': 'if [[ \"$(uname)\" == \"Linux\" ]]; then sudo apt update && sudo apt install -y python3-pip; else brew update && brew reinstall python3; fi; pip3 install neovim' }
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " JavaScript
  Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo yarn global add tern --ignore-optional' }
endif

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Faster vim
set lazyredraw
" Enable last used search pattern highlighting
set hlsearch
" Unset the LAST SEARCH PATTERN register by hitting return
nnoremap <silent> <CR> :noh<CR><CR>
" Enable cursor line highlighting
set cursorline
" Enable overlength line highlighting
set colorcolumn=80
" Disable mouse
set mouse=
set ttymouse=
" Enable line numbers
set number
" Enable case-insensitive search
set ic
" Enable .viminfo
set viminfo='20,\"50
" Set default encoding and format
set fileencoding=utf-8 tabstop=2 shiftwidth=2 expandtab
" Turn backup off
set nobackup nowb noswapfile
" Set update interval
set updatetime=100
" Show matching brackets when text indicator is over them
set showmatch
" No annoying sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" Load .md files as Markdown
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aliases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set leader key to ,
let mapleader = ','
" Copy to / from external clipboard
if has('macunix')
  " macOS
  map <leader>y :w !pbcopy<CR>
  map <leader>p :r !pbpaste \| sed 's/^ *//;s/ *$//'<CR>
else
  " Linux
  map <leader>y :w !xsel -i -b<CR>
  map <leader>p :r !xsel -p \| sed 's/^ *//;s/ *$//'<CR>
endif
" Use F5 to switch buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" Use F6 to vertically split the current window and select a buffer
nnoremap <F6> :vsplit<CR>:buffers<CR>:buffer<Space>
" Use F7 to horizontally split the current window and select a buffer
nnoremap <F7> :split<CR>:buffers<CR>:buffer<Space>
" Reload vimrc
nmap <Leader>s :source $MYVIMRC<CR>
" Edit vimrc
nmap <Leader>v :e $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula
let g:airline_theme = 'dracula'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  " Font
  if has("gui_macvim")
    " mVim
    set guifont=Hack\ Regular\ Nerd\ Font\ Complete:h10
  else
    " gVim
    set guifont=Hack\ 10
  endif
  " Remove menu
  set guioptions=
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>
" Close vim if the only window left open is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Automatically remove a buffer when a file is being deleted via a context menu
let NERDTreeAutoDeleteBuffer = 1
" Disable display of the 'Bookmarks' label
let NERDTreeMinimalUI = 1
" Close the tree window after opening a file
let NERDTreeQuitOnOpen = 1
" Display hidden files by default
let NERDTreeShowHidden = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use powerline fonts
let g:airline_powerline_fonts = 1
" Tabs extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'] }
" Airline extension
let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore files and folders
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|node_modules)$',
      \ 'file': '\v\.(gitkeep|log|gif|jpg|jpeg|png|psd|DS_Store|)$'
      \ }
" Don't cache results
let g:ctrlp_use_caching = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Tab instead of Ctrl-N / Ctrl-P
let g:SuperTabDefaultCompletionType = "<c-n>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JsDoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle JsDoc
map <leader>j :JsDoc<CR>
" Enable ECMASCript 6 support
let g:jsdoc_enable_es6 = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Multiple Cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quit from multicursor mode
let g:multi_cursor_quit_key = '<Esc>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow JSX in normal JS files
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Jump to anywhere
nmap s <Plug>(easymotion-overwin-f)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" Use EasyMotion to move to matched words
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable at startup
let g:deoplete#enable_at_startup = 1
