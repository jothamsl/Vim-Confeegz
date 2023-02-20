"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═

au! BufWritePost $MYVIMRC source %   " Auto souce when writing to init.vim alternatively you can run :source $MYVIMRC
cmap w!! w !sudo tee %
"let g:python3_host_prog = '/usr/bin/python3'

" //////////////////// CORE \\\\\\\\\\\\\\\\\\\\\\\\\

syntax enable               " Enable syntax highlighting
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
set shiftwidth=3
set expandtab
set smarttab                " Makes tabbing smarter
set smartindent             " Makes indenting smart
set autoindent              " Good automatic indenting
set number                  " Line Numbers
"set laststatus=1            " Always display the status line
set noshowmode              " Disables stuff like -- INSERT --
"set clipboard=unnamedplus   " Copy & Past between vim and other stuff
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

" /////////////////// GLOBALS \\\\\\\\\\\\\\\\\\\\\
let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
" let g:loaded_man               = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1

" /////////////////// PLUGINS \\\\\\\\\\\\\\\\\\\\\\\

call plug#begin()
" MAIN
Plug 'matze/vim-move'                             " Line Mover
"Plug 'sbdchd/neoformat'                           " Formatter
"Plug 'dense-analysis/ale'                         " Error and Info
Plug 'lambdalisue/fern.vim'                       " File Explorer
Plug 'tpope/vim-surround'                         " Surrounding Modifier
Plug 'sheerun/vim-polyglot'                       " Multi-Language Support
Plug 'jiangmiao/auto-pairs'                       " Autoclosing brackets
Plug 'ryanoasis/vim-devicons'                     " Icons
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'              " Smooth Scroll
Plug 'prabirshrestha/vim-lsp'                     " Neovim lsp
Plug 'prabirshrestha/asyncomplete-lsp.vim'        " Neovim lsp async
Plug 'prabirshrestha/asyncomplete.vim'            " Auto Complete
Plug 'dstein64/vim-startuptime'
Plug 'alvan/vim-closetag'                         " Close HTML tags
Plug 'itchyny/vim-cursorword'                     " Text underline
Plug 'folke/which-key.nvim'

" DEPENDACY PACKAGES
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/vim-lsp-settings'
Plug 'nvim-lua/plenary.nvim'
Plug 'nixprime/cpsm'

" THEMES
Plug 'morhetz/gruvbox'                 " gruvbox
Plug 'mangeshrex/uwu.vim'              " uwu 
Plug 'cocopon/iceberg.vim'             " iceberg
Plug 'pacokwon/onedarkhc.vim'          " onedark
Plug 'rakr/vim-two-firewatch'          " two-firewatch
Plug 'AlessandroYorba/Alduin'          " Alduin
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' } " spaceduck
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } "challenger_deep
Plug 'fenetikm/falcon'
Plug 'whatyouhide/vim-gotham'

call plug#end()

"" SET THEME:
set background=dark
colorscheme gotham
let g:gruvbox_contrast_dark = "soft"


" PLUGINS CONFIG ++++++++++++++++++

" ====================== Sexy scroller ======================
let g:SexyScroller_ScrollTime  = 13    " Time taken for buffer to scroll one line or column
let g:SexyScroller_CursorTime  = 3     " Time taken for cursor to travel one line
let g:SexyScroller_MaxTime     = 400   " Maximum amount of time that longer scrolls can take
let g:SexyScroller_EasingStyle = 3     " Choose easing time

" ========================= Rainbow ==========================
let g:rainbow_active = 1
" Clap =============================
let g:clap_layout = { 'relative': 'editor' }

" vim lsp ===========================
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

" Comfortable-Motion =====================
let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 3)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -3)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 6)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -6)<CR>

" Vim-Closetag ===========================
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'





" //////////////////// MAPPINGS \\\\\\\\\\\\\\\\\\\\\\\

" Leader -> \

" Format File
"nnoremap <C-

" Save File
nnoremap <C-s> :w<CR>

" Clear Search highlight
nnoremap <C-c> :nohlsearch<CR>

" Escape Terminal in Neovim
tnoremap <esc> <C-\><C-N>
 
" -> FERN
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :Fern %:h -drawer<CR>

