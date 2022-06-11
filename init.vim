"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═

au! BufWritePost $MYVIMRC source %   " Auto souce when writing to init.vim alternatively you can run :source $MYVIMRC
cmap w!! w !sudo tee %
let g:python3_host_prog = '/usr/bin/python3'

" //////////////////// CORE \\\\\\\\\\\\\\\\\\\\\\\\\

syntax enable               " Enable syntax highlighting
set visualbell              " Errors flash screen
set emoji                   " Enable emoji's
set hidden                  " Required to keep multiple buffers open
set hlsearch                " Highlight search results
set nowrap                  " Display long lines as just one line
set encoding=utf-8          " The endocind displayed
set pumheight=10            " Makes popup menu smaller
set fileencoding=utf-8      " File endocing written to file
set ruler                   " Show cursor position all the time
set mouse=a                 " Enable Mouse
set nobackup                " Disable Backup
set noswapfile              " Disable swapfile
set splitbelow              " Horizontal splits will automatically be below
set splitright              " Vertical splits will automatically split right
set t_Co=256                " Support 256 colors
set tabstop=3               " Insert 3 spaces for tab
set smarttab                " Makes tabbing smarter
set smartindent             " Makes indenting smart
set autoindent              " Good automatic indenting
set number                  " Line Numbers
"set laststatus=0            " Always display the status line
set noshowmode              " Disables stuff like -- INSERT --
set clipboard=unnamedplus   " Copy & Past between vim and other stuff
set history=1000            " Set History limit
set wildmode=longest,list   " Get bash-like tab completions
set inccommand=nosplit      " Visual feedback while substituting
set autochdir               " Set working directory to current directory
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1
set termguicolors
autocmd TermOpen * setlocal nonumber norelativenumber   " No line number for terminal
set incsearch ignorecase smartcase hlsearch             " Highlight text while searching

" /////////////////// PLUGINS \\\\\\\\\\\\\\\\\\\\\\\

call plug#begin()
" MAIN
Plug 'itchyny/lightline.vim'                      " Status Bar
Plug 'sheerun/vim-polyglot'                       " Multi-Language Support
Plug 'tpope/vim-surround'                         " Surrounding Modifier
Plug 'jiangmiao/auto-pairs'                       " Autoclosing brackets
Plug 'preservim/nerdtree'                         " File Explorer
Plug 'tpope/vim-vinegar'                          " Netrw modifier
Plug 'Shirk/vim-gas'                              " Assembly Syntax Highlight
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'                           " Fuzzy Finder
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'                         " Code Formatter 
Plug 'google/vim-glaive'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'prabirshrestha/vim-lsp'                     " Neovim lsp
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'            " Auto Complete
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'puremourning/vimspector'                    " Debugger
Plug 'ryanoasis/vim-devicons'                     " Icons
"Plug 'luochen1990/rainbow'                        " Rainbow Tags
Plug 'joeytwiddle/sexy_scroller.vim'              " Smooth Scroller

" THEMES
Plug 'morhetz/gruvbox'                 " gruvbox
Plug 'dylanaraps/wal.vim'              " pywal
Plug 'mangeshrex/uwu.vim'              " uwu 
Plug 'pacokwon/onedarkhc.vim'          " onedark
Plug 'ajmwagar/vim-deus'               " deus
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } "challenger_deep
Plug 'wadackel/vim-dogrun'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'AlessandroYorba/Alduin'          " Alduin
Plug 'rakr/vim-two-firewatch'          " two-firewatch

call plug#end()

""" SET THEME:
set background=dark
colorscheme two-firewatch

" PLUGINS CONFIG ++++++++++++++++++

" ====================== Sexy scroller ======================
let g:SexyScroller_ScrollTime  = 10    " Time taken for buffer to scroll one line or column
let g:SexyScroller_CursorTime  = 3     " Time taken for cursor to travel one line
let g:SexyScroller_MaxTime     = 400   " Maximum amount of time that longer scrolls can take
let g:SexyScroller_EasingStyle = 1     " Choose easing time

" ========================= Rainbow ==========================
let g:rainbow_active = 1

" ====================== Glaive Format ======================
" Autoformat
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" ====================== Light-Line ==========================
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:airline_theme='twofirewatch'

" //////////////////// MAPPINGS \\\\\\\\\\\\\\\\\\\\\\\

" Leader -> \

" Escape Terminal in Neovim
tnoremap <esc> <C-\><C-N>
 
" -> NERDTREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" -> TELESCOPE
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
