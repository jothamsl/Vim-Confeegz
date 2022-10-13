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
set shiftwidth=3
set expandtab
set smarttab                " Makes tabbing smarter
set smartindent             " Makes indenting smart
set autoindent              " Good automatic indenting
set number                  " Line Numbers
"set laststatus=1            " Always display the status line
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
Plug 'Shirk/vim-gas'                              " Assembly Syntax Highlight
Plug 'matze/vim-move'                             " Line Mover
Plug 'sbdchd/neoformat'                           " Formatter
Plug 'dense-analysis/ale'                         " Error and Info
Plug 'preservim/nerdtree'                         " File Explorer
Plug 'gelguy/wilder.nvim'                         " Customized Bottom prompt
Plug 'tpope/vim-fugitive'                         " Git Client
Plug 'tpope/vim-surround'                         " Surrounding Modifier
Plug 'sheerun/vim-polyglot'                       " Multi-Language Support
Plug 'jiangmiao/auto-pairs'                       " Autoclosing brackets
Plug 'ryanoasis/vim-devicons'                     " Icons
Plug 'nvim-lualine/lualine.nvim'                  " Status Bar
Plug 'yuttie/comfortable-motion.vim'              " Smooth Scroll
Plug 'nvim-telescope/telescope.nvim'              " Execution Hub
Plug 'prabirshrestha/vim-lsp'                     " Neovim lsp
Plug 'prabirshrestha/asyncomplete-lsp.vim'        " Neovim lsp async
Plug 'prabirshrestha/asyncomplete.vim'            " Auto Complete
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhickKey!'] }    " Show Keybindings



" DEPENDACY PACKAGES
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/vim-lsp-settings'
Plug 'nvim-lua/plenary.nvim'
Plug 'nixprime/cpsm'


" THEMES
Plug 'morhetz/gruvbox'                 " gruvbox
Plug 'ajmwagar/vim-deus'               " deus
Plug 'dylanaraps/wal.vim'              " pywal
Plug 'mangeshrex/uwu.vim'              " uwu 
Plug 'wadackel/vim-dogrun'
Plug 'cocopon/iceberg.vim'             " iceberg
Plug 'pacokwon/onedarkhc.vim'          " onedark
Plug 'rakr/vim-two-firewatch'          " two-firewatch
Plug 'AlessandroYorba/Alduin'          " Alduin
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' } " spaceduck
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } "challenger_deep
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

call plug#end()

" WILDER CONFIGSS \\\\\\\\\\\\\\\\\\\\\\\\\\\\
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#wildmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'pumblend': 20,
      \ }))
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': [
      \   wilder#pcre2_highlighter(),
      \   wilder#python_cpsm_highlighter(),
      \ ],
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ }))

" Can also be passed to the 'highlights' option
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ }))


call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'rounded',
      \ },
      \ 'border': 'rounded',
      \ })))

"" SET THEME:
set background=dark
colorscheme onedarkhc


" PLUGINS CONFIG ++++++++++++++++++

" ====================== Sexy scroller ======================
let g:SexyScroller_ScrollTime  = 13    " Time taken for buffer to scroll one line or column
let g:SexyScroller_CursorTime  = 3     " Time taken for cursor to travel one line
let g:SexyScroller_MaxTime     = 400   " Maximum amount of time that longer scrolls can take
let g:SexyScroller_EasingStyle = 3     " Choose easing time

" ========================= Rainbow ==========================
let g:rainbow_active = 1

" ===================== Lua line =============================

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ' ', right = '|'},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

END

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

" //////////////////// MAPPINGS \\\\\\\\\\\\\\\\\\\\\\\

" Leader -> \

" Save File
nnoremap <C-s> :w<CR>

" Clear Search highlight
nnoremap <C-c> :nohlsearch<CR>

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


